# Way of Work

Configuration for the local attention-management environment. Stowed from
`~/.dotfiles/wow/.wow` to `~/.wow`.

```
Dynacat     overview, the visual attention surface
  |
attentiond  state aggregation and action bridge
  |
Herdr       execution and workspace environment
  |
OMP         coding and research agent
```

Each layer only talks to the one below it. Dynacat reads JSON and renders it.
attentiond holds the normalized state and is the only thing that acts. Herdr
owns the terminals. OMP reports its own lifecycle into Herdr through the
installed integration.

## Layout

```
~/.attn/
└── config.toml                    attentiond: sources, queue order, notifications

~/.wow/
├── Makefile                       start / stop / restart / logs / status / open
├── README.md
├── bin/
│   ├── attn-daemon                start / stop / inspect attentiond
│   ├── attn-daemon.test           its tests
│   ├── attn-run                   run a command, report it to attentiond
│   └── attn-run.test              its tests
├── dynacat/
│   ├── docker-compose.yml         the container, ports, ATTENTIOND_URL
│   ├── .gitignore                 keeps .env and data/ out of the repo
│   ├── assets/user.css            custom CSS, served at /assets/
│   ├── data/                      scratchpad tasks in SQLite, gitignored
│   └── config/
│       ├── dynacat.yml            server settings, includes both pages
│       ├── home.yml               the Work page
│       ├── attention.yml          the attention queue, included by home.yml
│       ├── github.yml             the GitHub board, included by home.yml
│       ├── herdr.yml              agents in this Herdr session, beside it
│       ├── all-work.yml           everything attentiond knows, included by home.yml
│       ├── stale.yml              work nothing has happened to in a month
│       └── internet.yml           the Home page, the speed test alone
└── herdr/
    └── config.toml                Herdr config
```

Both live in the same stow package: `~/.dotfiles/wow/.attn` and
`~/.dotfiles/wow/.wow`. attentiond is not a Way of Work component, it is a
daemon with its own repository, so its config sits at the path it looks for on
any machine rather than inside `~/.wow`.

## Herdr

`~/.zshrc` exports `HERDR_CONFIG_PATH="$HOME/.wow/herdr/config.toml"`, and
`~/.config/herdr/config.toml` is a symlink to the same file. The symlink matters:
a Herdr server started from a shell that never sourced `~/.zshrc` still gets this
config instead of silently running on defaults.

```bash
herdr                       # launch or attach to the default session
herdr status                # prints the resolved config path
herdr config check          # validate config.toml
herdr server reload-config  # apply edits to the running server
herdr server stop           # stop everything
```

The config is deliberately small. Every key in it appears in
`herdr --default-config`. What it buys:

| Setting | Effect |
| --- | --- |
| `ui.agent_panel_sort = "priority"` | sidebar is an attention queue, blocked agents first |
| `ui.status_indicators = "symbols"` | distinct glyphs per state instead of colour-only dots |
| `ui.sidebar.agents.rows` | shows `state_text`, the semantic state word, next to each agent |
| `ui.toast.delivery = "off"` | Herdr announces nothing; attentiond owns every popup |
| `ui.sound.enabled = false` | and no sound either, for the same reason |
| `session.resume_agents_on_restore` | agent panes keep their identity across a server restart |

### Agent state

Herdr's semantic states are `working`, `idle`, `blocked`, `done` and `unknown`.
They are lifecycle facts, not screen scrapes, for any agent with a lifecycle
integration installed. The OMP integration is installed:

```bash
herdr integration status    # omp: current (v9)
```

It lives at `~/.omp/agent/extensions/herdr-omp-agent-state.ts`, which is inside
the stow tree, so it is part of this dotfiles repo. Reinstall it with
`herdr integration install omp` after a Herdr upgrade reports it as outdated.

attentiond reads these states over Herdr's local socket
(`~/.config/herdr/herdr.sock`, or `$HERDR_SOCKET_PATH`) and maps them onto its
own vocabulary:

| Herdr | attentiond |
| --- | --- |
| `working` | `working` |
| `idle` | `waiting` |
| `blocked` | `needs_attention` |
| `done` | `done` |

Nothing needs to be enabled for this. The socket API is always on, and
`herdr api snapshot` prints exactly what attentiond polls.

### Focusing a workspace

The CLI verbs that take you back to a piece of work:

