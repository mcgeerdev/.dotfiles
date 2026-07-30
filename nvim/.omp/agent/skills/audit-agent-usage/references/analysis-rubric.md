# Analysis Rubric

Use this rubric after deterministic collection. Treat signals as candidates for investigation, not proof of waste.

## Evidence levels

- **Observed:** Directly counted or present in session metadata.
- **Supported inference:** Consistent with metadata and at least one reviewed transcript.
- **Hypothesis:** Plausible but not verified; state the test needed.

## Core measures

### Usage

- Input, output, cache-read, cache-write, reasoning, and total tokens.
- Recorded or estimated cost.
- Assistant turns and elapsed duration.
- Model/provider mix.

### Orchestration

- Main, advisor, and subagent share of OMP usage.
- Subagent tool calls per session.
- Advisor assistant turns relative to primary turns.
- Fan-out sessions with three or more delegation calls.

### Tool behavior

- Calls and errors by tool.
- Exact repeated-call signatures within a session. Arguments are hashed and never emitted.
- Long sequences of reads/searches without edits or a conclusive answer.
- Repeated verification after the relevant state stopped changing.

### Outcomes

- Fully achieved, mostly achieved, partially achieved, failed, or unclear.
- User corrections, interruptions, and reversals.
- Files changed, tests run, and durable artifacts produced when observable.
- Compare high-cost failures with low-cost successes before recommending a cheaper model.

## Candidate waste signals

Prioritize review when one or more are true:

- advisor or subagent usage exceeds 25% of session usage;
- cache-read tokens dominate while little new work is produced;
- identical tool-call signatures repeat;
- tool errors trigger retries without a changed approach;
- three or more subagents are launched for a narrow task;
- a short interaction uses a high-cost model with high reasoning;
- the agent rereads files it just wrote or repeatedly searches the same scope;
- the session ends without an outcome after substantial usage.

Do not call cached tokens intrinsically wasteful. Prompt caching may be inexpensive and beneficial; investigate why the same context is repeatedly invoked.

## Recommendation categories

1. **Routing:** Move simple questions to a small model; reserve strong models for complex work.
2. **Reasoning:** Use low/auto by default and explicit high reasoning for difficult tasks.
3. **Advisor policy:** Invoke after meaningful changes, failures, or before final review—not every tool turn.
4. **Delegation:** Add explicit thresholds and maximum fan-out.
5. **Tools:** Tighten tool descriptions, defaults, result sizes, and retry behavior.
6. **Context:** Shorten global instructions and load specialized guidance only when triggered.
7. **Skills:** Improve triggering, boundaries, reusable scripts, verification, and progressive disclosure.
8. **Evaluation:** Re-run a fixed set of representative tasks and compare success, latency, and usage.

## Recommendation standard

For every proposed change, state:

- what was observed;
- why the change follows;
- the smallest change to try;
- risk or tradeoff;
- validation metric;
- confidence.

Prefer reversible trials over permanent global changes.
