---
name: resolving-merge-conflicts
description: Resolve an in-progress git merge or rebase, one hunk at a time. Use when a rebase or merge has stopped with conflicts.
---

# Resolving merge conflicts

## Process

1. Read `git status` and list the conflicted paths. Do not edit anything yet.
2. For each hunk, establish both intents. `git log --merge -p <path>` shows the commits on each side.
3. Resolve to satisfy both intents. Where they genuinely contradict, stop and ask.
4. Stage the path and move on. Never bulk-resolve with `--ours` or `--theirs`.
5. Finish with `git rebase --continue` or `git merge --continue`, then run the project's checks.

## Rules

- Never abort the operation unless told to. The conflict carries information.
- Never resolve a hunk you cannot explain in one sentence.
- Conflicts in generated files are resolved by regenerating, not by hand.
- Lockfile conflicts are resolved by rerunning the package manager.

Adapted from mattpocock/skills (MIT).
