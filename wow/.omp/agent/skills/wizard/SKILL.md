---
name: wizard
description: Generate an interactive bash wizard that walks a human through steps only they can perform. Use for provisioning, credentials, CI secrets, third-party dashboards and one-off cutovers. Do not use it for steps the agent can perform itself.
---

# Wizard

## Process

1. List every step, and mark each one as agent-doable or human-only.
2. Keep only the human-only steps. Do the rest yourself.
3. Write a bash script that prompts for one step at a time, waits, then verifies before advancing.
4. Verify what the human reports, by command. Do not take completion on trust.
5. Make the script idempotent so a half-finished run can simply be rerun.

## Rules

- Never ask a human to paste a secret value. Ask them to place it, then verify it is present.
- Every step states why only a human can do it.
- Print the exact console path or URL. "Go to settings" is not an instruction.
- Exit cleanly at any point, leaving the run resumable.

Adapted from mattpocock/skills (MIT).
