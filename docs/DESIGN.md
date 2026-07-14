# Design

The curator follows a strict separation:

- Domain-specific truth: only in `config/domain-params.md`
- Evaluation logic & prompt: in `CATEGORIZATION.md` (stable across domains)
- Data model: `data/tools.json` + schema
- Human output: generated `TOOLS.md`
- Signal: append-only `sources/x-posts.md`

This makes cloning + customization trivial while preserving the high-quality eval loop proven in pfy-mentat and sysadmin-tools.
