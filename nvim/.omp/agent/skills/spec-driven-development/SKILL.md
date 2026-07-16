---
name: spec-driven-development
description: Drive a change spec-first — capture intent and acceptance criteria as a written spec, ground it in the codebase, grill it, slice it into issues, then implement and verify slice-by-slice. Use when starting a non-trivial feature or change, or when the user says "spec-driven", "SDD", "write a spec", or "spec this out".
---

# Spec-Driven Development

Author the spec first, make it the source of truth, and let implementation follow it. The spec is a living document: update it inline as decisions crystallise, not after.

Optimised for this environment: OpenTofu/Terraform + CI/CD + `jj` (Jujutsu) + PR flow. Central envs are applied by CI, never locally.

## The loop

1. **Capture the spec.** Write `docs/specs/<slug>.md` (or `SPEC.md` for a small repo). Sections:
   - **Problem** — what is wrong / missing, in concrete terms.
   - **Goal** — the observable end state.
   - **Non-goals** — what this change explicitly will not do (blast-radius fence).
   - **Acceptance criteria** — a checklist of verifiable outcomes. Each must be testable or observable.
   - **Risks & rollback** — what can break, and the revert path.
2. **Ground it in the code.** Before designing, invoke `pattern-audit` to find existing modules, provider aliases, and workflow patterns to reuse. Read the real modules/workflows the spec touches. Fold findings back into the spec.
3. **Grill the spec.** Invoke `grill-with-docs` (or `grill-me`) to challenge every branch of the decision tree against the domain model, sharpen terminology, and resolve dependencies one at a time. Record decisions in the spec as they land.
4. **Slice into issues.** Invoke `to-issues` to break the spec into independently-grabbable, tracer-bullet vertical slices. Each slice delivers an end-to-end thin path, not a horizontal layer.
5. **Implement one slice at a time.**
   - Where there is real logic, go test-first (`tdd`): red → green → refactor.
   - For infra, run `tofu plan` and read the diff. **Never `tofu apply`** — central envs go through CI.
   - Tick the acceptance criterion the slice satisfies; if reality diverges from the spec, update the spec, not just the code.
6. **Ship the slice.** Use `jj-ship` to describe the change and create the branch bookmark, then open the PR. One slice ≈ one reviewable PR.

## Rules

- **No code before the spec has acceptance criteria.** If you cannot state how you will verify success, the spec is not ready.
- **The spec is the contract.** If a criterion changes mid-flight, edit the spec in the same change and note why.
- **Every merged slice leaves `main` green and deployable.** No half-wired slices behind the tracer bullet.
- **Blast radius stays inside the non-goals.** Work that drifts past them needs a spec amendment, not a quiet expansion.
- **Verify before done.** A slice is done when its acceptance criterion is demonstrably met (test passes, `tofu plan` shows the intended diff, smoke check succeeds) — not when the code compiles.

## When NOT to use this

Trivial one-liners, mechanical renames, and pure investigations do not need a spec. Reach for it when a change spans multiple files/slices, touches infra or CI, or carries rollback risk.
