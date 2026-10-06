---
name: blast-radius
description: Find what a change could break outside its own diff, and prove the one fact that makes it safe by running code. Use for "blast radius of X", "what could this break", "what else uses this", a state move, a module or provider upgrade, a security group migration, or a small diff you do not trust.
---

# Blast radius

Small diffs break distant things. Find the distance, then prove the safety claim.

## Process

1. Name the change exactly: the symbol, file, resource or config key that moved.
2. Find every consumer. Use the language server for code, `grep` for config and templates, and live state for infrastructure.
3. List the ways it could break, one line each, most likely first.
4. Identify the single fact that decides whether this is safe, then prove that fact by running code.
5. Report the proof, the residual risk, and what you did not check.

## Rules

- One proven fact beats five plausible assessments.
- For infrastructure, read live state as well as the plan. Plan output hides drift.
- If you cannot prove the deciding fact, say so plainly and name what would prove it.
- Consumers outside this repository count. Check them or declare them unchecked.

Adapted from pstack (MIT).
