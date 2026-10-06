---
name: show-your-work
description: Keep a reviewable decision trail for long-running or unattended work, as one row per decision recording what, why, evidence and result. Use for multi-phase runs, autonomous work, or anything a human reviews after stepping away.
---

# Show your work

Write the trail as `decisions.tsv`, one row per decision, columns: timestamp, decision, reason, evidence, result.

## Process

1. Create the file at the start of the run, with the header row.
2. Append a row whenever you choose between options, discard an approach, or accept a risk.
3. Put a command, a path with a line number, or a URL in the evidence column. Never prose.
4. Record rejected options in one line each, so the reader sees the fork.
5. Leave the file local by default. Commit it when the reviewer needs the trail to trust the result.

## Rules

- No row without evidence.
- A reversed decision gets a new row. Never edit an old one.
- The trail is for the reviewer, not for you. Write it so a stranger can audit the run.

Adapted from pstack (MIT).
