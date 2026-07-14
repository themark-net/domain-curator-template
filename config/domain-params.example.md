# Domain Parameters for THIS catalog (copy to domain-params.md and edit)

## Domain
name: [Replace with your domain name, e.g. Biohacking & Longevity Tooling]
focus: [One sentence on the purpose of this catalog]

## Stack Definition
core_technologies:
  - [List primary technologies or platforms this catalog serves]
constraints:
  - [e.g. Must support fully local / air-gapped operation where possible]
  - [e.g. Prefer FOSS with transparent update mechanisms]
priorities:
  data_sovereignty: 9
  integration_ease: 7
  maintenance_burden: 8
  maturity_vs_innovation: 6
  # Add/remove keys; values are 1-10 importance for weighting in rubric

## Goals
- [Specific goal 1 this catalog should advance, e.g. "Enable practical experimentation tracking and protocol iteration with minimal external dependencies"]
- [Specific goal 2]
- [Specific goal 3]

## Evaluation Rubric
criteria:
  - name: "Stack Compatibility"
    weight: 0.25
    guidance: "How cleanly does this integrate with or complement the core_technologies and respect all constraints? Consider install, config, data formats, and avoidance of prohibited patterns. Score 0-10 with evidence."
  - name: "Goal Alignment"
    weight: 0.30
    guidance: "Direct contribution to the listed Goals. Does it move the needle on the outcomes we care about? Score 0-10."
  - name: "Practical Usefulness & Maturity"
    weight: 0.20
    guidance: "Real deployment/usage signal in source discussion vs pure claims. Maintenance burden and reliability indicators."
  - name: "Maintenance & Ops Burden"
    weight: 0.15
    guidance: "Ongoing cost (updates, deps, expertise required, failure modes). Lower burden = higher score."
  - name: "Signal Quality from Sources"
    weight: 0.10
    guidance: "Strength of concrete usage discussion, gotchas, and integration reports in the X posts vs marketing or speculation."

scoring_method: "Weighted average of criterion scores (use exact weights). Provide per-criterion scores + notes. Overall fit is the weighted result. Confidence reflects context sufficiency."
