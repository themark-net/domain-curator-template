# ADR 0001: Template Initial Structure and Separation of Concerns

## Status
Accepted

## Context
We need a clone-and-customize template that captures the successful X-seed + LLM-fit-evaluation pattern from pfy-mentat and sysadmin-tools without carrying domain-specific data or heavy implementation details.

## Decision
- Isolate all domain variability to `config/domain-params.md` + rubric inside it.
- Keep evaluation prompt and rules in `CATEGORIZATION.md` (stable).
- Use `data/tools.json` as single source of truth with JSON Schema.
- Provide clear stubs + references to pfy-mentat for the implementation of process/regenerate steps.
- Include minimal docs/ADR for future structural changes.

## Consequences
New domains can be onboarded in minutes by editing only the params file and seeding posts. Core machinery improvements benefit all derived catalogs.
