---
name: principle-build-the-lever
description: Build the tool that does the work or proves it, instead of doing the work by hand. Use for bulk edits, audits, migrations and repeated checks.
---

# Build the lever

The tool is the artifact a reviewer can rerun. Hand work leaves neither evidence nor a second run.

- Three or more similar edits means a codemod, not a sweep.
- An audit means a script that answers the question again next month.
- A repeated judgement means a skill your subagents can follow.
- Price the tool against every run it will save.
- Commit the tool alongside the change it produced.

Adapted from pstack (MIT).
