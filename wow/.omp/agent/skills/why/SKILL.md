---
name: why
description: Recover the rationale behind a decision, threshold or regression from the available record. Use for "why does X work this way", "why did we pick Y", "help me understand why", "I don't understand why", "what was the reasoning", postmortems and design archaeology. Use `how` for runtime behaviour.
---

# Why

## Process

1. List the evidence sources actually available: git history, pull requests, the issue tracker, long-form docs, dashboards, error tracking.
2. Query them in parallel rather than in sequence.
3. Build a dated timeline of the decisions that produced the current state.
4. Separate the stated reason from the observable cause. They often differ.
5. Report with citations, and name the gaps in the record explicitly.

## Rules

- Quote the primary source. A summary of a summary is not evidence.
- `git log -S` finds when a line arrived. The pull request or issue explains why.
- Absence of evidence is reported as absence. Never fill the gap with a plausible story.
- A number with no recorded justification is a finding worth raising.

Adapted from pstack (MIT).
