# omp battery drain audit

Date: 2026-09-24. omp 18.3.0 on macOS 27.0, Apple Silicon. Measured on AC power at 58% charge.

## Short answer

An omp session with nothing running is cheap. I measured 0.1 to 1.3% CPU, about 3 to 5 wakeups per second, zero bytes written to the terminal, no network sockets and no power assertion. That alone does not explain a battery that drains faster.

Three other things do:

1. Sessions that look idle can still be working. herdr's agents view marks a session idle on `agent_end`. Background bash jobs, bash commands that omp moved to the background after 60 seconds, and subagents keep going after that. When they finish they start a new turn, and every turn holds a power assertion.
2. Your config sets `power.sleepPrevention: system`. During every turn that means `caffeinate -i -d -s -u`. The display cannot idle-sleep, and `-u` turns the display back on if it was off. A 20-minute CI poll keeps the screen lit for 20 minutes.
3. Every session that has run at least one turn keeps a local embedding worker alive. From the bundle, I found nothing that stops it before the session exits. That is about 700 MB and 11 to 22 wakeups per second per session, on a Mac that already had 5.7 GB of swap in use.

Polling is the worst case because it stacks all of this. The spinner redraws 12.5 times a second, herdr and Ghostty redraw with it, a `gh` process spawns every 3 to 15 seconds, and the display stays on the whole time.

## What I measured

Sample windows were 3 to 5 seconds, taken with `/usr/bin/top -stats pid,command,cpu,idlew,power,mem`. I got the PTY rate by reading the tty write offset with `lsof -Fo` twice, 20 seconds apart.

| Session state | Process | CPU | Wakeups/s | Footprint | Terminal output |
| --- | --- | --- | --- | --- | --- |
| Idle, never prompted (pid 75709) | omp | 0.1 to 0.8% | 3 to 5 | 545 MB, 460 MB of it compressed | 0 B/s |
| Idle after one turn (pid 82857) | omp | 0.8 to 1.3% | about 5 | 564 MB | not measured |
| Same session | embed worker (pid 85964) | 0.2 to 0.3% | 11 to 22 | 707 MB, peak 964 MB | none |
| Working, waiting on a tool (pid 75728) | omp | 3.5 to 4.8% | 27 to 35 | 609 MB | about 1,250 B/s |
| Same moment | herdr server | 2.7 to 3.8% | about 18 | 40 MB | |
| Same moment | Ghostty | 5 to 13% | about 17 | 276 MB | |

The working row is a session sitting in a bash tool doing nothing. No tokens were streaming. All of that cost is rendering. omp redraws, herdr parses the PTY stream and redraws, then Ghostty redraws. That adds up to 11 to 22% CPU across three processes, just to animate a spinner.

`sample` on the idle session showed every thread blocked in `kevent`, `__psynch_cvwait`, `__ulock_wait2` or `mach_msg`. There were about 51 on-CPU samples in 10 seconds, roughly 0.5% of one core. The first 5-second sample did catch three short `git` subprocesses, each 13 to 19 ms long. I could not reproduce that in a second 10-second sample or with a 60-second child-process watch, and touching a file in the repo did not trigger it. So it happens, but rarely.

## 1. "Idle" in herdr does not mean omp is done

The herdr integration in `extensions/herdr-omp-agent-state.ts` reports `working` on `agent_start` and `idle` 250 ms after `agent_end`. Work that outlives the turn:

- `bash.autoBackground` moves any bash command that runs past 60 seconds into the background. The turn ends, herdr shows idle, the command keeps running.
- `async: true` bash jobs, named services and subagents behave the same way.
- When any of them finishes, omp's `yieldQueue.injectIdle` starts a new prompt. The bundle shows it bumping the busy counter first, which takes the power assertion again.

This is the most likely path from "a few idle sessions" to a flat battery. I could not prove it happened on a specific day because `pmset -g log` only kept assertion history from 13:29 onward.

## 2. `power.sleepPrevention: system` holds the display on

From the omp bundle, `powerAssertionOptions()` maps the setting to these flags:

| Level | Flags | Effect |
| --- | --- | --- |
| `idle` (default) | `-i` | System does not idle-sleep |
| `display` | `-i -d` | Display does not idle-sleep either |
| `system` (yours) | `-i -d -s -u` | Also blocks all sleep on AC and declares the user active |

