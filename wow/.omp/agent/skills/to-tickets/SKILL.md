---
name: to-tickets
description: Break a plan, spec or conversation into tracer-bullet tickets, each declaring what blocks it. Use when converting a plan into issues on a tracker.
---

# To tickets

## Process

1. Slice vertically. Each ticket must end in something observable, not in a layer.
2. Write each ticket with its intent, acceptance criteria, and the files it likely touches.
3. Declare blocking edges explicitly, ticket by ticket.
4. Publish to the tracker this repository uses, with native blocking links where the tracker supports them.
5. Report the resulting graph, roots first, so the reader sees what can start today.

Confirm the tracker once per repository and record the answer in that repository's agent rules.

## Rules

- No ticket larger than one working session.
- Acceptance criteria describe observable behaviour. "The code exists" is not acceptance.
- A ticket that blocks everything is a design decision in disguise. Split it out and answer it first.
- Never invent scope the plan does not contain.

Adapted from mattpocock/skills (MIT).