```bash
herdr workspace focus <workspace_id>
herdr tab focus <tab_id>
herdr agent focus <target>
```

`herdr pane focus` is directional (`--direction left|right|up|down`), not an
address, so an action link that wants a specific pane goes through attentiond's
socket call rather than this CLI.

## Shell and tofu

`bin/attn-run` runs a command and reports its lifecycle to attentiond:
`working` on start, then `completed` or `failed` with the exit code. The
command keeps the terminal, stdin, stdout, stderr and its exit code pass
through, and every attentiond call is best effort, so a daemon that is down can
never break the command you actually ran.

```bash
attn-run tofu plan
attn-run --title "deploy prod" -- ./deploy.sh
```

`~/.zshrc` puts `~/.wow/bin` on `PATH` and wraps `tofu` so the slow
subcommands (`plan`, `apply`, `destroy`, `init`, `refresh`, `import`, `test`,
`validate`) go through it. Everything else calls the binary directly, because a
dashboard entry for `tofu version` is noise.

Items land under source `shell`, identified by directory plus command line, so
re-running the same thing in the same place moves one item through its states
instead of stacking up. Finished ones disappear after `[events] ttl`, an hour
by default.

### Exit codes

| Exit | Flags | Reported |
| --- | --- | --- |
| 0 | | `completed` |
| 0 | `--awaits-approval` | `needs_attention`, labelled `waiting for approval` |
| 0 | `--awaits-approval --changes-exit N` | `completed`; the command said there is nothing to do |
| N | `--changes-exit N` | `needs_attention`, labelled if `--awaits-approval` |
| anything else | | `failed`, including a signal |

`--changes-exit` exists for `tofu plan -detailed-exitcode`, where 2 means the
plan worked and found changes. Calling that a failure would make the one tofu
command you most want on a dashboard lie. The exit code still reaches you
untouched in every row above.

The third row is the one worth reading twice. `--changes-exit` does two jobs:
it names the exit code that means "changes", and it tells `attn-run` that zero
now means "no changes". A plan that saved a file applying nothing is finished,
not waiting for you, and asking for approval anyway is the fastest way to teach
yourself to ignore the queue.

### Approvals and the state lock

`tofu apply` on its own takes the state lock, plans, then stops at a
confirmation prompt while still holding it. Miss the prompt and the lock sits
held by a process doing nothing, which costs everybody else, not you.

The wrapper steers you off that path. `tofu plan -out=FILE` releases the lock
when it finishes and leaves a decision behind, so `attn-run --awaits-approval`
reports it as `waiting for approval` rather than completed. `[attention]
top_labels` puts that at the top of the Attention block, above a mergeable pull
request and above a meeting about to start, and `[notify] labels` turns it into
a system notification with a sound.

Both halves report under one item id, `<directory>:tofu approval`, so
`tofu apply FILE` clears the approval: it reports `working` under the same
identity, then `completed`, and the item drops to `done` and ages out.

The `plan` options accumulate rather than choosing a branch, because the two
flags are independent:

| Command | Options passed |
| --- | --- |
| `tofu plan` | none |
| `tofu plan -detailed-exitcode` | `--changes-exit 2` |
| `tofu plan -out=tfplan` | `--id <dir>:tofu approval --awaits-approval` |
| `tofu plan -out=tfplan -detailed-exitcode` | both, in either flag order |
| `tofu apply tfplan` | `--id <dir>:tofu approval` |
| `tofu apply -var-file=x.tfvars` | none, because it is not applying a saved plan |

Only `-out` earns an approval. A plan without it leaves nothing on disk to
apply, so there is nothing to approve and it stays an ordinary item.

The word `waiting for approval` is written in three places and all three must
agree: `bin/attn-run`, and `top_labels` and `labels` in `~/.attn/config.toml`.

A mid-run prompt inside a bare `tofu apply` is still invisible. `attn-run`
passes stdin, stdout and stderr straight through and never reads them, which is
exactly why it cannot break the command it wraps. Seeing a prompt would mean
matching patterns against terminal output through Herdr's `pane.output_matched`,
and a saved plan removes the prompt instead.

`bin/attn-run.test` covers this: exit passthrough for 0, 1, 2 and 7, every
reported state, both flags together in both outcomes, that the approval label
appears only when asked for, and that an unreachable daemon changes nothing.
Run it after editing the wrapper, since it sits in front of `tofu apply`.

