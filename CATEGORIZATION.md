# CATEGORIZATION.md

This file defines the rules, taxonomy guidance, and LLM evaluation prompt template used to turn raw X posts (and other signal) into scored, categorized items that fit a specific domain's stack and goals.

It is deliberately generalized. After cloning, the only files you edit for a new domain are:
- `config/domain-params.md` (your stack, goals, rubric)
- This file only if you need domain-specific category taxonomy extensions or extra prompt instructions

The prompt template below is designed to be interpolated with the contents of `domain-params.md` and invoked via Grok CLI, one-shot skills, or the harness patterns already proven in pfy-mentat.

## Domain Parameters Contract

Every evaluation run receives the full interpolated content of `config/domain-params.md`. It must contain at minimum:

```markdown
## Domain
name: 
focus: 

## Stack Definition
core_technologies: []
constraints: []
priorities:
  # key: 1-10 weight or importance

## Goals
- 

## Evaluation Rubric
criteria:
  - name: ""
    weight: 0.0
    guidance: ""
  # repeat for each criterion

scoring_method: "Weighted average..."
```

See `config/domain-params.example.md` for the exact skeleton and instructions.

## LLM Evaluation Prompt Template (use verbatim, interpolate params)

```
You are an expert technical curator specializing in the {{DOMAIN.name}} domain.

Your sole job is to evaluate ONE candidate item extracted from X posts (or other sources) for concrete fit against the defined stack and goals.

**Domain Parameters (do not ignore or override these):**
{{FULL_CONTENTS_OF_domain-params.md}}

**Candidate Item:**
Name: {{item.name}}
URL or Repo: {{item.url}}
Raw description / claims from source: {{item.description}}
Source context (key excerpts from X posts or discussion): {{item.source_quotes}}

**Mandatory Output Rules**
- Be evidence-based and skeptical. Marketing language or "revolutionary" claims without usage signal in the source posts must be discounted.
- Prioritize items that actually advance the stated Goals and respect the Constraints.
- If the item is not a concrete tool, library, framework, or actionable method, note that clearly and evaluate whether it still informs categorization or stack thinking.
- Output **strictly valid JSON only** matching this exact schema. No markdown, no extra text before or after.

{
  "name": "string (canonical name)",
  "summary": "string (1-2 sentences focused on core function and relevance to this domain)",
  "categories": ["string", "..."] (use or extend from the domain's taxonomy; justify new ones briefly in rationale),
  "fit": {
    "overall": number (0.0-10.0, weighted average per scoring_method),
    "breakdown": {
      "Criterion Name from Rubric": {
        "score": integer 0-10,
        "note": "string (evidence-based justification tied to description + source context + stack params)"
      },
      "...": {}
    },
    "rationale": "string (overall why this item advances or conflicts with the stack definition and Goals. Highlight synergies or conflicts with typical items already in this catalog.)",
    "confidence": number 0.0-1.0 (how certain you are given available context)
  },
  "integration_notes": "string (specific ways this could compose with other items or existing stack components; suggested validation steps)",
  "gaps_or_risks": "string (missing capabilities, maintenance concerns, or reasons it may not deliver on the Goals)",
  "source_signal_quality": "string (brief note on strength of concrete usage discussion vs hype in the provided X post excerpts)"
}
```

**Post-processing expectations (human or script):**
- If overall fit < threshold you define in domain-params, flag for review.
- Merge by canonical URL or normalized name. Update `last_evaluated`, `fit`, and append new source references. Never lose history.
- Categories should be stable; propose taxonomy changes only when a clear cluster of high-fit items doesn't fit existing ones.

## Category Taxonomy Guidance

Start with a small, stable set in your `domain-params.md` or a separate `categories.md`. Extend only when signal demands it. Reference the category approach used in pfy-mentat's CATEGORIZATION.md for the local LLM domain as a model of granularity that stays actionable.

Avoid over-categorization early. The fit scoring and rationale are more valuable than perfect taxonomy.

## Process Integration Notes

This prompt is intended to be called after an extraction pass on `sources/x-posts.md`. Use the same investigate / one-shot / harness patterns that already work in pfy-mentat for candidate extraction, then feed each candidate into the above prompt (interpolated).

See `pfy-mentat` for a production implementation of the full loop (including eval harness, smoke pipelines, and iterative refinement of similar prompts). The sysadmin-tools variant uses a lighter version of the same structure focused on infra deployment fit.

## Quality & Iteration

- Run periodic re-evaluation passes on the whole catalog when you change Goals or Rubric weights.
- The `confidence` field + `source_signal_quality` help surface items that need fresh X signal or human review.
- Keep this file and the prompt stable; evolve only the `domain-params.md` content for new domains or goal shifts.
