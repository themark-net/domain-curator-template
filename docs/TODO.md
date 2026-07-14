# TODO

## Immediate (to make template fully functional)
- [ ] Implement `make process` target or `scripts/process.py` that:
  - Parses sources/x-posts.md
  - Extracts candidates (lift from pfy-mentat investigate skill)
  - Calls the interpolated CATEGORIZATION prompt via Grok CLI / harness
  - Merges JSON results into data/tools.json with dedup
- [ ] Implement `make regenerate-catalog` (simple Python or jq + template to emit TOOLS.md from data/tools.json, with optional awesome formatting)
- [ ] Add `scripts/` directory with the above + helper for domain-params interpolation

## Next
- Copy/adapt eval harness and smoke pipelines from pfy-mentat/pipelines/eval if desired for quality gates
- Add GitHub Action for scheduled re-process on new X signal (see local-llm-x-monitor skill pattern)
- Bootstrap script that auto-creates initial TOOLS.md skeleton and runs first process

See pfy-mentat's docs/TODO.md and docs/automation/ for reference implementations of the above.
