---
name: ship-prs
description: Orchestrate one job of pull requests from herdr. Plan in HTML with the user, open one Dyson ticket, run one worker per PR in its own herdr tab with verifier and checks panes, and stop every PR at ready for review. Use for "ship this", "/skill:ship-prs", "spin up workers", "start the PRs", "job status", "clean up the job".
hide: true
---

# Ship PRs

You are the orchestrator for one job. One job is one herdr workspace, one
plan, one Linear ticket and one or more PRs. Workers build. The verifier,
CodeRabbit, the Claude review and CI check. The user decides and merges.

## Roles

| Role | Runs as | Does |
| --- | --- | --- |
| Orchestrator (you) | this omp session, with the advisor | plans with the user, writes contracts, starts workers, relays questions, cleans up |
| Worker | `omp --config ~/.omp/agent/worker.yml --model @task`, one per PR | follows its contract from code to ready for review |
| Verifier | `scripts/verify.sh`, a stateless `omp -p --model @review` | checks the diff against the intent and criteria |

You never read PR diffs to judge the work. Your inputs are the status files,
`herdr agent list` and `gh pr view`.

## Files

Job dir: `~/didx.projects/plans/<job>/`, where `<job>` is a short kebab-case slug.

| File | Writer | Content |
| --- | --- | --- |
| `plan.html` | you | the plan the user approves, from `templates/plan.html` |
| `job.json` | you | machine state, schema below |
| `prs/<slug>/contract.md` | you | the worker's instructions, from `templates/contract.md` |
| `prs/<slug>/status.json` | worker | stage and blockers, schema in the contract template |
| `prs/<slug>/verdict.json` | verifier | last verdict and the HEAD it checked |

```json
{
  "job": "<job>",
  "repo": "/Users/devanmcgeer/didx.projects/mono",
  "ticket": {"id": "DYS-123", "url": "...", "branch_prefix": "<gitBranchName>"},
  "workspace_id": "<HERDR_WORKSPACE_ID>",
  "prs": [{
    "slug": "<slug>", "branch": "<branch_prefix>-<slug>", "base": "master",
    "nn": "01", "depends_on": [], "worktree": "...",
    "tabs": {"worker": "...", "checks": "..."},
    "panes": {"worker": "...", "verifier": "...", "checks": "..."},
    "agent": "w-<slug>", "pr_url": null,
    "state": "planned | running | ready | merged"
  }]
}
```

## 1. Plan

1. Check `HERDR_ENV=1`. Outside herdr, stop and tell the user to start the job
   from a herdr pane.
2. Frame the problem with the user until you can state it in two sentences.
   Research the code and the authoritative sources. Cite `path:line`.
3. Split the work into PRs, one intent each, numbered `01`, `02`, ... in plan
   order. GitHub numbers don't exist until the push, so tabs use these.
   Out-of-scope fixes become their own PRs. For each PR settle:
   - intent and numbered acceptance criteria
   - base: `master`, or the parent PR's branch for a stack
   - depends on, needs tilt, reviewers
   - Claude full review: propose yes for large or security-sensitive PRs.
     The user decides.
4. Write `plan.html` from `templates/plan.html`. Record every user decision
   with its date. Keep an Unanswered Questions section.
5. Run `open <job-dir>/plan.html`, then iterate until the user approves it.
   Start nothing before approval.

## 2. Ticket

1. Draft one ticket for the Dyson team from the plan: the intent as the title
   and a short description with a "Done when" list. Show the draft.
2. After the user approves, create it with the Linear MCP `save_issue`
   (team Dyson, assignee me). Read `gitBranchName` with `get_issue`.
3. Each PR branch is `<gitBranchName>-<slug>`, so Linear links the PRs.
4. Run `herdr workspace rename "$HERDR_WORKSPACE_ID" <job>` and
   `herdr tab rename "$HERDR_TAB_ID" orchestrator`, then write `job.json`.

## 3. Start workers

Run at most 2 workers at once, 4 when the user asks. A stacked PR starts once
its parent's stage reaches `in_review`. For each PR:

1. Worktree, per `skill://pr-house-style`:
   - base master: `git -C <repo> fetch origin`, then
     `git -C <repo> worktree add -b <branch> <repo>/../mono-wt/<branch> origin/master`
   - stacked: same, with the parent branch as the start point
2. Tabs and panes. Every command prints JSON. Read the IDs with `jq`. Create
   everything with `--no-focus` so the user's view stays on the orchestrator.
   - `herdr tab create --workspace "$HERDR_WORKSPACE_ID" --cwd <worktree> --label PR-<nn>-Worker --no-focus`
     gives `.result.tab.tab_id` and the worker pane `.result.root_pane.pane_id`.
   - `herdr tab create --workspace "$HERDR_WORKSPACE_ID" --cwd <worktree> --label PR-<nn>-Checks --no-focus`
     gives the checks tab and its root pane, the verifier pane.
   - `herdr pane split <verifier> --direction right --cwd <worktree> --no-focus`
     gives the checks pane `.result.pane.pane_id`.
   - `herdr pane rename <id> worker`, and the same for `verifier` and `checks`.
   - The worker drives both Checks panes from its own tab: herdr pane IDs work
     across tabs.
3. Write `prs/<slug>/contract.md` from `templates/contract.md`. Fill every
   `{{field}}`. Copy the intent, criteria and test plan from the approved plan
   word for word.
4. Start the worker:
   - `herdr agent start w-<slug> --kind omp --pane <worker> -- --config ~/.omp/agent/worker.yml --model @task`
   - `herdr agent prompt w-<slug> "Read <job-dir>/prs/<slug>/contract.md and follow it."`
5. Update `job.json`.

## 4. Watch

- Wait on workers with async bash: `herdr agent wait w-<slug> --timeout 3600000`.
  When it returns, read that PR's `status.json`.
- `needs_user`: put the worker's `question` to the user, short and verbatim.
  Send the answer with `herdr agent prompt w-<slug> "<answer>"`. The user may
  also answer in the worker pane directly.
- `blocked`: tell the user the `blocker`.
- New `out_of_scope` items: offer each as a new PR. Add it to the plan only
  after the user agrees.
- When every PR is `ready`, post the "up for review" update on the ticket per
  `skill://ticket-updates`.
- Status questions: answer from the status files as a table with PR, stage,
  URL and blocker.

## 5. Merges and cleanup

On each user turn, and when asked to clean up, run
`gh pr view <url> --json state,mergedAt` for every PR not yet `merged`.

- Merged: `herdr tab close` both of its tabs, remove the worktree per
  `skill://pr-house-style` "After merge", and set the PR to `merged`.
- A merged parent leaves its stacked children based on a dead branch. Ask the
  user before rebasing them. On approval, tell the child worker to rebase onto
  `origin/master`, change the PR base and push with `--force-with-lease`.
- All merged: post the "landed" update per `skill://ticket-updates` and tell
  the user the job is done.
- Close the workspace only when the user asks:
  `herdr workspace close "$HERDR_WORKSPACE_ID"`. That ends this session, so
  give your final report first.

## Rules

- Nobody merges, approves, enables auto-merge or pushes to `master` except the
  user. The bash interceptor blocks `gh pr merge` and pushes to `master`.
- No deploys. Infrastructure and cluster access stay read-only.
- Only you touch Linear, and only through the MCP.
- One intent per PR.
- Close only the tabs and worktrees this job created.
- Never rebase or force-push without the user's approval.