## Dynacat

```bash
make start     # docker compose up -d
make status    # dynacat, herdr and attentiond in one view
make logs      # follow
make stop
make open      # http://127.0.0.1:8080
```

Pinned to `panonim/dynacat:3.0.0`. Published on `127.0.0.1:8080` only, so the
dashboard never reaches the LAN. `restart: unless-stopped` means it comes back
with Docker Desktop but stays down after `make stop`.

Dynacat itself listens on all interfaces inside the container on purpose. Setting
`server.host` to `localhost` in `dynacat.yml` would bind the container's own
loopback and make the published port dead. The host bind address is what does
the confining.

Config changes are picked up on save. Changes to `docker-compose.yml` or the
environment need `make restart`.

The UI editor (`server.allow-editing: false`, `ENABLE_EDITOR: "false"`) is
disabled. It writes YAML back into the mounted config directory, which is a
stow-managed tree of hand-written, version-controlled files. An editor write
would bypass git and silently overwrite comments and intent.

### Why Dynacat instead of Glance

Glance polls each widget on its cache timer. The page is stale until the next
poll fires, and a short cache taxes attentiond for nothing when nothing has
changed. Dynacat pushes page updates over SSE; `custom-api` widgets get their
own `update-interval` independent of `cache`. The attention queue updates every
5 seconds and the page changes under you without a reload. That is what the
stack is for.

### The pages

`Work` is the landing page at `/`, seven blocks:

| Section | State |
| --- | --- |
| Attention | live, `custom-api` widget against `/api/attention`, 5s interval |
| GitHub | live, `custom-api` over attentiond's GitHub source, 30s interval |
| Herdr | live, agents and wrapped commands, beside GitHub, 5s interval |
| All work | live, everything the daemon holds, 30s interval |
| Stale | live, `/api/stale`, 5m interval, collapsed |
| Scratchpad | live, Dynacat `to-do` widget, tasks in SQLite on this host |
| Calendar | Dynacat `calendar` widget, month grid only |

`WOW` is the second page, at `/wow`, fetched from the public
`mcgeerdev/.dotfiles` repository with a 1h cache:

| Block | State |
| --- | --- |
| Patterns | `custom-api` over `wow/.omp/audits/patterns/summary.json` on `main` |
| Changelog | `custom-api` over the GitHub releases API, latest release notes |

`Home` is the third page, at `/home`, with two blocks:

| Block | State |
| --- | --- |
| Internet | live, Dynacat `monitor` widget, three sites, 2m interval |
| Speed test | Dynacat `speedtest` widget over LibreSpeed, 6h interval |

GitHub items come through attentiond, not from Dynacat. attentiond polls GitHub
for the open pull requests you authored, the ones waiting on your review, and
the ones you have already reviewed, labels each with the word that explains it
(`review requested`, `checks running`, `rebase required`, `ready to merge`,
`stale draft`), and serves them alongside everything else.

That third search is the one that catches a pull request you approved and now
have to merge: approving it consumes the review request, so without it the
branch disappears from the board exactly when it becomes your job. Each item
says which search found it in `context.role`: `author`, `reviewer` or
`reviewed`.

The widget filters `/api/work` down to
`source == "github"` with a gjson query, so the board shows every pull request
while the Attention widget above shows only the ones waiting on you.

No GitHub credential lives here. attentiond finds one from `GITHUB_TOKEN`,
`GH_TOKEN`, or `gh auth token`, in that order.

Herdr sits beside it in a `split-column`, covering everything happening in the
terminal. Two sources feed it, with a column saying which:

| Kind | Source | One row per |
| --- | --- | --- |
| `AGENT` | `herdr` | detected agent, with an Open button that focuses the pane |
| `TERM` | `shell` | command run through `attn-run` |

Both run inside Herdr panes, which is why one block covers them. GitHub is the
remote half of "what is in flight" and this is the local half.

The rows are attentiond's own order, filtered inside the loop rather than by a
gjson query. A query matches one source at a time, and merging two of them
would mean re-sorting what the daemon already sorted; Dynacat's `append` only
returns `[]any`, which its sort helpers will not take anyway.

