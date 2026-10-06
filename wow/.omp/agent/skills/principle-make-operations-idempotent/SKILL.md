---
name: principle-make-operations-idempotent
description: Converge to the same end state regardless of what a previous partial run left behind. Use when writing scripts, migrations, infrastructure code or any operation that may be rerun.
---

# Make operations idempotent

Rerunning must be safe, and must reach the same end state.

- Assert the end state. Never assume the starting state.
- Check for existing resources before creating them, and reconcile rather than duplicate.
- Prefer declarative resources over ordered imperative steps.
- A script that only works on a clean machine is not finished.
- Design for the interrupted run, because that is the run you will actually get.

Adapted from pstack (MIT).
