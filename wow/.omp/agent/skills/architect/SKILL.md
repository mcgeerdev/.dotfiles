---
name: architect
description: Settle types, signatures and module shape before implementation begins. Use for "architect this", "design this first", or non-trivial work where writing code immediately would lock in the wrong shape.
---

# Architect

## Process

1. Write the call site first, as it would read if the interface already existed.
2. Derive the types and signatures from that call site, not from the implementation you have in mind.
3. Name the seam: what sits behind the interface and what the caller can never see.
4. List what the interface deliberately refuses to express.
5. Hand over the sketch, then stay available while the implementation fills it in.

## Rules

- No implementation in the sketch. Signatures and types only.
- Make illegal states unrepresentable before adding validation to catch them.
- If the call site reads badly, the interface is wrong. Change the interface.
- A lot of behaviour behind a small interface is the goal. A thin wrapper with one caller is not.

Adapted from pstack (MIT).
