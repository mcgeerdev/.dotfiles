---
name: refine
description: Refine the project's CLAUDE.md or AGENTS.md after a meaningful change by reflecting on what the agent wished it had known at the start of the task and folding it back in. Use this skill whenever the user says "refine the harness", "update CLAUDE.md", "update AGENTS.md", "what did we learn this session", "what should I add to the agent rules", or finishes any non-trivial task in a repo containing CLAUDE.md or AGENTS.md and asks for a retrospective. Also use this proactively at the end of any session where the agent hit unexpected friction (wrong file, wrong command, wrong pattern) that a one-line rule would have prevented. Enforces the Why/What/How template, the <300-line budget, the no-linter-rules constraint, and progressive disclosure via agent_docs/. Refuses to operate on files that don't already follow the template.
---
 
# Refine Harness
 
Post-task refinement of `CLAUDE.md` / `AGENTS.md`. One file, one source of truth — the other is a symlink.
 
This skill is **only** for refinement of an existing, well-formed harness file. It does not author new ones, restructure malformed ones, or migrate legacy files. If the file fails the gate (Step 1), refuse and tell the user.
 
## Why this skill exists
 
`CLAUDE.md` / `AGENTS.md` is the highest-leverage file in the harness — it goes into every session. A bad line here multiplies into many bad lines of code. A bloated file gets ignored entirely (Claude Code wraps it in a `<system-reminder>` that explicitly says it "may or may not be relevant"). The compounding lever is *small, deliberate, post-task edits* — never auto-generation, never kitchen-sinking.
 
## Inputs
 
- A repo with `CLAUDE.md` **or** `AGENTS.md` at the root (one file, one symlinked to the other).
- A just-completed task or session whose friction the user wants to capture.
## Step 1 — Gate: refuse if the file is malformed
 
Read the live file (follow the symlink — verify with `ls -la` that one is a symlink to the other; if not, fix that as the first action and stop).
 
The file MUST already contain these three top-level sections, in this order:
 
```
## Why
## What
## How
```
 
If any are missing, **refuse**. Tell the user verbatim:
 
> This skill only refines harness files that already follow the Why/What/How template. Yours doesn't. Run a one-time restructure first, then re-invoke this skill.
 
Do not propose the restructure here. Do not write the missing sections. Stop.
 
If the file is over 300 lines, warn but proceed — the refinement may include pruning.
 
## Step 2 — Elicit: what did the agent wish it had known?
 
Ask yourself, with specifics from the task just completed:
 
> At the start of this task, what *one specific fact, file path, command, or constraint* would have saved a wrong turn?
 
Generate 1–5 candidate refinements. Each candidate must be a concrete artifact, not a vibe. Bad: "be more careful with migrations". Good: "migrations live in `db/migrations/`, run `bun run db:migrate` (not `npm`), never edit applied migrations".
 
If no candidate clears the bar — i.e., everything you'd add is already inferable from the codebase or already in the file — say so and stop. No-op is a valid outcome.
 
## Step 3 — Triage: every candidate goes to exactly one bucket
 
For each candidate, classify:
 
| Bucket | Goes in | Criteria |
|---|---|---|
| **CLAUDE.md** | Why/What/How section | Universally applicable to *every* task in this repo. Cannot be inferred from a quick search. Cannot be enforced deterministically. |
| **`agent_docs/<topic>.md`** | New or existing file under `agent_docs/` | Task- or domain-specific. Only relevant when working on that area. CLAUDE.md gets a *pointer* to it (one line, file path + one-sentence description). |
| **Hook / linter / formatter** | `.claude/settings.json` hook, or existing tooling | Deterministic, mechanical, runs every time. Style, format, typecheck, test commands. |
| **Reject** | — | Already inferable from codebase, already in the file, or "Claude is not a linter" violation. |
 
State the bucket explicitly for each candidate before writing anything. If a candidate is ambiguous between CLAUDE.md and `agent_docs/`, default to `agent_docs/` and add the pointer — progressive disclosure beats bloat.
 
## Step 4 — Apply within the template
 
For CLAUDE.md edits:
 
- **Why** changes are rare. Only edit if the project's purpose has actually shifted.
- **What** holds the project map and pointers. Add new `agent_docs/` pointers here as a single line: `- @agent_docs/<topic>.md — <one-sentence description>`.
- **How** holds workflow rules and commands the agent can't infer. Add at most one rule per refinement. Phrase as imperatives. Reference file paths with `file:line` where applicable, not code snippets (snippets go stale).
For `agent_docs/` edits:
 
- One file per topic. Filename is descriptive (`running_tests.md`, `db_migrations.md`, `release_process.md`).
- Prefer `file:line` pointers over copied code.
- No length cap — these load on demand.
For hook edits: don't write the hook here. Tell the user what hook to add and why, and stop. Hook authoring is out of scope.
 
## Step 5 — Enforce the budget
 
After applying edits, count the lines of the harness file. If over 300, you must prune in the same change. Prune candidates, in order:
 
1. Anything Claude would do correctly without the instruction (test by asking: would a frontier model violate this rule if the line were absent?).
2. Linter/formatter rules.
3. Code snippets that have probably gone stale (replace with `file:line` pointer).
4. Sections that fired once for a one-off task and never again.
Target: <60 lines for the root file (HumanLayer benchmark). Hard cap: 300.
 
## Step 6 — Show the diff and the reasoning
 
Output to the user:
 
1. The diff (unified, against the live file).
2. A one-line justification per added/changed line: "added because <specific friction in this task>".
3. The new line count.
4. Any candidates rejected in Step 3 and why.
Do not commit. The user reviews and commits.
 
## Hard constraints (never violate)
 
- **Never auto-generate the file** or run `/init`. This skill edits surgically.
- **Never add code style rules** the formatter/linter could enforce.
- **Never add file-by-file codebase descriptions.** That's what agentic search is for.
- **Never include code snippets** that will go stale. Use `file:line` pointers.
- **Never duplicate** information already in the file. Pointers, not copies.
- **Never edit both `CLAUDE.md` and `AGENTS.md` separately.** One is a symlink; edit the source.
## References
 
- HumanLayer, *Writing a good CLAUDE.md* — https://www.humanlayer.dev/blog/writing-a-good-claude-md
- Anthropic, *Best Practices for Claude Code* — https://code.claude.com/docs/en/best-practices
- HumanLayer, *Getting Claude to Actually Read Your CLAUDE.md* (conditional `<important if=...>` blocks) — https://www.humanlayer.dev/blog/stop-claude-from-ignoring-your-claude-md
