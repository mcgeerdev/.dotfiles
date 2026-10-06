---
name: principle-sequence-verifiable-units
description: Break work into units that each end in a verifiable state, ordered so the sequence proves itself to a reviewer. Use for multi-step work, migrations, and deciding how to split commits and pull requests.
---

# Sequence verifiable units

Each unit ends somewhere you can prove you are standing.

- Every commit builds and passes checks on its own.
- Verify unit N before starting unit N plus one.
- Order delivery so a reviewer reading in sequence sees the argument being built.
- Split a pull request when reviewing it would require two different mental models.
- A unit that cannot be verified is not a unit. Make it smaller or make it observable.

Adapted from pstack (MIT).
