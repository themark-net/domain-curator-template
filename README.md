# domain-curator-template

Generalized template for building domain-specific tool/stack catalogs seeded from X posts and evaluated for fit by LLM against explicit, user-defined stack parameters and goals.

This is the reusable skeleton extracted from the working pattern in `themark-net/pfy-mentat` (local LLM dev tools/agents/frameworks) and `themark-net/sysadmin-tools` (sysadmin/homelab/infra). Clone it, define your domain once in `config/domain-params.md`, seed posts, and run the pipeline to produce a scored, categorized `data/tools.json` + human-readable `TOOLS.md`.

It is **not** another static awesome list. It produces living, criteria-driven catalogs with machine-actionable JSON, explicit fit scoring, and rationales tied directly to *your* stack and goals.

## Quickstart (after clone)

1. `cp config/domain-params.example.md config/domain-params.md`
2. Edit `config/domain-params.md` with your domain name, stack definition (core technologies + constraints + priorities), goals, and evaluation rubric. This is the single source of truth the LLM prompt reads.
3. Seed initial signal in `sources/x-posts.md` using the format shown in that file (append relevant X threads/posts for the domain).
4. Implement or extend the `make process` target (stubs + comments reference the exact extraction + evaluation patterns already working in pfy-mentat).
5. Run `make process && make regenerate-catalog`.
6. Review `data/tools.json` (source of truth) and generated `TOOLS.md`.
7. Iterate on rubric/weights in domain-params.md if scoring feels off.

## Core Flow

- **Ingest**: Append X posts (or other signal) to `sources/x-posts.md`.
- **Extract**: LLM (via your Grok CLI / one-shot / harness setup from pfy-mentat) pulls candidate items from posts.
- **Evaluate fit**: The templated prompt in `CATEGORIZATION.md` interpolates your `domain-params.md` and scores every candidate against the rubric. Output is strict JSON.
- **Merge**: Deduplicate by canonical URL/name, update scores/rationale/last_evaluated, write to `data/tools.json`.
- **Publish**: Regenerate `TOOLS.md` (awesome-style sections optional) sorted by fit or grouped by category.
- **Quality**: Optional eval pass flags low-confidence or drifted items.

## Customization Points (post-clone)

All variability lives in `config/domain-params.md` and `CATEGORIZATION.md`. The rest of the machinery is domain-agnostic.

See `pfy-mentat` for a fully populated, heavily tooled instance of this exact structure applied to local LLM/agent tooling (including harness, eval pipelines, skills, and agent-cage usage). `sysadmin-tools` is a lighter variant focused on infra stack fit.

## Output Artifacts

- `data/tools.json`: Canonical structured catalog (version this).
- `TOOLS.md`: Human-readable, regenerable catalog (can emit awesome-compatible formatting).
- Reports in `pipelines/` or `docs/evaluation/` if you extend from pfy-mentat patterns.

## Why This Exists

You want to spin up a new high-signal catalog for *any* domain (biohacking, real-estate analysis, 3D fabrication, music tooling, etc.) without rebuilding the ingestion/evaluation/merge/publish loop each time. Define the stack and goals once; the LLM does the fit judgment consistently.

## License / Contribution

MIT or your choice. See CONTRIBUTING.md. The goal is a clean, auditable template that stays close to the proven pfy-mentat/sysadmin-tools implementation.
