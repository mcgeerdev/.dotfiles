---
name: maintain-verification-skill
description: Periodic pass that keeps a project's verification skill honest against the code. Use for "audit the verify skill", or when the feature map has drifted from the application.
---

# Maintain verification skill

A feature map nobody rechecks becomes a confident lie. This is the recheck.

## Process

1. Read the current feature map and the commit it was last proven against.
2. Spawn one reader per feature to compare the recorded observable against the source as it stands now.
3. Run one live pass that drives every feature, in order, capturing actual output.
4. Classify each row as proven, drifted, or dead.
5. Open at most one pull request carrying the proven corrections, and update the proven-against commit.

## Rules

- A row you cannot drive is dead. Remove it rather than weaken it.
- Corrections need the live output that justifies them, quoted in the pull request.
- Do not add features in this pass. Drift correction only.

Adapted from pstack (MIT).
