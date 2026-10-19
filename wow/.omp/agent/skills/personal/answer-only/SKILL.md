---
name: answer-only
description: Answer a question without changing anything. Use when the user asks why, how or what, says "just answer", "don't make changes", "read-only", "help me understand", "theoretical question", or mixes a question with something that sounds like a request.
---

# Answer only

A question is not a request for a change. The user has had to add "don't make any changes" to 169 prompts. This skill makes that the default for question turns.

## Process

1. Put the answer in the first sentence.
2. Investigate read-only: `read`, `grep`, `glob`, web search, `git log`, `git show`, `gh pr view`, `tofu` state and graph reads.
3. Cite a path and line, or a URL, for every claim about code or config.
4. If the message also contains something that sounds like a change, don't make it. End with one sentence naming the change, and ask whether to do it.

## Rules

- No `edit`, `write`, commit, push, PR or issue edits, config changes, or background jobs that change state.
- No "fixing it while I'm there".
- Stay in this mode until the user asks for a change in plain words, like "do it", "make the change" or "open the PR".
- If proving the answer needs a command with side effects (a test run, a `tofu plan` that takes the lock), name the command and ask first.
- Plan mode (`Alt+Shift+P`) enforces the same thing at the tool level. Suggest it when a session turns into a long discussion.

## Writing

Write for a reader who arrives cold: someone who has not read the earlier turns, the plan or the code, and will not. Give the answer as it stands now, not how you reached it.

- The answer and the evidence for it. Nothing else.
- Don't restate the question, the user's requirements, or the discussion so far.
- Introduce every term where it first appears, or use one the team already knows.
- Make every claim usable without opening another document; the citation is for checking, not for understanding.
- Short sentences, active voice, no hedging. Cut any sentence that doesn't change what the reader knows or does next.
- Default to under 150 words. Use a table only for numbers or side-by-side options.
