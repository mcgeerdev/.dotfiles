---
name: audit-harness
description: Use when auditing the full Claude Code harness for a repo against current best practices. Triggers on "audit the harness", "harness review", "how does my AGENTS.md compare to best practices", or after significant harness changes. Covers AGENTS.md, settings.json, memory files, and skill files.
---

# Audit Harness

Benchmarks the full Claude Code configuration layer against current harness engineering best practices. Produces a unified diff per surface for human review — no auto-apply.

## Inputs

- `AGENTS.md` at repo root (or `CLAUDE.md` — flag if not symlinked correctly)
- `.claude/settings.json`
- Memory files (check `.claude/memory/` or equivalent path)
- Skill files referenced from the harness
- All repo domains (no directories excluded)

## Step 1 — Collect: read all four surfaces

Read each surface in full. Note what exists, what is underdefined, and what references other surfaces. Do not evaluate yet — collect first.

Also verify: is `AGENTS.md` the canonical file with `CLAUDE.md` symlinked to it? If reversed or missing, flag as a critical gap before proceeding.

## Step 2 — Research: fetch from references

Read `references.md` in this skill's folder. Fetch each active URL using WebFetch. Extract only the actionable recommendations — criteria and examples that can be compared against the collected surfaces.

If a URL is unreachable, skip it, note the failure in the output, and continue. Do not abort the audit.

If the fetch surfaces a new high-value reference not yet in `references.md`, append it to the active list before continuing. Do not remove or modify existing entries.

## Step 3 — Compare: rank gaps

For each surface, compare what exists against the fetched recommendations. Rank every gap by how much it undermines determinism — the degree to which agent behavior becomes model-dependent rather than harness-dependent:

| Severity | Meaning |
|----------|---------|
| **critical** | Agent behavior is unpredictable across runs or agents — harness provides no guidance here |
| **recommended** | Best practice clearly absent; a different agent or session would likely behave differently |
| **note** | Minor inconsistency; low impact on determinism |

Only flag gaps where a concrete, citable change exists. Skip vague concerns.

## Step 4 — Output: unified diff per surface

For each surface with at least one gap, produce a unified diff block. Order: `AGENTS.md` → `settings.json` → memory files → skill files.

```diff
--- a/AGENTS.md
+++ b/AGENTS.md
@@ -N,M +N,M @@
-old line
+new line
# why[critical]: <one-line citation from fetched source>
```

Rules:
- Every changed line gets a `# why[severity]:` comment citing the source
- One diff block per file — do not interleave files
- Do not apply changes — output only

## Step 5 — Closing summary

After all diff blocks:
- Total gaps by severity (e.g., `3 critical, 5 recommended, 2 notes`)
- Surfaces with no gaps (state explicitly — "no changes proposed for settings.json")
- Any fetch failures from Step 2
- Any new references added to `references.md` during this run

## Hard constraints

- **Never apply changes.** Output the diff; the human applies it.
- **Never propose a change without a cited source** from the fetched references.
- **Never remove or modify existing entries** in `references.md` — only append.
