---
name: audit-agent-usage
description: Audit Claude Code and Oh My Pi transcript histories for token waste, excessive tool use, unnecessary subagents or advisors, recurring friction, and skill-improvement opportunities. Use when asked to analyze agent usage, compare Claude with OMP, explain high token consumption, produce a transcript-usage HTML report, or recommend changes to agent models, prompts, configuration, or existing skills.
---

# Audit Agent Usage

Produce an evidence-backed, self-contained HTML report without turning the audit itself into an expensive agent run.

## Defaults

- Sources: `~/.claude/projects/` and `~/.omp/agent/sessions/`.
- Window: the last 30 days unless the user requests another period.
- Audit directory: `~/.dotfiles/nvim/.omp/audits/`.
- Output: `~/.dotfiles/nvim/.omp/audits/agent-usage-audit-YYYY-MM-DD.html` and a sibling `.json` summary. Use another location only when the user explicitly requests it.
- Treat provider-reported/catalogue cost as an estimate unless billing provenance is known.
- Keep all raw transcripts local. Never upload them or include secrets, full prompts, tool arguments, or file contents in the report.

## Workflow

### 1. Establish scope

Resolve `~` locally and verify both source directories. Continue with whichever source exists and disclose missing sources.

Ask only when the requested date range, output location, or privacy boundary cannot be inferred safely. Otherwise use the defaults.

Create `~/.dotfiles/nvim/.omp/audits/` when it does not exist. Keep the directory private to the local user where the platform supports permissions.

### 2. Collect deterministic metadata

Resolve this skill's filesystem directory from the injected `Skill:` metadata. Run `scripts/collect-usage.mjs` from that directory with Node.js or Bun:

```text
node <skill-dir>/scripts/collect-usage.mjs \
  --claude-root <home>/.claude/projects \
  --omp-root <home>/.omp/agent/sessions \
  --since-days 30
```

The collector defaults to `~/.dotfiles/nvim/.omp/audits/agent-usage-audit-YYYY-MM-DD.json` and automatically uses the newest earlier JSON audit in that directory for new/changed classification.

When the user requests a different output path or previous summary, add:

```text
--output <requested-summary.json> \
--previous-summary <previous-summary.json>
```

Do not use an LLM to recalculate counts already present in the JSON. Preserve the generated JSON beside the HTML so future audits can identify new and changed sessions.

### 3. Select transcripts for qualitative review

Analyze metadata for every transcript. Read transcript content selectively:

1. Include the highest-cost/token sessions.
2. Include sessions with repeated tool calls, tool errors, or high subagent fan-out.
3. Include OMP advisor and subagent traces when they materially contribute usage.
4. Include a balanced sample from Claude and OMP, including low-cost successful sessions as controls.
5. Default to at most 12 full transcripts and at most 3 excerpts per transcript.

If the user explicitly requires exhaustive content analysis, batch it and cache per-session findings. Explain the extra model cost before exceeding 25 full transcripts in one run.

For each selected session, record only:

- apparent goal and outcome;
- observed unnecessary work;
- repeated investigation, retries, or rework;
- tool or delegation decisions that materially affected cost;
- configuration, prompt, or skill change supported by the evidence.

Do not reproduce private transcript text. Refer to abbreviated session IDs and paraphrase.

### 4. Inspect configuration and skills narrowly

Inspect relevant configuration surfaces such as:

- `~/.omp/agent/config.yml`;
- applicable `AGENTS.md`, `CLAUDE.md`, and project `.omp/config.yml` files;
- skill names and descriptions under `~/.omp/agent/skills/` and `~/.claude/skills/`.

Read a skill body only when the audit evidence implicates that skill. Recommend edits; do not modify configuration or existing skills unless the user separately authorizes changes.

Read `references/analysis-rubric.md` before forming conclusions.

### 5. Build the report

Read `assets/report.css` and inline it into the HTML. Do not use CDNs, remote fonts, JavaScript frameworks, or network-loaded assets.

Include:

1. Executive summary
2. Data coverage and limitations
3. Usage by source, model, and OMP role
4. Advisor and subagent overhead
5. Tool-call errors, repetition, and fan-out
6. Representative session findings
7. Model and reasoning-level opportunities
8. Skills and configuration recommendations
9. Prioritized action plan
10. Methodology and privacy notes

Every recommendation must include:

- evidence or metric;
- affected source/session category;
- expected benefit stated conservatively;
- confidence: high, medium, or low;
- a way to verify whether the change helped.

Clearly distinguish observed facts from inference. Never invent dollar savings.

### 6. Verify

Before delivery:

- confirm both the HTML and JSON exist and are non-empty;
- check the HTML has a title, all required sections, valid closing tags, and no template placeholders;
- ensure no raw secrets, API keys, access tokens, full prompts, or tool arguments appear;
- confirm totals in prose match the JSON;
- report the exact analysis window and transcript counts.

Open the report only when the environment permits it or the user asks.

## Efficiency rules

- Prefer metadata aggregation over transcript ingestion.
- Never delegate one subagent per transcript.
- Never ask an advisor to review every audit step.
- Reuse cached summaries and analyze only new or changed sessions on later runs.
- Use a small/fast model for per-session classification; reserve a stronger model for final synthesis only when necessary.
- Optimize for successful outcomes per token, not minimum tokens in isolation.
