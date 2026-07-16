---
name: mental-model
description: Reconstructs a system's conceptual model — responsibilities, flow, and boundaries — when that understanding is missing. Use ONLY when one of these holds: (1) the discussion has become stuck in implementation detail (syntax, libraries, framework behaviour, configuration, tokens, unfamiliar terminology) without a stable grasp of what owns the behaviour and how data flows; or (2) the user explicitly asks to zoom out or for a mental, conceptual, or architectural model. This is a recovery move for that stuck state — NOT a routine step in debugging, code or AI-change review, or architecture work. Do not load it merely because a task is technical.
---

# Mental Model

Build a durable understanding of the system before explaining or changing its implementation. The goal is not to memorise syntax, APIs, or terminology — it is the stable mechanisms and responsibility boundaries that survive an implementation change.

## When to zoom out

Activate when conceptual uncertainty is materially blocking the work:

- We are deep in syntax / terminology / config but cannot state what owns the behaviour.
- Explaining why a system, test, fix, or decision works.
- Understanding an AI-generated change.
- The apparent failure and the real failure sit in different components.
- A test may exercise a different boundary than it claims to.
- Proposing code before establishing where responsibility belongs.
- The user has the details but has lost the end-to-end thread.
- The user asks to zoom out, or wants a conceptual / architectural explanation.

Do not activate just because a task is technical. Use it sparingly, when the model is actually missing.

## The interruption

When detail crowds out the model, stop and say:

> **Zooming out** — we are in the implementation before the responsibility boundary is clear.

Then answer only these:

1. What outcome must we guarantee?
2. Which component owns that guarantee?
3. What path does the request / data follow?
4. At which boundary does the observed behaviour occur?
5. What evidence proves it?

Resume implementation once these are answered. Do not repeat the interruption when the model is already stable.

## Build the model (in this order)

Establish the concept before naming any technology:

1. **Intent** — outcome to produce, failure to prevent, in plain language.
2. **Responsibilities** — per component: what it owns, what it does not, what it trusts, what it guarantees to the next.
3. **Flow** — the full request / control path in plain words; where it validates, transforms, terminates.
4. **Boundaries** — where ownership changes; what contract crosses; which side a test should observe.
5. **Invariants** — truths that hold even if the technology changes.
6. **Assumptions** — original and proposed-fix; why each seemed plausible, what evidence confirms or breaks it. For an AI change: what did it assume, which assumption was wrong, did it fix the cause or just make the test pass?
7. **Evidence** — ground every claim in a file, symbol, config, log, or observed behaviour. Label each as Observed / Inferred / Unknown.
8. **Implementation** — only now map concept → component → location → symbol → behaviour. Name a term only after explaining the mechanism.
9. **Lesson** — one transferable principle beyond this language, framework, or repo.

## Response format

Use the minimum depth the problem needs — not every answer is an architecture document.

```markdown
## Mental model

**Intent:** what the system must accomplish.
**Responsibility:** which component owns the behaviour.
**Flow:** the request / data path in plain language.
**Boundary:** where the tested or failing contract lives.
**Uncertain assumption:** what may have distorted the picture.
**Evidence:** repository evidence for the model.
**Implementation:** concept → files / symbols / config.
**Lesson:** one transferable principle.
```

For complex cases, add an **Open questions** block: unproven facts and the evidence needed to close them.

## Checkpoint

After the model, ask one retrieval question that tests the concept, not the terminology — e.g. "which component owns this guarantee, and what proves it?" or "what would stay true if this gateway were swapped out?" Never ask "does that make sense?" Do not require exact terms: correct the concept first, then supply the formal name.

## Do not

- Substitute terminology for explanation, or architectural opinion for repository fact.
- Walk through files sequentially before showing how they participate in the system.
- Let passing tests stand in for correct responsibility boundaries.
- Silently rewrite code when the user wants understanding.
- Overuse analogies; each must map explicitly to the real mechanism.
- Lose the thread — return to the concrete decision once the model is clear.
