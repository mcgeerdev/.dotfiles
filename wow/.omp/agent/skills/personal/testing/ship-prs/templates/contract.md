# Contract: {{slug}}

You are the worker for one pull request in job `{{job}}`. The orchestrator
wrote this file. Follow it top to bottom. It overrides your general defaults
where they conflict.

## Intent

{{one sentence: the single change this PR makes}}

## Acceptance criteria

1. {{observable, testable result}}

## Out of scope

- {{things a reader might expect here that belong elsewhere}}

## Setup

| Field | Value |
| --- | --- |
| Repo | `{{repo}}` |
| Worktree (work only here) | `{{worktree}}` |
| Branch | `{{branch}}` |
| PR base | `{{base}}` |
| Diff base | `{{diff_base}}` (`origin/master`, or the parent branch for a stacked PR) |
| Linear ticket | `{{ticket_id}}` (for the PR footer only, never call Linear) |
| Verifier pane (in the PR's Checks tab) | `{{verifier_pane}}` |
| Checks pane (in the PR's Checks tab) | `{{checks_pane}}` |
| Status file | `{{job_dir}}/prs/{{slug}}/status.json` |
| Verdict file | `{{job_dir}}/prs/{{slug}}/verdict.json` |
| Needs tilt | {{yes or no}} |
| Claude full review | {{yes or no}} |
| Reviewers | {{GitHub handles}} |
| Skill dir | `{{skill_dir}}` |

## Test plan

{{commands from the plan: unit tests, typecheck, lint, and integration tests when tilt is needed}}

## Pipeline

Write `status.json` (schema below) every time you change stage.

1. **Skills.** Read `skill://pr-house-style`, `skill://git-commit`,
   `skill://unslop`, `skill://babysit-pr` and `skill://pr-review-comments`.
2. **Implement** (`implementing`). Change only what the intent needs. When you
   find another problem, add one line to `out_of_scope` and leave the code alone.
3. **Local checks** (`local_checks`). Run each test plan command in the checks pane:
   `{{skill_dir}}/scripts/run-in-pane.sh {{checks_pane}} 30 "<command>"`.
   Fix failures before moving on.
4. **Tilt**, only when needs tilt is yes.
   `{{skill_dir}}/scripts/tilt-lock.sh acquire {{slug}} --wait 3600`, then in the
   checks pane run `mise run tilt:ci`, the integration tests and
   `mise run tilt:down`. Release with `tilt-lock.sh release {{slug}}` even when
   a step fails. A busy lock after the wait means stage `blocked`.
5. **Commit** per `skill://git-commit`.
6. **CodeRabbit** (`coderabbit`). Run
   `coderabbit review --agent --base {{diff_base}} --committed`. Fix the real
   findings, commit, rerun until it reports none. A finding you judge wrong goes
   in `disputed` with a one-line reason. When it's rate limited, note it in
   `blocker` and continue.
7. **Verifier** (`verifying`). Run
   `{{skill_dir}}/scripts/run-in-pane.sh {{verifier_pane}} 20 "{{skill_dir}}/scripts/verify.sh {{job_dir}}/prs/{{slug}}/contract.md {{worktree}} {{diff_base}} {{job_dir}}/prs/{{slug}}/verdict.json"`.
   On fail, read `verdict.json`, revert the out-of-scope hunks (record them in
   `out_of_scope`), meet the unmet criteria and run it again. After three fails,
   set stage `blocked` and stop.
8. **Draft PR.** Push with `git push -u origin {{branch}}`. Open a draft PR
   against `{{base}}` per `skill://pr-house-style`, using the repo's PR
   template, with `Closes {{ticket_id}}` in the footer. Record `pr_url`.
9. **Claude review**, only when Claude full review is yes:
   `gh pr comment <number> --body "@claude full review"`.
10. **Review loop** (`in_review`). Follow `skill://babysit-pr` with these overrides:
    - This pipeline is the user's request to mark the PR ready once the gate in
      step 11 passes.
    - After pushing fixes for Claude findings, comment `@claude review` so
      Claude resolves the threads it agrees are fixed.
    - Human comments, and any bot finding you want to dismiss: set stage
      `needs_user`, put the question in `question`, end your turn and wait.
    - Base moved or conflicts: `needs_user`. Never rebase or force-push without
      the user's approval.
    - After every push, rerun step 7 so the verdict matches the latest HEAD.
11. **Ready gate.** All of these hold on the latest HEAD: required checks green,
    `verdict.json` passes and its `head` equals `git rev-parse HEAD`, zero
    unresolved review threads, and `gh pr view --json mergeable` reports
    `MERGEABLE`. Then run `gh pr ready <number>` and
    `gh pr edit <number> --add-reviewer {{reviewers}}`, set stage `ready` and stop.

## status.json

```json
{
  "slug": "{{slug}}",
  "stage": "implementing | local_checks | coderabbit | verifying | in_review | needs_user | blocked | ready",
  "pr_url": null,
  "head": null,
  "verdict": null,
  "checks": "pending | green | red | null",
  "unresolved_threads": null,
  "out_of_scope": [],
  "disputed": [],
  "question": null,
  "blocker": null,
  "updated_at": "ISO 8601"
}
```

## Hard rules

- Never merge, approve, enable auto-merge or push to `master`.
- Never deploy or change infrastructure. Cluster access is read-only.
- Never call Linear. The orchestrator owns the ticket.
- Stay inside the worktree. Never touch another PR's branch.
- When you need the user, use `needs_user` and stop. Don't wait in a loop.
