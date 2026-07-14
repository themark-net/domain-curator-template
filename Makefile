.PHONY: help process regenerate-catalog eval-quality smoke clean

help:
	@echo "domain-curator-template targets"
	@echo "  process            - Extract candidates from sources/x-posts.md and evaluate fit (implement using pfy-mentat Grok CLI / harness patterns)"
	@echo "  regenerate-catalog - Rebuild TOOLS.md from data/tools.json"
	@echo "  eval-quality       - Run consistency / drift checks on existing items"
	@echo "  smoke              - Quick validation that pipeline components parse"
	@echo ""
	@echo "After editing config/domain-params.md, re-run process on changed signal."

process:
	@echo "=== PROCESS ==="
	@echo "1. Parse sources/x-posts.md for new or updated posts (dedup by URL)"
	@echo "2. Extract candidate items (use investigate/one-shot skill patterns from pfy-mentat)"
	@echo "3. For each candidate, interpolate config/domain-params.md into the prompt template in CATEGORIZATION.md"
	@echo "4. Invoke LLM (Grok CLI or harness) and capture strict JSON output"
	@echo "5. Merge into data/tools.json (update or append; track last_evaluated and source refs)"
	@echo "6. Optionally run make regenerate-catalog"
	@echo ""
	@echo "TODO: Implement the above loop in scripts/process.py or as Make recipe calling your existing pfy-mentat tooling."
	@echo "See pfy-mentat's pipelines/ and harness/ for working reference implementations."

regenerate-catalog:
	@echo "=== REGENERATE ==="
	@echo "TODO: python script or jq + pandoc template that reads data/tools.json and emits TOOLS.md"
	@echo "Support optional awesome-list compatible section output."
	@echo "Sort by fit.overall desc or group by categories."

eval-quality:
	@echo "=== EVAL QUALITY ==="
	@echo "TODO: Re-score random sample or low-confidence items; flag drift vs current domain-params."
	@echo "Compare against pfy-mentat eval harness patterns if you copied them in."

smoke:
	@echo "Smoke checks: parse domain-params, validate tools.json against schema, dry-run prompt interpolation."

clean:
	rm -f pipelines/*/results.latest.md data/tools.json.bak
