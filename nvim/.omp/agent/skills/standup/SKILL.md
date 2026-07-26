---
name: standup
description: Generate a daily standup summary from git commits plus Claude Code and OMP (Oh My Pi) session activity, formatted as Yesterday/Today/Blockers. Use when preparing for team standups or status updates.
disable-model-invocation: false
argument-hint: "[optional since-date YYYY-MM-DD]"
---

# Daily Standup Report Generator

Generate a comprehensive standup summary by collecting:
1. Git commits since the last standup
2. Claude Code session activity (files edited, session topics)
3. OMP (Oh My Pi) session activity (files written/edited, session topics)
4. Formatted output in a Yesterday/Today/Blockers structure

`~/.standup_last_run` stores the anchor date (the start of the window). It is
rewritten **only** at the very end (step 3), after the report is produced — so
git and both session sources all see the same "since last standup" window. If
the user passed a `YYYY-MM-DD` argument, use it as the window start instead of
the anchor.

## Step 1 — Collect the data

Run this as a **single** shell command (the `SINCE` variable must persist across
the whole block). If the user supplied a since-date argument, put it in `SINCE=`;
otherwise leave it empty and the anchor / "yesterday" fallback is used.

```bash
SINCE=""   # <- put the user-supplied YYYY-MM-DD here if one was given, else leave empty
[ -z "$SINCE" ] && SINCE=$(cat ~/.standup_last_run 2>/dev/null)
[ -z "$SINCE" ] && SINCE=$(date -v-1d +%Y-%m-%d 2>/dev/null || date -d 'yesterday' +%Y-%m-%d)

# Portable "modified since" reference (BSD find does not parse -newermt "YYYY-MM-DD")
touch -t "$(printf '%s' "$SINCE" | tr -d '-' | cut -c1-8)0000" /tmp/.standup_since_ref
printf 'STANDUP_SINCE=%s\n' "$SINCE"
ANCHOR=$(cat ~/.standup_last_run 2>/dev/null || echo "")
[ "$ANCHOR" = "$(date +%Y-%m-%d)" ] && echo "STANDUP_CONTEXT=today_so_far" || echo "STANDUP_CONTEXT=yesterday"

echo "=== GIT COMMITS ==="
git log --after="$SINCE" --author="$(git config user.email)" --oneline 2>/dev/null
echo "=== GIT WORKING CHANGES ==="
git diff --stat HEAD 2>/dev/null
echo "=== GIT STASHES ==="
git stash list 2>/dev/null

echo "=== CLAUDE FILES TOUCHED ==="
for s in $(find ~/.claude/projects -name "*.jsonl" -type f -newer /tmp/.standup_since_ref 2>/dev/null); do
  jq -r 'select(.type=="assistant") | .message.content[]? | select(.type=="tool_use" and (.name=="Write" or .name=="Edit")) | .input.file_path // empty' "$s" 2>/dev/null
done | sort -u | head -20
echo "=== CLAUDE SESSION TOPICS ==="
for s in $(find ~/.claude/projects -name "*.jsonl" -type f -newer /tmp/.standup_since_ref 2>/dev/null); do
  jq -r 'select(.type=="ai-title") | .aiTitle // empty' "$s" 2>/dev/null | head -1
  jq -r 'select(.type=="user" and (.message.role=="user")) | .message.content | if type=="array" then (map(select(.type=="text").text) | join(" ")) else . end' "$s" 2>/dev/null | grep -v '^/' | grep -v '^\[' | head -1
done | sort -u | head -12

echo "=== OMP FILES TOUCHED ==="
for s in $(find ~/.omp/agent/sessions -maxdepth 2 -name "*.jsonl" -type f -newer /tmp/.standup_since_ref 2>/dev/null); do
  jq -r 'select(.type=="message") | .message.content[]? | select(.type=="toolCall") | if .name=="write" then .arguments.path elif .name=="edit" then (.arguments.input // "" | split("\n")[0] | ltrimstr("[") | split("#")[0]) else empty end' "$s" 2>/dev/null
done | sort -u | head -20
echo "=== OMP SESSION TOPICS ==="
for s in $(find ~/.omp/agent/sessions -maxdepth 2 -name "*.jsonl" -type f -newer /tmp/.standup_since_ref 2>/dev/null); do
  jq -r 'select(.type=="title") | .title | select(. != null and . != "")' "$s" 2>/dev/null
  jq -r 'select(.type=="message" and (.message.role=="user")) | .message.content | if type=="array" then (map(select(.type=="text").text) | join(" ")) else . end' "$s" 2>/dev/null | grep -v '^/' | head -1
done | sort -u | head -12
```

