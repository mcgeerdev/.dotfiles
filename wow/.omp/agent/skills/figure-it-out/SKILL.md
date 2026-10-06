---
name: figure-it-out
description: Design an auditable playbook when no narrower skill fits. Use for large migrations, ambitious multi-part changes, or work a human will review after stepping away.
---

# Figure it out

## Process

1. State the destination and how a reviewer will confirm you reached it.
2. Write the playbook as phases, each ending in a state you can verify.
3. Name the hypothesis loop for the parts nobody knows yet: what you will try, and what result would falsify it.
4. Log decisions with `show-your-work` as you go.
5. Execute phase by phase, proving each one before the next begins.

## Rules

- Scale the rigour to the blast radius, not to the size of the diff.
- Never start a phase while the previous one is unproven.
- If the destination turns out to be wrong, stop and report. Do not improvise a new one.
- The playbook is written down before execution starts, so a reviewer can audit the plan and the run separately.

Adapted from pstack (MIT).
