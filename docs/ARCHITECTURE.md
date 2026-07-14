# Architecture

This template implements a closed-loop curator:

Signal (X posts) → Extract candidates (LLM) → Evaluate fit (templated prompt + domain-params) → Merge to JSON → Regenerate readable catalog → (optional) Quality/eval pass.

All domain variability is isolated to `config/domain-params.md` and the rubric inside it. The prompt and merge logic stay stable.

The design directly generalizes the working implementation in pfy-mentat (heavy harness/eval) and sysadmin-tools (lighter). Copy patterns from those repos into your `scripts/` or Makefile targets as needed.