### Data notes
- **Claude Code** transcripts live in `~/.claude/projects/**/*.jsonl`. Assistant
  tool calls are `{"type":"tool_use","name":"Write"|"Edit","input":{"file_path":...}}`;
  topics come from the `ai-title` line and the first real user prompt.
- **OMP** transcripts live in `~/.omp/agent/sessions/<project>/<timestamp>_<id>.jsonl`.
  The main transcript is at depth 2; `-maxdepth 2` skips per-session artifact logs
  and subagent transcripts. Tool calls are `{"type":"toolCall","name":"write"|"edit",...}`;
  `write` carries the file in `.arguments.path`, `edit` in the `[PATH#TAG]` header at
  the top of `.arguments.input`. Topics come from the `title` line and the first user prompt.

## Step 2 — Generate the report

Read `STANDUP_CONTEXT` from the output:
- `today_so_far` → label the main section **TODAY SO FAR** (mid-day, work in progress)
- `yesterday` → label the main section **YESTERDAY** (reviewing a completed day)

Process the collected data:
- Parse commit messages; group related commits by feature/task; keep short hashes for reference.
- Fold in files touched and session topics from **both** Claude Code and OMP; de-duplicate
  work that appears in more than one source.
- Session topics record **intent**, not guaranteed completion — do not report abandoned or
  still-in-progress work as shipped.

Format:

```
📅 STANDUP UPDATE — [Today's Date]

[YESTERDAY or TODAY SO FAR]:
• [Aggregated work items from commits + session activity]
• [Include commit hashes: abc123, def456]
• [Max 5-6 bullets]

TODAY:
• [Forward-looking tasks inferred from prior work / branch names / follow-ups]

BLOCKERS:
• None [or specific blockers if detected]
```

### Formatting rules
- **Yesterday:** action verbs (Implemented, Fixed, Refactored, Deployed, Reviewed).
  Format `• [Action] [what was done] (commits: [hash1], [hash2])`. Group related commits.
  Include git commits AND session work (Claude Code + OMP).
- **Today:** infer from incomplete work / branch names; include typical follow-ups
  (testing, deployment, review). Format `• [Action verb] [what will be done]`.
- **Blockers:** default `• None`; be specific if any are detected.
- **Tone:** brief (< 200 words), factual (based on real activity), action-oriented, scannable, professional.

### Fallback

If NO git commits AND NO Claude Code / OMP session activity are found:

```
📅 STANDUP UPDATE — [Today's Date]

YESTERDAY:
• No commits found — add updates manually

TODAY:
• [To be added]

BLOCKERS:
• None
```

## Step 3 — Advance the anchor (last)

Only after the report has been generated, reset the window to today so the next
run picks up where this one left off:

```bash
date +%Y-%m-%d > ~/.standup_last_run
```

## Edge cases
- **No `~/.standup_last_run`:** the window defaults to "yesterday"; first run is handled gracefully.
- **No git commits:** show session activity if any; otherwise use the fallback format.
- **Parsing errors:** `jq`/`grep` errors are suppressed with `2>/dev/null`; keep going with whatever parsed.
- **Large output:** cap at 5-6 items per section; summarize rather than list everything.

## Example output

```
📅 STANDUP UPDATE — March 1, 2026

YESTERDAY:
• Implemented user authentication flow (commits: a1b2c3d, e4f5g6h)
• Fixed bug in password reset logic (commit: i7j8k9l)
• Reviewed PR #234 — authentication refactor
• Migrated Valkey module + touched auth files via Claude Code + OMP

TODAY:
• Deploy authentication changes to staging
• Write tests for password reset flow

BLOCKERS:
• None
```

## Notes
- Requires `jq`.
- `~/.standup_last_run` tracks the window; it is rewritten only in step 3, so every
  collector in step 1 reads the same window.
- BSD (macOS) `find` does not parse `-newermt "YYYY-MM-DD"`; the skill uses a
  `touch -t` reference file with `-newer` instead, which works on macOS and Linux.
- Combines git commits + Claude Code + OMP session work for a complete picture.
