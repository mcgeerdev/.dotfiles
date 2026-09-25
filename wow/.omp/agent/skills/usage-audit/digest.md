# Weekly usage digest (machine format)

Write a JSON digest of the last 7 days of omp usage. SQLite aggregates
only: do not read transcripts, logs, or Claude/Codex data, and do not
fetch anything from the web. No prose outside the JSON.

## Data

Query with `sqlite3`. `stats.db` timestamps are epoch milliseconds;
`history.db` `created_at` is epoch seconds.

Against `~/.omp/stats.db`:

```sql
-- by_project
SELECT folder, agent_type, count(*) AS msgs,
       round(sum(cost_total), 2) AS cost, sum(total_tokens) AS tokens
FROM messages
WHERE timestamp >= strftime('%s', 'now', '-7 days') * 1000
GROUP BY folder, agent_type ORDER BY cost DESC;

-- by_model
SELECT model, count(*) AS msgs, round(sum(cost_total), 2) AS cost
FROM messages
WHERE timestamp >= strftime('%s', 'now', '-7 days') * 1000
GROUP BY model ORDER BY cost DESC;

-- api_errors
SELECT count(*) FROM messages
WHERE timestamp >= strftime('%s', 'now', '-7 days') * 1000
  AND error_message IS NOT NULL;

-- tools
SELECT tool_name, count(*) AS calls, sum(coalesce(is_error, 0)) AS errors
FROM tool_calls
WHERE timestamp >= strftime('%s', 'now', '-7 days') * 1000
GROUP BY tool_name ORDER BY calls DESC LIMIT 15;

-- top_sessions
SELECT session_file, round(sum(cost_total), 2) AS cost
FROM messages
WHERE timestamp >= strftime('%s', 'now', '-7 days') * 1000
GROUP BY session_file ORDER BY cost DESC LIMIT 5;
```

Against `~/.omp/agent/history.db`:

```sql
-- prompts_by_cwd
SELECT cwd, count(*) AS prompts FROM history
WHERE created_at >= strftime('%s', 'now', '-7 days')
GROUP BY cwd ORDER BY prompts DESC LIMIT 10;
```

## Output

Write
`/Users/devanmcgeer/.dotfiles-release/wow/.omp/audits/weekly/YYYY-MM-DD.json`
(today's date; create directories; overwrite on same-day rerun) with exactly
these keys:

```json
{
  "date": "YYYY-MM-DD",
  "window_days": 7,
  "totals": {"cost": 0.0, "tokens": 0, "messages": 0, "tool_calls": 0,
             "prompts": 0, "api_errors": 0},
  "by_project": [{"folder": "", "agent_type": "", "msgs": 0, "cost": 0.0, "tokens": 0}],
  "by_model": [{"model": "", "msgs": 0, "cost": 0.0}],
  "tools": [{"tool": "", "calls": 0, "errors": 0}],
  "top_sessions": [{"session_file": "", "cost": 0.0}],
  "prompts_by_cwd": [{"cwd": "", "prompts": 0}],
  "delta": {"vs": null, "cost_pct": null, "tokens_pct": null, "tool_calls_pct": null},
  "watch": []
}
```

`delta.vs` is the date of the newest earlier file in the same directory
(null if none); the `_pct` fields are percentage change of totals against
it. `watch` is at most 3 short strings naming anomalies (a spike, a new
expensive session, a tool error-rate change) — facts with numbers, no
advice.
