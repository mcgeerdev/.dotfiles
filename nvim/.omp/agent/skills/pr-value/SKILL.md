---
name: pr-value
description: Analyze a GitHub PR against the codebase and score its value from 1 (no/low value) to 5 (very high value) using a fixed rubric, saving a self-contained HTML scorecard. Use when the user asks whether a PR adds value, to rate/score a PR, "does it add value", or for a value analysis of a change.
argument-hint: "<pr-number>"
---

# PR Value Score

Analyze a pull request's changes against the codebase and score its value from 1 (no/low value) to 5 (very high value) using the fixed rubric below. Save a self-contained HTML scorecard; reply in chat with only the score, one sentence, and a link.

## Input

The argument is a **PR number** (a bare integer, or a full `owner/repo/N` reference).

**Fail fast if no PR number is supplied.** If the invocation carries no argument, stop immediately and tell the user:

> This skill requires a PR number, e.g. `/pr-value 1234`.

Do not guess a number, do not pick "the latest PR", do not proceed.

**Validate the terminal segment.** Whether the argument is a bare integer or `owner/repo/N`, the final `/`-separated segment MUST match a positive integer (`^[1-9][0-9]*$`). If it is missing or non-numeric, stop with the same message above — never interpolate an unvalidated value into a path or command.

**Resolve the repo name.** The output path is keyed on the bare repo name, no owner. For `owner/repo/N` it is the middle segment; otherwise read it off the `URL:` line of the PR metadata fetched in step 1 (`https://github.com/<owner>/<repo>/pull/<N>`) — no extra lookup, and it always names the repo the PR actually lives in, even when the head branch is a fork. It MUST match `^[A-Za-z0-9._-]+$` and MUST NOT be exactly `.` or `..` — if it does not, stop rather than interpolate it into a path. A leading dot is legal (`.dotfiles`) and simply yields a hidden directory.

## Steps

1. **Read the PR.** Fetch metadata + discussion with `read pr://<number>` and the diff file listing with `read pr://<number>/diff` (per-file slices via `pr://<number>/diff/<i>`, whole diff via `pr://<number>/diff/all` for small PRs). For a bare integer this resolves against the current checkout's `owner/repo`; pass `owner/repo/N` to target another repo.

2. **Ground in the codebase.** For each substantive change in the diff, run targeted lookups — this evidence drives the Codebase fit and Maintainability scores:
   - New functions/utilities/components → `grep` the repo for existing equivalents the PR duplicates or should have reused.
   - Changed/removed exported symbols → `grep` (or `lsp references` when a server is up) for callers the PR missed or breaks.
   - New patterns/conventions → check whether a rival convention already exists for the same job.
   - **Repo routing:** if the PR's `owner/repo` matches the current checkout, use local `grep`/`read`. Otherwise use the `github` device (`op: search_code` and `op: file_read` scoped to that repo) for the same lookups, and mark the report "remotely grounded". Never `pr_checkout` — analysis is diff + reads only.

3. **Score five dimensions**, each 1–5, each with cited evidence (file + symbol/hunk from the diff or a grep result):

   | Dimension | Weight | 1 (low) | 3 (mid) | 5 (high) |
   |---|---|---|---|---|
   | Problem importance | 0.30 | Cosmetic churn, no user/maintainer-visible problem solved | Real but minor improvement or narrow fix | Fixes a live defect, unblocks work, or delivers a clearly needed capability |
   | Codebase fit | 0.20 | Duplicates existing utilities or adds a rival convention | Mostly reuses patterns, minor reinvention | Reuses existing patterns; deletes or consolidates duplication |
   | Maintainability impact | 0.20 | Adds complexity/abstraction with no payoff | Roughly neutral for future readers | Net simpler: less code, clearer boundaries, fewer special cases |
   | Risk vs. reward | 0.20 | High blast radius or correctness risk for marginal gain | Moderate risk, proportionate gain | Low risk relative to the value delivered; well-contained |
   | Scope discipline | 0.10 | Drive-by edits, unrelated churn, scope creep | Mostly focused with minor strays | Change matches stated intent exactly |

4. **Compute the overall score.** Weighted mean of the five dimension scores using the table weights, rounded half-up to an integer. One override: if Problem importance = 1, cap the overall at 2 — churn cannot be high-value regardless of execution quality. State the arithmetic in the report.

5. **Emit the scorecard.** Write one self-contained `.html` file (no external assets, no CDN links) to `~/didx.projects/prs/${repo}/${pr_number}-value.html`, using the validated repo name and terminal integer; `mkdir -p ~/didx.projects/prs/${repo}` first, neither directory need exist. A re-run for the same PR overwrites its file — newest verdict wins. Structure:
   - A title naming the PR (`#<number>` and its title) with the overall score rendered prominently as a badge (`Value: <overall>/5`).
   - One-paragraph verdict: what the PR does and why it earns the score.
   - The dimension table with assigned scores and a one-line evidence citation per row.
   - The weighted-mean arithmetic line (e.g. `0.30·4 + 0.20·5 + 0.20·3 + 0.20·4 + 0.10·5 = 4.1 → 4`).
   - An Evidence section listing the concrete diff hunks and grep findings each score rests on.
   - If grounding was remote or incomplete, a confidence note saying so.
   - **Cross-link:** if the sibling diagram `~/didx.projects/prs/${repo}/${pr_number}.html` exists (from `pr-diagram`), include a relative link to it (`<a href="${pr_number}.html">`); omit the link when it does not.

6. **Reply in chat** with exactly: the overall score (`Value: <overall>/5`), a one-sentence rationale, and a clickable `file://` link (tilde expanded to its absolute path) to the scorecard. Do not reproduce the scorecard in chat.

## Constraints

- Every dimension score MUST cite evidence from the diff or a codebase lookup — never score on vibes or the PR description alone.
- Never invent duplication or missed callers; a grep that finds nothing is evidence FOR the PR — record it as such.
- Do not check out the PR or modify the working tree.
- The scorecard must render offline by opening it directly in a browser; inline styles only.
- **Do not take screenshots.** Inspecting the file in a headless browser to check the layout is fine — just do it without capturing an image.