`man caffeinate` says `-s` is "valid only when system is running on AC power". On battery it does nothing. It also says `-u` "turns the display on and prevents the display from going into idle sleep" if the display is off. So on battery, `system` gives you nothing beyond `display` except a screen that wakes up when a background job finishes.

The assertion is reference-counted per session. omp takes it when the busy count goes from 0 to 1 and drops it when the count returns to 0. What I saw:

- The session running this audit held `PreventUserIdleSystemSleep`, `PreventUserIdleDisplaySleep`, `PreventSystemSleep` and `UserIsActive` for the entire turn. It was past 8 minutes at the last check.
- pid 82857 held all four for 24 seconds, the length of its turn.
- pid 75709 was idle and held none.

Keeping the display lit through long polling turns is, I expect, the single biggest battery cost here, well ahead of a few idle processes [INFERENCE: I did not measure display power].

## 3. The embedding worker never exits while the session lives

Mnemopi runs `omp __omp_worker_mnemopi_embed` for local embeddings. The default model is `BAAI/bge-small-en-v1.5`. The session spawns the worker on the first turn. pid 85964 started when 82857's turn began and was still alive 5 minutes after that turn ended. In the bundle the only timer on the worker client is a 120-second per-request timeout, `fGa = 120000`. I found no idle shutdown, so I expect the worker to live until the session exits. That part comes from reading the bundle, not from watching a worker for hours.

While idle, one tokio runtime thread inside `pi_natives` wakes 11 to 22 times per second. That is more wakeups than the omp process itself.

Memory at measurement time:

- 23 GB used, 8.4 to 10 GB held by the compressor, 5.7 of 7.2 GB swap in use.
- The six omp processes had a combined footprint of about 3.3 GB. That covers three sessions, two embed workers and one eval worker.
- The largest process on the machine was Docker Desktop's VM at 4.0 GB, plus 5.5 GB compressed. Docker was not part of this investigation, but it is a bigger memory cost than omp.

When memory is under pressure, the kernel spends CPU compressing and decompressing pages and writes swap to the SSD. That costs energy, though I did not measure how much.

## 4. Polling costs

`run_watch` in omp's github tool polls every 3 seconds for the first minute, then every 15 seconds, according to `omp://tools/github.md`. Each poll spawns `gh`. I timed one `gh api` call with `/usr/bin/time -l`:

- 0.22 s CPU, split 0.09 user and 0.13 sys. 1.32 billion instructions, 49 MB peak RSS, 0.9 s wall time.
- That works out to about 20 spawns and 4.4 s of CPU in the first minute, then 4 spawns a minute.

Polling from bash is worse. Think `sleep 30 && gh pr checks`, or `gh pr checks --watch`. Each loop iteration that returns to the model is another full LLM request, with streamed output rendered through omp, herdr and Ghostty.

The whole time, the turn is active. That means the spinner, the title animation and the display-on assertion all run for as long as the poll does.

### The `/omfg` rule has two gaps

`rules/no-unrequested-plan-run-watch.md` uses `condition: "run_watch"` with `scope: "tool"`. I hit both problems while writing this:

1. It matches any tool output that contains the string. It fired and interrupted me when I read the rule file itself. It will also fire on docs, greps and transcripts that mention `run_watch`.
2. It only catches the github tool's `run_watch` op. `gh run watch` has a space instead of an underscore. That command, `gh pr checks --watch` and bash `sleep` loops do not contain the string, so an agent that polls from bash walks straight past the rule.

## 5. Spinners run at 12.5 fps

The bundle has several 80 ms timers that run while a session is working:

- `SPINNER_ADVANCE_MS = 80`, the shared working spinner. I found no setting that changes it.
- A terminal title spinner at 80 ms that writes `ESC ]0;<title> BEL` every frame. `tui.titleState` controls it, and it defaults to `true`.

The 1,250 B/s of terminal output I measured from a working session works out to about 100 bytes per 80 ms frame, which lines up with those two timers. Every one of those writes wakes herdr and Ghostty.

`display.shimmer: disabled` and `display.smoothStreaming: false` are already set, so the shimmer and streaming animations were not a factor.

## herdr

You said not to dig into herdr, so I only looked at its totals. Over 8 days 5 hours of uptime, `herdr server` used 82 minutes of CPU, about 0.7% on average. The client used 19.5 minutes. Their average wakeup rates were 4.5 and 6.5 per second. herdr's cost goes up when a visible pane is animating, and that comes back to the omp spinner, not herdr.

