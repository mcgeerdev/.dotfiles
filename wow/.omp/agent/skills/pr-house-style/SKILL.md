---
name: pr-house-style
description: House rules for branches, worktrees, commits and pull requests. Use for "open a PR", "draft PR", "against master", "on a worktree", "stack the PRs", "commit and push", "update the PR body", or any `gh pr create` or `gh pr edit`.
---

# PR house style

The user has stated these rules in dozens of prompts. Apply them without being asked. An explicit instruction in the current prompt wins over anything here.

## Branch and worktree

1. Branch off the latest default branch. In `tofu` and `mono` that is `master`. Elsewhere, read it with `git symbolic-ref --short refs/remotes/origin/HEAD`.
2. Use a worktree when the user says so, or when they are busy on the current branch. Put it at `../<repo>-wt/<branch>`, for example `~/didx.projects/tofu-wt/<branch>`:
   `git fetch origin && git worktree add -b <branch> ../<repo>-wt/<branch> origin/master`
3. In a repo with a `.jj/` directory (`sc.projects/SecureCitizen.Portal`, `devan.projects/meta/portfolio`), use `jj` instead of git. Never move the `main` bookmark and never push to `main`. Create a feature bookmark on `@`.

## Pull request

1. Open it as a draft against the default branch unless the user asks for ready. Plan jobs in `tofu` skip drafts.
2. Title: imperative, under 70 characters.
   - `tofu`: prefix the site, matching the directory: `[CloudAPI Dev]`, `[CloudAPI Prod]`, `[Yoma Prod]`, `[Security Hub]`. Use `[CI]` for workflow changes and `[Deps]` for dependency bumps.
   - Other repos: match the last five merged titles (`gh pr list --state merged -L 5`).
3. Assign to self with `--assignee @me`. In `tofu`, the labeler workflow adds labels, so don't add them by hand.
4. Body:
   - If `.github/pull_request_template.md` exists (it does in `mono`), keep its headings and fill them.
   - Otherwise write two short sections. **What** is the value added and the final state, as bullets. **Why** is one sentence naming the trigger: a Datadog rule, a Linear ticket, an incident, or the user's request.
   - Leave out rollback steps, alternatives considered, the iteration history, how the agent worked, and a test plan section.
   - Run `unslop` over the body before `gh pr create` or `gh pr edit`.
5. Azure DevOps repos under `sc.projects/sc-remote-enroll` target `main`, whatever the harness reports as the base branch. Pass `--target-branch main`.

## Stacks

When asked to stack, base each PR on the previous branch in the stack and open them in order. Report the order with each URL.

## Code in the diff

- Add no new explanatory comments. Leave existing comments alone.
- Keep the diff to the request. Split unrelated changes into their own PRs, and say so.

## Commits

- Subject: imperative, capitalised, no trailing period, 50 characters or less. Body wrapped at 72, saying what and why.
- No AI attribution and no `Co-Authored-By` trailers.

## After opening

Report the URLs and what the reviewer should check. Don't watch CI unless the user asked for the run result.

## Rules

- A PR body the user has to trim is a failed PR body. Short is the default.
- Never force-push without `--force-with-lease`, and never push to the default branch.
