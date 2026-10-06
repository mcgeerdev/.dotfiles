# Skills

Source of truth is `~/.dotfiles/wow/.omp/agent/skills` (reached as
`~/.omp/agent/skills`). `~/.claude/skills` and `~/.agents/skills` are symlinks to
this directory, so OMP, Claude Code and every agent that reads `~/.agents/skills`
load one copy. Personal production skills live under `personal/` and get a flat
`<name>` link here so discovery finds them.

`~/.claude/AGENTS.md` imports `skills/unslop/SKILL.md`, which loads the writing
rules into every Claude Code session.

## The production line

Two independent axes. Ownership says whose skill it is, lifecycle says how far
along it is. Discovery is non-recursive, one level under a registered root, so
the lane a skill sits in decides whether it loads at all.

| Owner | Stage | Location | Loaded by |
|---|---|---|---|
| adapted | testing | `testing/<name>` | OMP only, hidden. Run it with `/skill:<name>` |
| adapted | production | `<name>` | Both harnesses, advertised |
| adapted | retired | `retired/<name>` | Nothing |
| personal | testing | `personal/testing/<name>` | OMP only, hidden |
| personal | production | `personal/<name>` | Both harnesses, advertised |
| personal | retired | `personal/retired/<name>` | Nothing |

Paths are relative to this directory. Promoting never changes ownership, and
adopting never changes stage, so a personal skill can go through testing and
come out the other side still personal.

Both testing lanes load because they are listed in the OMP config's
`skills.customDirectories`. They stay out of the system prompt because the
scaffold sets `hide: true`, which keeps a draft reachable by name while stopping
the model reaching for it unprompted. That is the point of the stage: you can
exercise a draft without it competing with production skills.

Retired loads nowhere, because no root points at it. The files stay for
reference.

Drive it with `.dotfiles/wow/.omp/agent/bin/skill-stage`:

```bash
skill-stage list                    # every skill, its owner, stage and reach
skill-stage new <name>              # scaffold into adapted/testing
skill-stage new <name> --personal   # scaffold into personal/testing
skill-stage promote <name>          # testing -> production, strips hide
skill-stage demote <name>           # production -> testing, restores hide
skill-stage retire <name>           # park it where nothing loads it
skill-stage adopt <name>            # ownership -> personal, stage unchanged
skill-stage release <name>          # ownership -> adapted, stage unchanged
skill-stage move <name> <stage>     # explicit lifecycle move
skill-stage relink                  # repair symlinks after manual edits
```

Every command is idempotent, `new` included: asking for a state the skill is
already in reports that and exits 0. Each command repairs the flat
`<name> -> personal/<name>` links. Other symlinks are left alone.

Restart the harness after moving a skill. Discovery runs once, at startup.

## Verification and impact

| Skill | Use it when |
|---|---|
| [create-verification-skill](./create-verification-skill/SKILL.md) | The repo has no scripted way to prove its behaviour |
| [maintain-verification-skill](./maintain-verification-skill/SKILL.md) | The feature map has drifted from the app |
| [blast-radius](./blast-radius/SKILL.md) | A small diff might break something distant |
| [code-review](./code-review/SKILL.md) | Reviewing a branch or PR on standards and spec |
| [show-your-work](./show-your-work/SKILL.md) | Long or unattended work needs a decision trail |

## Investigation

| Skill | Use it when |
|---|---|
| [how](./how/SKILL.md) | You need runtime flow, ownership or layering |
| [why](./why/SKILL.md) | You need the rationale behind a decision |
| [research](./research/SKILL.md) | A question needs primary sources, captured as a doc |

## Delivery

| Skill | Use it when |
|---|---|
| [resolving-merge-conflicts](./resolving-merge-conflicts/SKILL.md) | A rebase or merge has stopped with conflicts |
| [architect](./architect/SKILL.md) | Interfaces should be settled before code |
| [to-tickets](./to-tickets/SKILL.md) | A plan needs breaking into tracked work |
| [figure-it-out](./figure-it-out/SKILL.md) | A large migration needs an auditable playbook |
| [swarm](./swarm/SKILL.md) | Independent slices can run in parallel |
| [wizard](./wizard/SKILL.md) | Only a human can perform the next steps |

## Writing and meta

| Skill | Use it when |
|---|---|
| [unslop](./unslop/SKILL.md) | Always, on anything written |
| [technical-writing](./technical-writing/SKILL.md) | Writing docs, RFCs, PR descriptions, commits |
| [git-commit](./git-commit/SKILL.md) | Writing a commit message |
| [google-style](./google-style/SKILL.md) | Writing or reviewing developer docs in Google style |
| [wait-what](./wait-what/SKILL.md) | A message did not land and needs re-pitching |
| [reflect](./reflect/SKILL.md) | A finished task should become skill edits |
| [automate-me](./automate-me/SKILL.md) | Your working style should become a skill |
| [usage-audit](./usage-audit/SKILL.md) | Reporting on omp, Claude Code and Codex usage |

## Personal

Mine, tied to this setup, kept in `personal/`.

| Skill | Use it when |
|---|---|
| [foundational-learning-radar](./foundational-learning-radar/SKILL.md) | Log a foundational concept after an explanation thread |
| [answer-only](./answer-only/SKILL.md) | Answer questions without changing anything |
| [pr-house-style](./pr-house-style/SKILL.md) | Branch, worktree, commit and PR rules |
| [pr-diagram](./pr-diagram/SKILL.md) | Diagram a pull request as self-contained HTML |

In testing (OMP only, hidden, run with `/skill:<name>`): `tofu-state-split`.

Retired: `teach`, kept in `retired/teach` for reference.

## Principles

One rule each, referenced by the skills above.

| Principle | Rule |
|---|---|
| [prove-it-works](./principle-prove-it-works/SKILL.md) | Verify against the real artifact, not a proxy |
| [make-operations-idempotent](./principle-make-operations-idempotent/SKILL.md) | Converge to the same end state on every rerun |
| [build-the-lever](./principle-build-the-lever/SKILL.md) | Build the tool instead of doing it by hand |
| [sequence-verifiable-units](./principle-sequence-verifiable-units/SKILL.md) | Each unit ends somewhere you can prove |