## Recommendations

These are ordered by expected battery impact. I have not changed any config. Each one is your call.

### 1. Drop `power.sleepPrevention` to `idle`

```yaml
power:
  sleepPrevention: idle
```

The system still will not idle-sleep in the middle of a turn. The display can dim and sleep again, and finished background jobs stop turning the screen on. What you give up is `-s`, which only matters on AC. Only the `system` level sets it, so it is the only level that keeps agents running with the lid shut on AC [INFERENCE: I did not test lid-close behaviour]. If you need that for a long run, switch back with `omp config set power.sleepPrevention system` for that run. The middle level, `display`, keeps the screen awake too, so it does not help battery.

### 2. Close sessions you are finished with

Every session that has run a turn holds about 1.2 GB between omp and its embed worker, and the worker adds 11 to 22 wakeups per second. Exiting the session frees both. Leaving five sessions open "just in case" costs about 6 GB on a machine that is already swapping.

### 3. Turn off the title spinner

```yaml
tui:
  titleState: false
```

This stops 12.5 title writes per second from every working session, so herdr and Ghostty stop waking for them. You lose the working and your-turn glyph in the terminal title. herdr gets agent state from its extension socket, so the agents view should keep working [INFERENCE: I read the extension, but did not test herdr with this setting off]. The bundle skips the write when the title string has not changed, so I expect this to stop the writes even if omp's internal timer keeps ticking [INFERENCE].

### 4. Close the polling loopholes

Limit the rule to the github tool so reading or grepping text that mentions it no longer triggers it. The scope syntax follows the `tool:edit(*.go)` form used by the built-in rules. Confirm it with `omp ttsr test` before relying on it.

```yaml
scope: "tool:github"
```

Then add a `bashInterceptor` entry for the bash forms, next to your existing ones in `config.yml`:

```yaml
- pattern: "\\bgh\\s+(?:run\\s+watch\\b|pr\\s+checks\\b[^\\n]*--watch\\b)"
  tool: bash
  flags: m
  message: "Do not watch CI from bash. Open the PR, report the URL, and hand the checks to the reviewer."
```

A broader pattern for `while`/`until ... sleep` loops would catch hand-rolled polling too. It would also block legitimate waits, like waiting for a local server to come up, so I would leave it out unless the narrow pattern turns out not to be enough.

### 5. Upstream asks for omp

These need changes in omp itself, not in your config:

- A setting to slow or disable the 80 ms working spinner, `SPINNER_ADVANCE_MS`. A reduced-motion flag would do.
- An idle timeout for the Mnemopi embed worker, so it exits after a few minutes without requests.
- Split `-u` out of `system`, or document that it turns the display on.

## How to check a change worked

```sh
# Which omp sessions hold assertions right now
pmset -g assertions | grep "omp agent session"

# How long each assertion was held today
pmset -g log | grep "omp agent session"

# Per-process CPU, wakeups and energy for omp, herdr, Ghostty
/usr/bin/top -l 3 -s 5 -stats pid,command,cpu,idlew,power,mem | grep -E "omp|herdr|ghostty"

# Lingering embed workers
pgrep -lf __omp_worker_mnemopi_embed
```

System Settings > Battery also lists apps using significant energy over the last 24 hours, which gives a better long-term view than these point samples.

## Limits of this audit

- Every number is a point sample of a few seconds. I did not measure package or display power. That needs `sudo powermetrics`, and I did not run anything with sudo.
- The Mac was on AC during the measurements. CPU and wakeup figures do not depend on the power source. The assertion behaviour does, as described above.
- omp is a compiled Bun binary. Code-level claims come from strings extracted from `~/.local/bin/omp`, with minified names like `cEt`, `fGa` and `Vfa`. They can change in any omp release.
- `pmset -g log` only had assertion history from 13:29 today, so I could not reconstruct how long sessions held assertions on earlier days.

## Rollback

I made no config changes. If you apply the recommendations and want to undo them:

```sh
omp config set power.sleepPrevention system
omp config set tui.titleState true
```

For the rule and interceptor, revert `rules/no-unrequested-plan-run-watch.md` and the `bashInterceptor` block in `config.yml` with git.
