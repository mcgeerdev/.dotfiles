---
name: pr-diagram
description: Analyze the changes in a GitHub PR and produce a self-contained HTML file with an embedded SVG diagram explaining them. Use when the user asks to visualize, diagram, or explain a pull request's changes as HTML/SVG.
argument-hint: "<pr-number>"
---

# PR Change Diagram

Analyze a pull request's changes and emit a single self-contained HTML file whose centerpiece is an SVG diagram explaining what changed and how the pieces relate.

## Input

The argument is a **PR number** (a bare integer, or a full `owner/repo/N` reference).

**Fail fast if no PR number is supplied.** If the invocation carries no argument, stop immediately and tell the user:

> This skill requires a PR number, e.g. `/pr-diagram 1234`.

Do not guess a number, do not pick "the latest PR", do not proceed.

**Validate the terminal segment.** Whether the argument is a bare integer or `owner/repo/N`, the final `/`-separated segment MUST match a positive integer (`^[1-9][0-9]*$`). If it is missing or non-numeric, stop with the same message above — never interpolate an unvalidated value into a path or command.

**Resolve the repo name.** The output path is keyed on the bare repo name, no owner. For `owner/repo/N` it is the middle segment; otherwise read it off the `URL:` line of the PR metadata fetched in step 1 (`https://github.com/<owner>/<repo>/pull/<N>`) — no extra lookup, and it always names the repo the PR actually lives in, even when the head branch is a fork. It MUST match `^[A-Za-z0-9._-]+$` and MUST NOT be exactly `.` or `..` — if it does not, stop rather than interpolate it into a path. A leading dot is legal (`.dotfiles`) and simply yields a hidden directory.

## Steps

1. **Read the PR.** Fetch metadata + discussion with `read pr://<number>` and the actual diff with `read pr://<number>/diff` (per-file slices via `pr://<number>/diff/<i>`, whole diff via `pr://<number>/diff/all`). For a bare integer this resolves against the current checkout's `owner/repo`; pass `owner/repo/N` to target another repo.

2. **Analyze the changes.** Identify: the intent of the PR, the files/modules touched, new vs. removed vs. modified components, and the relationships between them (call flow, data flow, dependency, before/after). This — not the raw diff — is what the diagram must communicate.

3. **Design the SVG diagram.** Choose the structure that fits the change (flow, before/after, module dependency, sequence, state). Hand-author clean SVG:
   - Boxes/nodes for the key components, edges for relationships, labels for what changed.
   - Color-encode change type (e.g. green = added, red = removed, amber = modified) with a legend.
   - Readable at a glance: no overlaps, sane spacing, legible font sizes.

4. **Emit the HTML.** Write one self-contained `.html` file (no external assets, no CDN links) with:
   - A title naming the PR (`#<number>` and its title).
   - A short prose summary of the change.
   - The inline `<svg>` diagram.
   - A legend explaining the color/shape encoding.
   - **Cross-link:** if the sibling value scorecard `~/didx.projects/prs/${repo}/${pr_number}-value.html` exists (from `pr-value`), a relative link to it (`<a href="${pr_number}-value.html">`); omit the link when it does not.
   Save it as `~/didx.projects/prs/${repo}/${pr_number}.html`, using the validated repo name and terminal integer; `mkdir -p ~/didx.projects/prs/${repo}` first, neither directory need exist. A re-run for the same PR in the same repo overwrites its file — newest diagram wins.

5. **Output only a link.** Your final reply is just a clickable `file://` link to the generated file, tilde expanded to its absolute path. Do not summarize the PR or explain the diagram in chat — the HTML carries all of that.

## Constraints

- SVG must be inline in the HTML; the file must render offline by opening it directly in a browser.
- Ground every node/edge in the actual diff — never invent components the PR does not touch.
- Prefer clarity over completeness: diagram the load-bearing changes, not every one-line edit.
- **Do not take screenshots.** Never capture, save, or embed an image of the rendered page. Inspecting the file in a headless browser to check the layout is still fine — just do it without capturing an image.
