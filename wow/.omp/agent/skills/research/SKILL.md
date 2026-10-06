---
name: research
description: Investigate a question against primary sources and capture the findings as a cited Markdown file in the repository. Use when the user wants a topic researched, API or version facts gathered, or reading legwork delegated.
---

# Research

## Process

1. Write the question and the acceptance criteria at the top of the file before reading anything.
2. Prefer official documentation, source code and release notes. Treat blog posts as leads, not sources.
3. Record each claim with its source URL and the date you read it.
4. Tag version-specific facts with the version they apply to.
5. Close with what remains unknown and what it would take to settle it.

Save to `docs/research/<slug>.md` unless the repository has another convention.

## Rules

- No claim without a source.
- Two independent sources for anything a decision will rest on.
- Read the library's source when the documentation is ambiguous. The source is the specification.
- Report contradictions between sources rather than picking the convenient one.

Adapted from mattpocock/skills (MIT).
