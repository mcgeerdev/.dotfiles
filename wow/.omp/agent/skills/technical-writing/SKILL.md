---
name: technical-writing
description: Standard for documentation, RFCs, readmes, pull request descriptions and bodies, and commit messages. Use when writing or reviewing any of them.
---

# Technical writing

## Structure

One document serves one purpose: a tutorial, a how-to, a reference, or an explanation. Mixing two is the most common reason a document fails.

## Sentences

One idea per sentence. Active voice, present tense, and name the actor. Replace "queries are validated" with "the compiler validates queries".

## Instructions

One action per step, stating the outcome. Put the condition before the action, so the reader can skip the step.

## Terminology

Use one term per concept throughout. Expand an acronym once, on first use. Avoid idioms, which do not survive translation.

## Specific formats

- Commit subject: imperative mood, under 50 characters, no trailing period. Body wrapped at 72, explaining what and why.
- Pull request description: follow the repo's template when it has one. Otherwise what (the value added and the final state) and why (the trigger, in one sentence). Leave out rollback steps, alternatives considered and the iteration history. `pr-house-style` has the rest of the PR rules.
- Readme: what this is, how to run it, and where to go next.

Apply `unslop` as the last pass over anything written. For a pull request body, run it before `gh pr create` or `gh pr edit`, not after the user complains.

Adapted from pstack (MIT).
