# Way of Work

Configuration for the local attention-management environment. Stowed from
`~/.dotfiles/wow/.wow` to `~/.wow`.

```
Glance      overview, the visual attention surface
  |
attentiond  state aggregation and action bridge
  |
Herdr       execution and workspace environment
  |
OMP         coding and research agent
```

Each layer only talks to the one below it. Glance reads JSON and renders it.
attentiond holds the normalized state and is the only thing that acts. Herdr
owns the terminals. OMP reports its own lifecycle into Herdr through the
installed integration.

## Layout

```
~/.attn/
└── config.toml                    attentiond: sources, polling, GitHub scope

~/.wow/
├── Makefile                       start / stop / restart / logs / status / open
├── README.md
├── bin/
│   ├── attn-run                   run a command, report it to attentiond
│   └── attn-run.test              its tests
├── glance/
│   ├── docker-compose.yml         the container, ports, ATTENTIOND_URL
│   ├── .gitignore                 keeps .env out of the repo
│   ├── assets/user.css            custom CSS, served at /assets/
│   └── config/
│       ├── glance.yml             server settings, includes the page
│       ├── home.yml               the Work page: the four sections
│       ├── attention.yml          the attentiond widgets, included by home.yml
│       └── pull-requests.yml      the GitHub board, included by home.yml
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
| `ui.toast.delivery = "herdr"` | in-app toasts only, no OS notification permissions |
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

| Exit | Reported | |
| --- | --- | --- |
| 0 | `completed` | |
| `--changes-exit N` | `needs_attention` | a result worth reading, not a break |
| anything else | `failed` | including a signal |

`--changes-exit` exists for `tofu plan -detailed-exitcode`, where 2 means the
plan worked and found changes. Calling that a failure would make the one tofu
command you most want on a dashboard lie. The zsh wrapper passes
`--changes-exit 2` when it sees `-detailed-exitcode` on a plan, and the exit
code still reaches you untouched either way.

`bin/attn-run.test` covers this: exit passthrough for 0, 1, 2 and 7, the three
states, and that an unreachable daemon changes nothing. Run it after editing
the wrapper, since it sits in front of `tofu apply`.

## Glance

```bash
make start     # docker compose up -d
make status    # glance, herdr and attentiond in one view
make logs      # follow
make stop
make open      # http://127.0.0.1:8080
```

Pinned to `glanceapp/glance:v0.8.6`. Published on `127.0.0.1:8080` only, so the
dashboard never reaches the LAN. `restart: unless-stopped` means it comes back
with Docker Desktop but stays down after `make stop`.

Glance itself listens on all interfaces inside the container on purpose. Setting
`server.host` to `localhost` in `glance.yml` would bind the container's own
loopback and make the published port dead. The host bind address is what does
the confining.

Config changes are picked up on save. Changes to `docker-compose.yml` or the
environment need `make restart`.

### The page

One page, `Work`, four sections:

| Section | State |
| --- | --- |
| Attention | live, two `custom-api` widgets against attentiond |
| Pull requests | live, `custom-api` over attentiond's GitHub source |
| Meetings | Glance `calendar` widget plus a placeholder for the agenda |
| Scratchpad | placeholder, capture belongs in attentiond, see below |

Pull requests come through attentiond, not from Glance. attentiond polls GitHub
for the open pull requests you authored and the ones waiting on your review,
labels each with the word that explains it (`review requested`, `checks
running`, `rebase required`, `ready to merge`, `stale draft`), and serves them
alongside everything else. The widget filters `/api/work` down to
`source == "github"` with a gjson query, so the board shows every pull request
while the Attention widget above shows only the ones waiting on you.

No GitHub credential lives here. attentiond finds one from `GITHUB_TOKEN`,
`GH_TOKEN`, or `gh auth token`, in that order.

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

Glance fetches JSON server-side, from inside the container, so its widget URLs
use `host.docker.internal`. On Docker Desktop that name resolves to the host and
reaches services bound to the host's `127.0.0.1`, which is the only address
attentiond will listen on. Change the port in one place, `ATTENTIOND_URL` in
`glance/docker-compose.yml`, or by exporting `ATTENTIOND_URL` before `make
start`.

Action links are the other direction. They are submitted by the browser, not by
Glance, so they use a host address:

```
http://127.0.0.1:7717/api/actions/herdr/pane/w1:p1/focus
```

**Glance never runs a Herdr command.** It renders the `href` attentiond puts in
each item and asks attentiond to act. Anything that needs to reach the machine
gets added to attentiond, not to a Glance widget. That is what keeps the
dashboard a read model with buttons, and keeps one place that knows how to touch
Herdr.

While attentiond is down, its two widgets show an error and the rest of the page
is unaffected. This is the normal state of things, not a failure.

## Still manual

- **attentiond is not installed as a service.** Start it from its repository
  with `go run ./cmd/attentiond` and no flags; it reads `~/.attn/config.toml`.
  Add `--herdr-fixture testdata/session-snapshot.json` to see the dashboard
  with data while Herdr is empty. No launchd job yet.
- **Meetings has no data source.** Glance v0.8.6 has no iCal or CalDAV widget,
  and a private `.ics` URL has not been supplied. The widget text spells out the
  two options.
- **Pull requests needs a GitHub credential.** attentiond resolves one from
  `GITHUB_TOKEN`, `GH_TOKEN` or `gh auth token`. Without one the source turns
  itself off and the widget shows no pull requests.
- **`glance/.env` is untracked and optional.** Compose loads it if present. Keep
  tokens there, never in `config/`.
- **Scratchpad holds nothing yet.** Glance's `to-do` widget would store tasks in
  one browser's local storage, a second list of work competing with the one
  attentiond holds. Capture goes to `POST /api/events` when attentiond grows it.

## Removing this

Five files here are new: `Makefile`, `README.md`, `glance/.gitignore`,
`glance/config/attention.yml`, `glance/config/pull-requests.yml`. Delete those,
and `~/.dotfiles/wow/.attn/config.toml` with the `~/.attn` link stow made for
it.

Four already existed and were rewritten in place, so they are restored, not
removed:

- `herdr/config.toml` was an empty file. `: > herdr/config.toml`.
- `glance/config/home.yml` held the stock Glance sample page: calendar, the RSS
  feeds that now live in the Information widget, Twitch channels, Hacker News
  and Lobsters, YouTube videos, two Reddit widgets, London weather, markets, and
  GitHub releases. Take a fresh copy from `docs/glance.yml` in
  [glanceapp/glance](https://github.com/glanceapp/glance/blob/v0.8.6/docs/glance.yml).
- `glance/config/glance.yml` was:

  ```yaml
  server:
    assets-path: /app/assets

  theme:
    custom-css-file: /assets/user.css

  pages:
    - $include: home.yml
  ```

- `glance/docker-compose.yml` was:

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

Never touched, never delete: `glance/.env`, `glance/assets/user.css`, the
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
