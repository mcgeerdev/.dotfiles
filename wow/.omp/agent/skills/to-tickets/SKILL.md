---
name: to-tickets
description: Break a plan, spec or conversation into tracer-bullet tickets, each declaring what blocks it. Use when converting a plan into issues on a tracker.
---

# To tickets

## Process

1. Slice vertically. Each ticket must end in something observable, not in a layer.
2. Write each ticket in the format below.
3. Declare blocking edges explicitly, ticket by ticket.
4. Publish to the tracker this repository uses, with native blocking links where the tracker supports them.
5. Report the resulting graph, roots first, so the reader sees what can start today.

Confirm the tracker once per repository and record the answer in that repository's agent rules.

## Ticket body

Write for whoever picks the ticket up cold: someone who has not read the plan, the spec or the conversation, and will not. The ticket states the intent. It does not carry the requirements document, the reasoning behind the plan, or the options that were rejected.

```markdown
### Intent

<exactly one sentence: the change and the state it leaves behind>

### Done when

- <observable check, at most 4>

### Files

- <paths it likely touches, or "Unknown">

### Blocked by

- <ticket references, or "None">
```

- Title: imperative, under 70 characters, names the outcome.
- Intent is one sentence. A second sentence belongs in Done when or nowhere.
- Every term is common knowledge in the team or explained in the sentence that uses it.
- No background, history, alternatives or links the reader must open to understand the ticket.

## Rules

- No ticket larger than one working session.
- Done when describes observable behaviour. "The code exists" is not done.
- A ticket that blocks everything is a design decision in disguise. Split it out and answer it first.
- Never invent scope the plan does not contain.

Adapted from mattpocock/skills (MIT).
