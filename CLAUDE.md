# agent-skills

Production-grade engineering skills for AI coding agents. This is a trimmed fork of [addyosmani/agent-skills](https://github.com/addyosmani/agent-skills) — ship/CI/CD/browser-testing skills removed to reduce token overhead.

## Skills

**Define:** spec-driven-development
**Plan:** planning-and-task-breakdown
**Build:** incremental-implementation, test-driven-development, frontend-ui-engineering, api-and-interface-design
**Verify:** debugging-and-error-recovery
**Review:** code-review-and-quality, code-simplification, security-and-hardening
**Document:** git-workflow-and-versioning, documentation-and-adrs, idea-refine

## Commands

`.claude/commands/`: `/spec` `/plan` `/build` `/test` `/review` `/code-simplify`

## Conventions

- Every skill lives in `skills/<name>/SKILL.md`
- YAML frontmatter with `name` and `description` fields
- Every skill has: Overview, When to Use, Process, Common Rationalizations, Red Flags, Verification

## Boundaries

- Always: Follow the skill-anatomy.md format for new skills
- Never: Add skills that are vague advice instead of actionable processes
- Never: Duplicate content between skills — reference other skills instead
