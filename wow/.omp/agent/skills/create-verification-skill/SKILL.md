---
name: create-verification-skill
description: Generate a project-local verification skill that drives this project the way a user does. Use when a repository has no scripted way to prove its behaviour, or the user asks for a verify skill or a control skill for the repo.
---

# Create verification skill

Produce a skill that any agent can run to prove this project still works.

## Process

1. Inventory the user-visible surfaces from build files, CI config and entry points. Read them, do not guess.
2. Pick the cheapest driver per surface: a CLI process, an HTTP request, a browser session, or a cluster command.
3. Build a feature map. One row per feature, holding the driver command, the expected observable, and any known flake.
4. Prove every row live before writing it down. Delete rows you could not prove.
5. Write the skill to the project's own skill directory, with the feature map inline and the commit it was proven against.

## Rules

- Never record an expected observable you have not seen with your own eyes.
- One command per row. If a row needs setup, script the setup.
- Prefer a command a reviewer can rerun over a paragraph describing what should happen.
- Record the flakes. A row that fails one time in five is a finding, not a footnote.

Adapted from pstack (MIT).
