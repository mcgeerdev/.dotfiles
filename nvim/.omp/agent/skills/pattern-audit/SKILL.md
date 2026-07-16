---
name: pattern-audit
description: Before writing new infra code, scan for existing shared modules and provider aliases to reuse
---
1. Search for modules/ directories and list shared modules with their inputs
2. Search for provider alias definitions (aws.us, etc.)
3. Search for similar resource patterns already deployed
4. Report findings BEFORE proposing new code
