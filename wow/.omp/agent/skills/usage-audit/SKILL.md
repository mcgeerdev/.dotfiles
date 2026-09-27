---
name: usage-audit
description: Analyze omp, Claude Code and Codex session data and write a dated HTML usage report with improvement suggestions.
disable-model-invocation: true
user-invocable: true
---

# Usage audit

Analyze my omp, Claude Code and Codex usage and write an HTML report.

## Data sources

Read all of them:

- `~/.omp/agent/sessions/` has omp chat transcripts (JSONL, one folder per project)
- `~/.omp/stats.db` is the omp stats index (`messages`, `tool_calls`, `user_messages`)
- `~/.omp/agent/history.db` has omp prompt history
- `~/.omp/logs/` has omp runtime logs and errors
- `~/.omp/autoqa.db` has tool issue reports
- `~/.claude/projects/` has Claude Code transcripts
- `~/.claude/history.jsonl` has Claude Code prompt history
- `~/.claude/stats-cache.json` is the Claude Code stats cache
- `~/.codex/sessions/` and `~/.codex/archived_sessions/` have Codex transcripts
- `~/.codex/logs_2.sqlite` and `~/.codex/log/` have Codex logs and errors

Query `stats.db` and the Codex sqlite files with `sqlite3` aggregates. Do not read them whole. Sample transcripts where full reads would exceed context.

Redact secrets, tokens and credentials from any quoted excerpt.

## Method notes

- Python `eval` may be unavailable in omp. Run `omp setup python --check` first, and use JS `eval` with `bun:sqlite` if it fails.
- Count omp sessions from top-level transcript files under `sessions/<project>/`. `stats.db` treats advisor (`__advisor*.jsonl`) and subagent transcripts as their own `session_file`, so its distinct counts run high.
- Split cost by `agent_type` (`main`, `advisor`, `subagent`). Report advisor share per month and for the last 30 days, and the costliest advisor transcripts with their `advise` note counts.
- Dollar figures are list-price estimates. Say which providers run on a subscription, which the error messages usually reveal.
- A word match in `history.db` is not a skill invocation. Confirm skill use from `skill-prompt` custom messages and `skill://` reads in transcripts before claiming a skill was used.
- Interceptor blocks are tool results starting with `Blocked:`. Report them per 100 main tool calls and split by the tool they point to.
- Read the previous audit in `.omp/audits/`. Add a section that re-measures each of its recommendations and says whether the number moved.
- Verify each Bible verse on Bible Gateway (`https://www.biblegateway.com/passage/?search=<ref>&version=NIV`) and link the page you checked.

## Session facts

Include every relevant session fact: session counts per project and per tool, models and providers used, token usage and cost where available, tool call counts, error rates, and the longest or most expensive sessions.

## What the report covers

1. Where I can use omp better, with examples from real sessions.
2. Recurring patterns in how I think and work. Look at how I phrase requests, where I redirect or correct the agent, what I abandon, and what I repeat across sessions.
3. Skills to start using, skills to add, and changes to the skills I already have in `~/.claude/skills/` and `~/.omp/agent/skills/`.
4. Config changes that would help, based on `~/.omp/agent/config.yml` and `~/.claude/settings.json`.
5. Ideas that would improve how I work in `~/.dotfiles/wow`. Each idea can be a tool, SaaS product, workflow, agent or harness, and it can be something that exists or something that doesn't yet. For each, describe the idea and the problem from my sessions it solves in a sentence or two. Don't estimate effort.

Back each personal improvement in points 1 and 2 with a Bible verse from the NIV. Give the book, chapter and verse, quote it word for word, and check every quote against a source before including it.

Base the suggestions on the current omp version and recent research. Check the omp changelog and docs, and cite sources with links.

## Output

- Write one self-contained `.html` file to `/Users/devanmcgeer/.dotfiles/wow/.omp/audits/`, named with today's date.
- Use inline CSS so it reads well. Include a table of contents, tables for the numbers, and a short summary at the top.
- Run the unslop skill (`~/.claude/skills/unslop/SKILL.md`) over all the report text before writing the file. Leave quoted transcript excerpts and command output as they are.

## Scheduled modes

The scheduled LaunchAgents run file-based variants of this skill:
`skill://usage-audit/digest.md` (weekly JSON digest),
`skill://usage-audit/patterns.md` (monthly patterns + dashboard summary),
`skill://usage-audit/improve.md` (weekly way-of-work changes on the
release branch, with a changelog PR body). This SKILL.md itself stays the
interactive, human-report mode.
