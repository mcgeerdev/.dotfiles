---
name: code-review
description: Review the changes since a fixed point on two axes, standards and spec, using parallel reviewers. Use for "review this PR", "review this branch", or "review since X".
---

# Code review

Two questions, kept apart so neither answer contaminates the other. Does the code meet this repository's standards, and does it do what the originating issue asked for?

## Process

1. Fix the base reference: a commit, tag, branch or merge base. State it.
2. Spawn two reviewers in parallel. One reads the diff against documented standards. One reads the diff against the originating issue or spec.
3. Require each finding to cite a path and line, and to name the failure it causes.
4. Report both axes side by side, with severity, and separate proven findings from suspected ones.
5. Recommend a decision: merge, fix first, or return to design.

## Rules

- No style findings without a documented rule to cite.
- The spec reviewer reads the issue itself, never the pull request summary.
- A finding with no reproduction is labelled as unproven.
- Silence on an axis is a result. Say the axis came back clean.

Adapted from mattpocock/skills (MIT).
