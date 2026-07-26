---
name: adversarial-review
description: Prove a change is broken before trusting it. Spawns 2+ independent reviewers in isolated contexts whose only job is to find bugs with concrete evidence, then a separate fixer applies validated findings. Use when the user says "adversarial review", "prove this is wrong", "review this diff/PR/change", wants a finished change stress-tested for bugs before merge, or wants LLM-authored code audited.
---

# Adversarial Review

Review a **finished unit of work** by assuming it is broken and forcing reviewers to prove it.

The principle (from bun's Rust rewrite): the agent that wrote the code wants it merged; that bias hides bugs. So the reviewer is a **separate context** whose only job is to find reasons the code is wrong. **The reviewer never implements. The implementer never reviews.** This is on-demand and complements the always-on advisor — do not confuse the two.

## When NOT to use
- Mid-flight, half-written work — review a completed unit (working diff, commit range, PR, or named change), not a moving target.
- Trivial changes where two independent audits are overkill. Say so and skip.

## Phase 1 — Define the target and the contract
Pin down exactly what is under review and what it is supposed to do. Without the intended behavior, reviewers can only guess.

- [ ] **Target**: a concrete diff. Working tree (`git diff`), staged, a commit range, a PR, or an explicit file/function set. Capture it once so every reviewer sees the same bytes.
- [ ] **Contract**: what the change must do — the user's ask, the spec/issue, the behavior of the code it replaces or ports. State it in one paragraph.
- [ ] **Environment**: how to build/test/repro locally, so reviewers can gather evidence.

Write target + contract to `local://adversarial-target.md` so reviewers share one source of truth instead of re-deriving it.

## Phase 2 — Spawn independent reviewers
Fan out **2 or more** reviewers in one `task` batch so their contexts stay isolated — no reviewer sees another's findings (prevents anchoring).

**Reviewers investigate statically; they do not execute.** A subagent inherits the parent's `tools.approval` policies but runs headless under `approvalMode: yolo`, so any tool the user gated to `prompt` (commonly `bash`) has no UI to confirm against and **hard-errors** (`"requires approval but no interactive UI available"`). A reviewer therefore cannot reliably run tests/builds. Use `scout` (or `task` restricted to reading) — reviewers trace control flow, check against the spec, produce `likely` findings, and **propose exact repro commands** for the parent to run. They never emit `confirmed` themselves.

**Execution happens in the interactive parent (Phase 3.5).** After collecting reviewer findings, run each proposed repro yourself, serially, in the parent session — it has a UI so gated `bash` prompts you, and serializing in one `cwd` avoids cache/port/snapshot/test-DB contention. A confirmed repro promotes a `likely` finding to `confirmed`.

**Autonomous executable reviewers** are possible only if you accept relaxing the gate: launch the review session with an overlay setting `tools.approval.bash: allow` (subagents then inherit `allow`), and pass `isolated: true` per reviewer when `task.isolation.mode ≠ none` to keep their workspaces apart. Do NOT rely on this under a `bash: prompt` config — it will throw.

Give each reviewer this contract:

<reviewer-contract>
Your only job is to prove this change is broken. Assume a bug exists until you have shown otherwise. You do NOT fix anything — you find and prove.

Target and intended contract: read `local://adversarial-target.md`.

1. Enumerate 5+ **falsifiable** failure hypotheses before testing any. Each states a prediction: "If X is wrong, then Y will fail / Z will differ." A hypothesis you cannot make a prediction for is a vibe — discard it.
2. For each, gather static evidence — trace the control flow in the actual code, check against the spec/original, cite file:line. You run NO commands. When a hypothesis needs execution to settle, write the **exact repro command and expected-vs-feared output** so the parent can run it. Do not attempt to run it yourself.
3. Classify each finding:
   - **likely** — strong code-level reasoning (your ceiling); attach a repro command if execution would confirm it.
   - **candidate-confirmed** — you have file:line proof that needs no execution (e.g. a missing `free` on an error path visible in the diff).
   - **nit** — cleanup/style; no correctness impact.
4. Watch specifically for: use-after-free / double-free / lifetime & ownership errors, error-path leaks, off-by-one and boundary cases, silent behavior drift from the original, unhandled error returns, stubs/no-ops passed off as implementations, and swallowed exceptions.
5. Reject any workaround whose only justification is a paragraph-long comment — if it needs that much prose to defend, the code is wrong.

Report findings only, ranked by severity, each with evidence (or a proposed repro command) and a suggested direction — not a patch. If you genuinely cannot break it, say so and list what you checked. NEVER edit source. NEVER run commands.
</reviewer-contract>

## Phase 3 — Triage findings (evidence gate)
Merge the reviewers' reports. You are the judge, not a reviewer.

- Drop any **likely**/**candidate-confirmed** finding with no cited file:line evidence or repro command — an assertion is not a bug.
- Deduplicate overlapping findings; note where reviewers **independently** flagged the same issue (higher confidence).
- Rank: candidate-confirmed > likely > nit, and order the repro queue for Phase 3.5. Show the ranked list to the user before running repros or fixing anything material.

## Phase 3.5 — Execute in the parent
Promote findings by running the reviewers' proposed repros **yourself, in this session**, serially:
- The parent has a UI, so a gated `bash: prompt` asks you instead of hard-erroring; one runner in one `cwd` avoids cache/port/snapshot/test-DB contention.
- Run each repro, capture output. A reproduced failure becomes **confirmed**; one that won't reproduce drops to `nit` or is discarded (note it).
- Only confirmed findings (and file:line-proven candidate-confirmed) drive fixes.

## Phase 4 — Fix (separate fixer)
The fixer is not a reviewer. Apply fixes yourself, or delegate to a fresh `task` agent — never to a reviewer that judged this diff.

- Fix confirmed findings; fix likely findings once you've confirmed them.
- Fix at the source. No suppressing the symptom, no stub that quiets the reviewer.

## Phase 5 — Verify and optionally re-review
- [ ] Re-run each **confirmed** finding's repro; it must now pass.
- [ ] Run the target's existing tests.
- For high-stakes changes, spawn one fresh reviewer against the patched diff to confirm the fixes hold and introduced nothing new.

## Scaling
Per-unit in a loop (many files/crates): 1 implementer → 2 static reviewers → parent-run repros → 1 fixer per unit, batched. Reviewers never execute or edit; the parent serializes repros so no two runs share a `cwd`.
