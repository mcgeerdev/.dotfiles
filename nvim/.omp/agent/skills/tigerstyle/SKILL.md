---
name: tigerstyle
description: "TigerBeetle's coding style guidelines covering safety, performance, and developer experience. TRIGGER when: user mentions 'tigerstyle' or 'tiger style', asks to apply TigerStyle, or requests a code review with explicit safety and performance focus."
license: Apache-2.0
source: https://github.com/tigerbeetle/tigerbeetle/blob/main/docs/TIGER_STYLE.md
---

# TigerStyle

Apply these guidelines when writing or reviewing code. Design goals are **safety**, **performance**,
and **developer experience** — in that order.

## Core Philosophy

- Simplicity is not the first attempt but the hardest revision. Spend mental energy upfront.
- **Zero technical debt policy**: do it right the first time. The second time may not come.
- An hour of design is worth weeks in production.
- **Always say why.** Explain the rationale for every decision — in comments, commit messages,
  and code.

## Safety

### Assertions

- **Assert all function arguments and return values, pre/postconditions and invariants.**
  Minimum density: two assertions per function.
- **Pair assertions**: for every property to enforce, find at least two code paths for assertions
  (e.g., before writing to disk and after reading back).
- Split compound assertions: prefer `assert(a); assert(b);` over `assert(a and b);`.
- Use single-line `if` for implications: `if (a) assert(b)`.
- Assert compile-time constant relationships to document and enforce invariants.
- Assert **positive space** (what you expect) AND **negative space** (what you don't expect).
- Assertions are not a substitute for understanding — build a precise mental model first, then
  encode it in assertions.

### Control Flow

- Use only simple, explicit control flow. **No recursion** for bounded executions.
- Use **only a minimum of excellent abstractions** — every abstraction has a cost and leak risk.
- **Put a limit on everything**: all loops and queues must have a fixed upper bound.
- **Don't react directly to external events** — run at your own pace to maintain control flow
  and enable batching.
- Split compound conditions into simple nested `if/else` branches.
- State invariants positively. Prefer `if (index < length)` over `if (index >= length)`.
- Consider whether every `if` also needs a matching `else` to handle negative space.

### Memory and Variables

- All memory must be **statically allocated at startup**. No dynamic allocation/free after
  initialization.
- Declare variables at the **smallest possible scope**.
- **Minimize the number of variables in scope** to reduce misuse probability.
- Don't duplicate variables or take aliases — reduces probability of state getting out of sync.
- Calculate or check variables close to where/when they are used. Avoid POCPOU bugs.
- Pass large arguments by const reference when they should not be copied.
- Construct large structs **in-place** via out pointers to avoid copy-move allocations.

### Functions

- **Hard limit: 70 lines per function.**
  - Good function shape: few parameters, simple return type, meaty logic.
  - Centralize control flow in parent functions; move non-branchy logic to helpers.
  - ["Push `if`s up and `for`s down"](https://matklad.github.io/2023/11/15/push-ifs-up-and-fors-down.html).
  - Keep leaf functions pure; let parents manage state.
- **All errors must be handled.** 92% of catastrophic failures result from incorrect handling of
  non-fatal errors.
- **Explicitly pass options to library functions** at the call site — never rely on defaults.
- Ensure functions run to completion without suspending so precondition assertions stay valid.

### Types and Sizes

- Use explicitly-sized types (e.g., `u32`, `int32_t`) rather than architecture-dependent types.
- Appreciate all **compiler warnings at strictest settings**.

### Off-By-One Errors

- Treat `index`, `count`, and `size` as distinct types with clear conversion rules:
  `index` is 0-based, `count` is 1-based, `size = count × unit`.
- Add units/qualifiers to variable names (`latency_ms_max`, not `max_latency_ms`).
- Show intent with division — use explicit functions or annotate whether you expect exact,
  floor, or ceiling division.

### Buffer Safety

- Guard against **buffer bleeds**: padding not zeroed correctly can leak sensitive information
  or violate deterministic guarantees.

## Performance

- Think about performance **from the design phase** — this is where 1000x wins are found.
  You cannot measure a system before it is built.
- **Back-of-the-envelope sketches** across the four resources: network, disk, memory, CPU;
  and their two characteristics: bandwidth, latency.
- Optimize for slowest resources first: network → disk → memory → CPU (after adjusting for
  frequency of use).
- **Amortize costs by batching** network, disk, memory, and CPU accesses.
- Distinguish control plane from data plane — batching enables high assertion safety without
  losing performance.
- Be predictable. Don't force the CPU to zig-zag. Give it large chunks of work.
- Be explicit. Minimize dependence on the compiler to do the right thing.
  Extract hot loops into standalone functions with primitive arguments to make register caching
  obvious and redundant computations easier to spot.

## Developer Experience

### Naming

- **Get the nouns and verbs just right.** Great names capture what a thing is or does.
- Use `snake_case` for functions, variables, and file names.
- **Do not abbreviate** variable names (except primitive integers in sort/matrix code).
- Use proper capitalization for acronyms: `VSRState`, not `VsrState`.
- Add **units or qualifiers last**, sorted by descending significance: `latency_ms_max`.
- Infuse names with meaning — good names inform the reader of semantics and ownership.
- When choosing related names, prefer equal character counts so variables line up in source
  (`source`/`target` over `src`/`dest`).
- Prefix helper/callback names with the calling function: `read_sector()` and
  `read_sector_callback()`.
- Callbacks go last in parameter lists.
- **Order matters**: put important things near the top of files. `main` goes first.
  For structs/classes: fields → types → methods.
- Don't overload names with multiple context-dependent meanings.
- Prefer nouns over adjectives/participles for descriptors — nouns compose better.

### Comments and Commits

- **Don't forget to say why.** Code is not documentation.
- **Don't forget to say how.** Explain methodology, especially in tests.
- Comments are sentences: space after slash, capital letter, full stop (or colon before related
  code). End-of-line comments can be phrases without punctuation.
- **Write descriptive commit messages** — commit messages are read; PR descriptions are not
  stored in git and are invisible in `git blame`.

### Cache Invalidation

- Shrink scope to minimize variables and reduce wrong-variable probability.
- Prefer simpler return types — reduce dimensionality at the call site.
- Use newlines to **group resource allocation and deallocation** (before alloc, after cleanup)
  to make leaks easier to spot.

### Style

- Run your language's autoformatter consistently across the team.
- **Hard limit: 100 columns** per line. Use it fully. Never exceed it.
- Add braces to `if` statements unless they fit on a single line (defense against "goto fail").

### Dependencies and Tooling

- **Minimal dependencies.** If you only need a specific feature or function from a dependency,
  prefer reimplementing it over pulling in the entire package. Every dependency introduces
  supply chain risk, safety/performance risk, and maintenance burden.
- **Standardize your toolbox.** A small, consistent set of tools is simpler to operate than
  an array of specialized instruments. Standardization reduces dimensionality as the team grows.

> "The right tool for the job is often the tool you are already using—adding new tools has a
> higher cost than many people appreciate" — John Carmack