An agent row shows its workspace, a command row shows the command. Both show
the last two segments of the directory, because a workspace label is not
unique: two of mine are both called `tofu`, one in `sites/cloudapi-dev` and one
in `sites/cloudapi-prod`, and the path is the only thing that separates them.
The tab name and the agent kind appear only when they say something: Herdr
numbers a tab it has no name for and otherwise names it after the agent, and
the kind is the same word on every row.

Only agents appear under `AGENT`. attentiond does not report a pane running an
ordinary shell, so this is every agent and the tab it is in, not every tab.

#### A Dynacat bug this works around

`split-column` renders a `.masonry` container and `masonry.js` is supposed to
move its children into `.masonry-column` wrappers. It never does: the page
fetches its content and morphs it in *after* `setupMasonries()` runs, so the
container initialises while empty, `items.length` is 0, the column count clamps
away, and `data-initialized` then stops it re-running when the widgets arrive.
The two widgets end up as bare flex items about 100px wide inside an 800px
column.

`user.css` gives those orphaned children the sizing and wrapping the columns
would have had, using masonry's own 330px `minColumnWidth` as the flex basis.
Two fit while there is room for two, and they stack below roughly 640px of
window. The rules are scoped to `.masonry > .widget`, so if the bug is fixed
upstream the children become `.masonry-column` and the rules stop applying with
no cleanup needed.

### Item states

attentiond puts a `tone` field on every item. The widget templates read it to
pick a CSS class; `user.css` turns that class into a colour. The six tones are
the complete vocabulary:

| Tone | Meaning | CSS class |
| --- | --- | --- |
| `ready` | one action from finished; `ready to merge` is the only example | `.tone-ready` |
| `attention` | wants you now: review requested, changes requested, rebase required, blocked agent, meeting starting soon | `.tone-attention` |
| `failed` | broken: checks failing, failed command | `.tone-failed` |
| `active` | running: working, checks running, meeting in progress | `.tone-active` |
| `done` | finished and unread | `.tone-done` |
| `neutral` | somebody else's turn | `.tone-neutral` |

`ready` gets the strongest treatment on screen: its own amber accent colour,
bold weight, a left border, and a `>` glyph. Every tone also carries a glyph
because colour alone fails for anyone who cannot separate red from green.

The words (`ready to merge`, `review requested`, etc.) come from the daemon via
the `label` field. The templates never construct them; they only render them.

### Queue order

The daemon sorts. The templates render in the order they receive, so what sits
at the top is a decision in `~/.attn/config.toml` and in attentiond, not in a
widget. Highest first:

| Rank | What sits there |
| --- | --- |
| 110 | anything you bumped by hand |
| 100 | a saved tofu plan waiting for approval, from `[attention] top_labels` |
| 50 | a meeting starting soon, the only work here with a deadline |
| 40 | a pull request ready to merge |
| 30 | a review requested in a `[github] priority_repos` repository, which is `didx-xyz/tofu` |
| 20 | a review requested anywhere else |
| 10 | everything else that wants you: a blocked agent, failing checks, a rebase |
| 5 | done and unread |
| 0 | running, or somebody else's turn |

Finished work leaves the Attention section after `[attention] done_ttl`, ten
minutes here, and keeps appearing in All work below it. Herdr only retires a
done pane when you focus it, so without that clock a finished agent you never
clicked would hold a place in the queue for as long as the pane stayed open.

### Snooze, bump, stale

Each control has one home, so no row carries a button that does nothing for
it. Both decisions outlive a daemon restart: attentiond keeps them in
`~/.local/state/attentiond/decisions.json`, the one piece of state no source
can rebuild.

| Button | Where it is |
| --- | --- |
| `Snooze 4h`, `Bump` | Attention, beside Open |
| `Bump` | Stale, beside Open |
| `Wake`, `Unbump` | All work, on the rows carrying a decision |

`Snooze 4h` takes an item out of the Attention section for the rest of the
working stretch. It stays in All work, greyed and marked `zz`, with `Wake`
beside it: that is the only section that still shows a snoozed item, which is
why undo lives there and not in the queue that dropped it. Notifications about
it stop too. The snooze ends early when the item's label moves, so a review you
deferred comes straight back when it turns into `ready to merge`: that is new
information, not the thing you postponed.

`Bump` puts one item above everything, rank 110, marked `^`. It is the same
kind of statement as `top_labels`, one week at a time instead of one class of
work forever, so it goes above it. `Unbump`, in All work, gives the source's
own rank back.

