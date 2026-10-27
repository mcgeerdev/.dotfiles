---
name: datadog-pup
description: Query or change Datadog monitors, dashboards, logs, metrics, events, SLOs, users and teams with the `pup` CLI. Use when the user mentions Datadog, a monitor or dashboard, says "use pup" or "use the pup cli", or asks for numbers that live in Datadog.
---

# Datadog with pup

`pup` is the Datadog CLI the user is logged in to. Use it for every Datadog question before reaching for the web UI or raw `curl`. `pup --no-agent auth status` shows the site and whether the token is valid.

## Every call

- Pass `--no-agent`. pup turns on agent mode when it sees `CLAUDECODE` in the environment, which the bash tool has and `eval` does not. In agent mode the JSON comes wrapped in `{status, data, metadata}`; without it you get the raw API payload. The same command then has two shapes, and a script written against one breaks on the other with `undefined is not an object`. `--no-agent` gives the raw payload in both places.
- Pass `--read-only` unless the user asked for a change. It blocks create, update and delete.
- Filter with pup's own `--jq '<filter>'` instead of `2>&1 | jq`. pup writes warnings to stderr, and merging them into jq's input fails with `failed to parse: value expected`.
- Give time-series commands an explicit `--from` (and `--to` for a closed window): `1h`, `7d`, RFC3339 or a Unix timestamp in milliseconds.

## Finding the right command

Ask for help on one command, never the whole tree:

```sh
pup --no-agent monitors --help          # subcommands of one group, about 3 KB
pup --no-agent monitors update --help   # flags of one subcommand
```

Bare `pup --help` in agent mode prints about 720 KB of JSON schema.

Commands used most: `metrics query`, `monitors list|get|search|diff|update`, `logs aggregate|search`, `events search`, `dashboards get`, `slos list`, `traces aggregate`.

## Logs

Pass `--storage indexes` to `logs search` and `logs aggregate`. Without it pup tries Flex storage first, fails, retries against indexed logs and prints a warning on stderr. Indexed logs cover the retention window only, often 7 to 15 days.

## Raw API

For an endpoint pup has no subcommand for, use `pup api`:

```sh
pup --no-agent --read-only api v2/downtime -F current_only=true
pup --no-agent api -X POST v2/events/search --input - <<'EOF'
{"filter":{"query":"source:alert","from":"now-7d","to":"now"},"page":{"limit":50}}
EOF
```

There is no `--data` flag. The body comes from `--input <file>` or `--input -`; `-F key=value` adds a typed field and `-f key=value` a raw string. On GET these become query parameters.

## Changing things

- Change a monitor, dashboard or tag only when the user asked for that change.
- Before touching a monitor, search `~/didx.projects/tofu` for a `datadog_monitor` with its name. If tofu manages it, change the HCL in a pull request. A `pup` edit drifts from state and the next apply reverts it.
- For `monitors update`, write the candidate JSON to a `mktemp -d` file, run `pup --no-agent monitors diff <id> <file>` and show the diff before `pup --no-agent monitors update <id> --file <file>`.
- A 403 means the token lacks a scope; `pup --no-agent auth status` lists the scopes. Do not retry it.
