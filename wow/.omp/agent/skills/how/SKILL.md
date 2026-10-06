---
name: how
description: Explain how a subsystem works, covering runtime flow, ownership and layering. Use for "how does X work", "help me understand how", "I don't understand how", "walk me through", walkthroughs before changing code, and placement questions such as where should this live or which package owns this. Use `why` for motivation.
---

# How

## Process

1. Find the real entry point. Start from the binary, route, job or event, not from the file you were handed.
2. Trace one live invocation end to end, naming the file and function at every hop.
3. State which module owns each responsibility along the path.
4. Name the invariants the code relies on and where they are enforced.
5. Flag the layering violations you passed on the way through.

Deliver a numbered flow. Add one diagram when the path branches more than twice.

## Rules

- Cite a path and line for every hop. No hop from memory.
- Where two paths exist, trace the one that runs in production and say the other exists.
- Answer placement questions with the owning module and the reason, not with a preference.
- If the trace dead-ends in a dependency, say so rather than inventing the rest.

Adapted from pstack (MIT).
