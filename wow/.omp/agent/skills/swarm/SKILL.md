---
name: swarm
description: Fan out parallel workers over independent slices and return one aggregated report. Use for parallel coverage, per-package checks, gauntlets and broad exploration.
---

# Swarm

## Process

1. Define the slice list explicitly. If you cannot enumerate the slices, you are not ready to fan out.
2. Write the contract once: identical instructions, identical output shape, per-slice inputs.
3. Spawn one worker per slice. Tell every worker to skip formatters, linters and project-wide test suites.
4. Drain all workers before drawing any conclusion.
5. Aggregate into one table, then reproduce the failures in full underneath it.

## Rules

- Slices must not write the same file. Overlapping writes are not merged for you.
- Workers report findings. They do not decide policy.
- Cap concurrency at what the harness allows and queue the remainder.
- One worker failing degrades one slice. Never let it abort the drain.

Adapted from pstack (MIT).
