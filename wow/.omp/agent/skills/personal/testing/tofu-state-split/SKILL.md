---
name: tofu-state-split
description: Plan or review splitting a tofu site's single state into several states. Use for "state split", "split the state", "extract this module into its own state", "pre-split cleanup", or writing a STATE-SPLIT.md for a site in ~/didx.projects/tofu.
hide: true
---

# Tofu state split

This skill sets the order of work. The source of truth is these files in `~/didx.projects/tofu`. Read them first and don't restate them:

- `STATE-SPLIT-REQUIREMENTS.md`: the two gates every site must pass.
- `sites/cloudapi-prod/STATE-SPLIT.md`: the measured current structure and the target layout. This is the worked example.
- `sites/cloudapi-prod/PRE-STATE-SPLIT.md`: ranked cleanup inside one state, and the rules learned doing it.

All three are untracked in the repo today. If one is missing, say so and stop. Don't rebuild it from memory.

## Process

1. **Measure the site.** Count addresses with `tofu state list`, split into managed and data. Record the state serial. Collapse `tofu graph` to module call names, contracting root `local.*` nodes rather than dropping them.
2. **Gate 1, acyclic.** Look for a strongly connected component larger than one module. Zero bidirectional pairs does not prove it.
3. **Gate 2, references not values.** List every cross-module reference with its full attribute path. Exclude `moved`, `import` and `removed` blocks. Map producer and consumer to their target states and classify each crossing against the reject list: generated secret, provider configured from another state's credential, short-lived credential, list position.
4. **Write the site document.** Match `sites/cloudapi-prod/STATE-SPLIT.md` section for section, so the two sites can be compared.
5. **Rank the pre-split work.** Rows that resolve a pair rank above rows that only shrink surface. Split them into two batches: "provable with a no-change plan" and "real applies, each with its own window and proof".
6. **Hand over.** Each row needs its own plan before anyone acts. Label predictions as predictions.

## Rules

- Both gates apply to the whole site before any unit is extracted.
- A `data` lookup removes a dependency only when this state does not manage the looked-up object.
- Judge separability by provider blocks as well as module inputs.
- Before calling a change cheap, ask whether a no-change plan exercises the lifecycle it affects.
- Between compliant fixes, pick the one that keeps secret values out of tofu.
- Read the real address from state before writing a `moved` block.
- Never run `apply`, `state mv`, `state rm` or `import` against a central environment. Produce the plan and the commands for the user.
- Production security group migrations follow the `tofu-conventions` rule.
