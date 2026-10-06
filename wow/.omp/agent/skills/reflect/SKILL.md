---
name: reflect
description: Turn a finished task into concrete skill edits. Spawn parallel reviewers over the transcript, then apply the findings that survive. Use when the user says reflect, or after a task that cost more than it should have.
---

# Reflect

## Process

1. State what the task was and where the time actually went.
2. Spawn three reviewers over the transcript with separate lenses: wrong turns, missing context, tool misuse.
3. Keep only findings that name a specific edit to a specific skill or rules file.
4. Apply the surviving edits.
5. Report what you rejected and why.

## Rules

- One edit per finding. A finding that needs three edits was two findings.
- Extend an existing skill before creating a new one.
- If a check, lint rule or test could enforce the lesson, write that instead of more prose.
- Vague lessons are discarded. "Be more careful" is not an edit.

Adapted from pstack (MIT).