`[attention] stale_after`, thirty days here, is the other end. Past it an item
leaves the Attention section, the GitHub board and All work, and appears only
under Stale. The clock is the item's own: for a pull request that is the last
push, review or comment, so thirty days means nobody has touched the work, not
that you stopped scrolling. All work prints the count it is holding back, so
the board never looks complete when it is not. Bump is the way out, and a
bumped item cannot go stale again until it is cleared.

### Notifications

A dashboard only works on somebody who is looking at it. attentiond is the
other half, and on this machine it is the only thing allowed to interrupt you:
`[notify] route = "system"` posts to macOS Notification Center through
`terminal-notifier`, and Herdr's own toasts and sounds are off.

The route matters because Herdr's `[ui.toast] delivery` is one switch over
everything Herdr shows, socket calls included. Silencing Herdr's agent toasts
through it would have silenced attentiond too, so attentiond stopped going
through Herdr.

`[notify] labels` names what is worth an interruption:

| Label | What it means |
| --- | --- |
| `done` | an agent finished a turn, or a wrapped command finished |
| `blocked` | an agent is waiting on you |
| `waiting for approval` | a saved tofu plan nobody has applied |
| `checks running` | a pull request started its checks |
| `ready to merge` | a pull request is green and approved |

OMP's own notifications are off (`completion.notify`, `ask.notify`). It routed
them through `herdr notification show`, which is the same popup attentiond
already posts for `done` and `blocked`.

Only a change notifies, never a first sighting. A repeat of the same label on
the same item is suppressed for fifteen minutes, unless the item goes back to
working in between: two agent turns four minutes apart are two notifications,
a pull request bouncing between `ready to merge` and `approved` is one. A
change that happens while the daemon is down is never announced, and the item
is at the top of the queue when it comes back.

A snoozed item is silent: it is the one popup you have already refused. The
snooze lapses when the item's label moves, so the change that ends it still
reaches you.

### Scratchpad

A Dynacat `to-do` widget with `storage: server`, so tasks sit in SQLite at
`dynacat/data/dynacat.db` rather than in one browser's localStorage. The
default path is `/app/assets/dynacat.db`, which would drop a database into a
stow-managed, version-controlled directory; `server.db-path` moves it to a
gitignored bind mount.

It is not in attentiond, and that is the point. The daemon models work with a
lifecycle: something starts, runs, finishes, or wants a human. A half-formed
thought has no lifecycle, and posting it to `/api/events` would file it in the
attention queue, which is the one place it does not belong. The queue is for
things that are already work.

### Internet

Two questions on two timescales, so two blocks. The `monitor` widget answers
"is the link up", the speed test answers "what throughput am I getting", and
neither answers the other.

`monitor` sends one GET per site per check and calls a site OK on HTTP 200.
The three sites are Cloudflare's resolver, Google's resolver and GitHub: two
independent resolvers so one provider having a bad day does not read as an
outage, and GitHub because it is what attentiond polls. All three answer 200
to a plain GET from inside the container, so no `alt-status-codes` are set.
Each row shows the status, the response time and a strip of ticks for recent
checks. At `cache: 2m` the strip covers the last 30 minutes; it is held in
memory and starts empty after a container restart.

The page uses the default 1600px width. At `slim` the three sites pack into
columns narrow enough to clip `200 OK • 50ms`.

### Speed test

The speed test runs on its interval, not when you open the page, so `/home`
shows the last result until the timer fires. No `server` is set, so the widget
picks a public LibreSpeed server and saturates the link for 15 seconds in each
direction; that is why the interval is hours. The test runs from inside the
container, through Docker Desktop's VM, so the number is the link as the
container sees it, not as the host sees it. Dynacat ships the widget as work
in progress and it renders a WIP badge.

### Which repositories

By default attentiond watches every repository your token can see, which is
more than you want. Scope it in `~/.attn/config.toml`:

```toml
[github]
orgs = ["didx-xyz", "mach4-braai"]
repos = ["mcgeerdev/portfolio"]
```

Accounts and repositories union rather than intersect. A malformed entry fails
startup instead of quietly narrowing the queue to nothing, and a key attentiond
does not recognise fails startup too.

If a search matches more pull requests than `[github] limit`, both widgets say
so in red rather than showing a capped list that looks complete.

