---
name: bootstrap
description: "Initializes a high-leverage project-level CLAUDE.md based on current repository research."
capabilities: ["research", "filesystem", "edit"]
---

# bootstrap

## PURPOSE
To transform the current directory into a well-specified workspace by creating a project-level CLAUDE.md that defines the local WHAT, WHY, and HOW [3, 4].

## WORKFLOW
1. **Repository Research:** Scan the current working directory to identify the primary tech stack, directory structure (apps/services/shared), and build/test entry points [4].
2. **Intent Extraction:** Read README.md or existing docs to distill the core mission (the WHY) of this specific repository [3].
3. **Operationalization:** Identify specific commands for build, test, and lint. 
   - **Constraint:** All commands must be wrapped for **Silent Success** (zero output on success, only surface errors to protect the context window) [5, 6].
4. **Drafting (60-Line Rule):** Generate a `CLAUDE.md` in the project root.
   - **Constraint:** Use the **Table of Contents Pattern**. The file must be **under 60 lines** [7, 8].
   - **Progressive Disclosure:** Move deep details (e.g., API schemas, infra setup) to a `docs/` directory and use pointers [9, 10].
5. **Authority Alignment:** Ensure the file acknowledges the **Operator Authority** (the machine-root `~/.claude/CLAUDE.md`) for global persona and tutoring standards [11].

## OUTPUT CONTRACT
A `CLAUDE.md` file in the current project root that serves as the "onboarding manual" for any agent entering this specific codebase [12].
