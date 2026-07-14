# AGENTS.md

This repo uses the same Grok CLI, one-shot skills, and agent-cage harness patterns developed in pfy-mentat.

For LLM-driven extraction and evaluation steps, invoke via:

- `grok one-shot` or the harness skills (see pfy-mentat/bootstrap/grok-cli and harness/agent-cage)
- The prompt template in CATEGORIZATION.md is designed for direct interpolation + call.

See pfy-mentat's AGENTS.md and docs/ops/ for operational details on cage sessions, write-guard, and eval harness usage.