## The attentiond boundary

attentiond is a separate repository. It is expected at `http://127.0.0.1:7717`
and serves:

```
GET  /api/attention                                  what wants a human
GET  /api/work                                       everything it knows
GET  /health
POST /api/events                                     any local process reports lifecycle
POST /api/actions/{source}/{kind}/{target}/{action}  go back to where the work is
```

Dynacat fetches JSON server-side, from inside the container, so its widget URLs
use `host.docker.internal`. On Docker Desktop that name resolves to the host and
reaches services bound to the host's `127.0.0.1`, which is the only address
attentiond will listen on. Change the port in one place, `ATTENTIOND_URL` in
`dynacat/docker-compose.yml`, or by exporting `ATTENTIOND_URL` before `make
start`.

Action links are the other direction. They are submitted by the browser, not by
Dynacat, so they use a host address:

```
http://127.0.0.1:7717/api/actions/herdr/pane/w1:p1/focus
```

Dynacat never runs a Herdr command. It renders the `href` attentiond puts in
each item and asks attentiond to act. Anything that needs to reach the machine
gets added to attentiond, not to a Dynacat widget. That is what keeps the
dashboard a read model with buttons, and keeps one place that knows how to touch
Herdr.

While attentiond is down, its widgets show an error and the rest of the page
is unaffected. This is the normal state of things, not a failure.

## WOW automation

Four LaunchAgents audit omp usage and turn it into one weekly release PR.
Agents commit and push; you merge the PR; everything after the merge is
automatic.

| Label | Script | When | Does |
| --- | --- | --- | --- |
| `wow.usage-digest` | `bin/usage-digest` | Mon 09:00 | weekly JSON digest from `stats.db` and `history.db` (sonnet), commit, push, open the release PR if none is open |
| `wow.wow-improve` | `bin/wow-improve` | Mon 09:45 | up to 3 improvement commits citing the digest, rewrites the PR body (default model) |
| `wow.usage-patterns` | `bin/usage-patterns` | 1st, 09:30 | monthly patterns JSON plus the dashboard `summary.json` (sonnet) |
| `wow.wow-sync` | `bin/wow-sync` | daily 10:00 | after a merge: fast-forward `~/.dotfiles` to `origin/main`, re-stow `wow`, reinstall the other three agents |

Every job also has `RunAtLoad`, so it fires at login. launchd runs a job
missed during sleep at the next wake but drops one missed while the machine
was off; the login firing covers that. Each script checks first whether its
work is already done (a digest dated this calendar week, month already
reported, improvements committed since the digest, `main` current) and
exits without posting anything. Real runs go through `attn-run`, so they
show on the dashboard and as a notification, but only while attentiond is
up. It is started by hand (see Still manual), so a catch-up run at login
usually finishes before it exists and its event is dropped. The launchd
log is the record that always exists.

The release flow copies `didx.projects/mono`'s, inverted: the release branch
carries the real changes.

- The current branch is the newest `release/YYYY.MM.N` on origin. Agents work
  in the worktree `~/.dotfiles-release`, which `bin/wow-worktree` creates and
  fast-forwards. `~/.dotfiles` stays on `main` as the live stow tree.
- One PR, `Release YYYY.MM.N` (label `release`), grows until you merge it.
  It also sits on the Pull requests board, because `mcgeerdev/.dotfiles` is in
  `[github] repos`.
- Merging runs `.github/workflows/release.yaml`: tag `YYYY.MM.N`, GitHub
  release with the PR body as notes, then the next `release/*` branch from
  `.github/workflows/scripts/calver.sh`.
- The `master` ruleset on `main` allows squash merges only, so each release
  lands as one commit. The per-change commits stay reachable from the PR
  ref after the branch is deleted: `git fetch origin refs/pull/<n>/head`,
  then `git revert <sha>` on the current release branch backs one out.
- Deletions are `git mv` into `archive/wow/YYYY-MM/<path>`, never `git rm`.

Outputs, on the release branch: `wow/.omp/audits/weekly/YYYY-MM-DD.json`,
`wow/.omp/audits/patterns/YYYY-MM.json` and `patterns/summary.json`. The
instructions are `skill://usage-audit/{digest,patterns,improve}.md`. Logs go
to `~/Library/Logs/wow.<job>.log`. The jobs run omp with
`--config omp-headless.yml`, which turns the advisor off: it reviews
interactive turns, and here the PR review does that job.

