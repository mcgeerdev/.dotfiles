---
name: pr-review-comments
description: Draft, preview, post and resolve inline review comments on a pull request you are reviewing. Use when the user asks to "write a comment on the PR", "make a suggestion", "show me how it would look in GitHub", "post comment 2", or "resolve the fixed threads".
---

# PR review comments

The user reviews other people's pull requests and posts the comments under their own name. Nothing reaches GitHub until they have read the exact text and said which comment to post. On PR 1500 in the week to 2026-10-19, 16 of the user's prompts went on getting drafts shown the way GitHub renders them, cutting a suggestion down, and deleting two comments posted before they were right.

## Draft

1. Fix the anchor. Fetch the head with `gh pr view <n> --json headRefOid` and read the lines from that commit: `git show <sha>:<path>`. Every draft names its path, line or line range, and the short SHA.
2. One finding per comment. Write one or two plain sentences: what is wrong and what to do. "The sign call here doesn't do anything. Remove it, rename the test and add a verify case for a good signature." Every suggestion carries this explanation above it.
3. Keep a ` ```suggestion ` block to the lines that change. Anchor the comment to those lines only, not the surrounding function. An empty suggestion deletes the anchored lines.
4. Save each draft as a review-comment JSON file in a `mktemp -d` scratch directory: `path`, `line`, `start_line` for a range, `side: "RIGHT"`, `body`.

## Preview

Show every draft in chat in two parts.

1. The raw body inside a four-backtick `markdown` fence, so the inner ` ```suggestion ` block shows as text and not as an empty code block.
2. A ` ```diff ` block of what GitHub will show: the anchored lines as `-` rows and the suggestion as `+` rows.

Number the drafts (1, 2a, 2b) and keep the numbers stable when you revise one, so "post 3" means the same comment every time.

To see drafts in GitHub itself, create a pending review: the same `POST .../pulls/<n>/reviews` call with no `event` field. Only the user can see a pending review, rendered on the Files tab, and they submit it from there. GitHub allows one pending review per user per pull request.

## Post

- Post only the drafts the user names. "Show me" never means "post".
- Before posting, fetch `headRefOid` again. If the branch moved (a rebase or a new push), re-read the anchored lines at the new head, update the drafts, and show the changed ones again.
- Post a batch as one review: `gh api -X POST repos/<owner>/<repo>/pulls/<n>/reviews --input review.json` with `commit_id`, `event: "COMMENT"`, an empty `body` and the `comments` array. A single comment goes to `pulls/<n>/comments` with `commit_id` in the payload.
- Reply with each comment's `html_url`.
- Delete a posted comment (`gh api -X DELETE repos/<owner>/<repo>/pulls/comments/<id>`) only when the user asks.

## Resolve

- List threads with GraphQL `pullRequest.reviewThreads { id isResolved comments(first: 1) { databaseId url body } }`.
- For each of the user's threads, say whether the reply or a later commit fixes it, with the commit or line as evidence: resolved, partly resolved, or not resolved.
- Resolve only the threads the user approves: `gh api graphql -f query='mutation { resolveReviewThread(input: {threadId: "<id>"}) { thread { isResolved } } }'`.

## CodeRabbit

The CodeRabbit CLI allows 3 reviews per hour on the user's plan.

- Check `coderabbit usage` before a run.
- Run `coderabbit review --agent --committed --base-commit <base>` once per head commit. Save the output to the scratch directory and reuse it for every follow-up question.
- Ask before running it again.