```bash
make digest-install    # copy the plists into ~/Library/LaunchAgents and load them
make digest-status     # state and last exit code per job
make digest-run        # kickstart a job now; also patterns-run, improve-run, sync-run
make digest-uninstall
```

The plists are copied, not stowed: launchd's handling of symlinked plists
varies by macOS version. `wow-sync` reinstalls with `WOW_SKIP=wow.wow-sync`,
because booting out its own label would kill it mid-run. It fails loudly if
`main` has local commits, since nothing but release merges should land there.

## Still manual

- attentiond is not installed as a service. Start it from its repository
  with `go run ./cmd/attentiond` and no flags; it reads `~/.attn/config.toml`.
  Add `--herdr-fixture testdata/session-snapshot.json` to see the dashboard
  with data while Herdr is empty. It has no launchd job; the WOW agents above
  still run while it is down, and `attn-run` drops their events.
- GitHub needs a credential. attentiond resolves one from `GITHUB_TOKEN`,
  `GH_TOKEN` or `gh auth token`. Without one the source turns itself off and
  the widget shows no pull requests.
- `dynacat/.env` is untracked and optional. Compose loads it if present. Keep
  tokens there, never in `config/`.
- `dynacat/data/dynacat.db` is the scratchpad, and nothing backs it up. It is
  one table, `todo_tasks`, keyed by `list_id` and `position`.

## Removing this

Nine files here are new: `Makefile`, `README.md`, `dynacat/.gitignore`,
`dynacat/config/attention.yml`, `dynacat/config/github.yml`,
`dynacat/config/herdr.yml`, `dynacat/config/all-work.yml`,
`dynacat/config/stale.yml`, `dynacat/config/internet.yml`. Delete those, and
`~/.dotfiles/wow/.attn/config.toml` with the `~/.attn` link stow made for it.

The WOW automation adds `launchd/`, `dynacat/config/wow.yml`,
`omp-headless.yml`, `bin/wow-worktree`, `bin/usage-digest`,
`bin/usage-patterns`, `bin/wow-improve` and `bin/wow-sync`. Run
`make digest-uninstall` first, then
delete them and `git worktree remove ~/.dotfiles-release`.

Four already existed and were rewritten in place, so they are restored, not
removed. They arrived as Glance's vendored defaults, in a directory called
`glance/` before the move to Dynacat:

- `herdr/config.toml` was an empty file. `: > herdr/config.toml`.
- `dynacat/config/home.yml` held the stock sample page: calendar, the RSS feeds
  that now live in the Information widget, Twitch channels, Hacker News and
  Lobsters, YouTube videos, two Reddit widgets, London weather, markets, and
  GitHub releases. Take a fresh copy from `docs/docs/dynacat.yml` in
  [Panonim/dynacat](https://github.com/Panonim/dynacat/blob/main/docs/docs/dynacat.yml).
- `dynacat/config/dynacat.yml` was:

  ```yaml
  server:
    assets-path: /app/assets

  theme:
    custom-css-file: /assets/user.css

  pages:
    - $include: home.yml
  ```

- `dynacat/docker-compose.yml` was:

  ```yaml
  services:
    glance:
      container_name: glance
      image: glanceapp/glance
      restart: unless-stopped
      volumes:
        - ./config:/app/config
        - ./assets:/app/assets
        - /etc/localtime:/etc/localtime:ro
      ports:
        - 8080:8080
      env_file: .env
  ```

Never touched, never delete: `dynacat/.env`, `dynacat/assets/user.css`, the
`~/.wow` stow link itself, and the `HERDR_CONFIG_PATH` export in `~/.zshrc`.
All four predate this setup.

Then, in order:

```bash
make stop
herdr integration uninstall omp

# Restore a regular Herdr config in place of the symlink. These were the
# settings before this setup existed.
unlink ~/.config/herdr/config.toml
cat > ~/.config/herdr/config.toml <<'TOML'
onboarding = false

[ui]
status_indicators = "symbols"

[theme]
name = "terminal"
auto_switch = false
TOML
herdr server reload-config
```

Dropping the `HERDR_CONFIG_PATH` line from `~/.zshrc` is optional and
unrelated. Herdr tolerates the path being absent and falls back to
`~/.config/herdr/config.toml`.
