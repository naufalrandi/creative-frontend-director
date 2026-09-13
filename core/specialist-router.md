# Stage 5: Route Specialists

The director owns direction. Specialist skills execute it. Consult this registry only after `DESIGN.md` exists.

## Registry

| Need | Skill to invoke | Condition |
|---|---|---|
| minimal, quiet, or editorial direction | `minimalist-ui` | direction says restraint carries identity |
| raw, industrial, or brutalist direction | `industrial-brutalist-ui` | direction chose it deliberately with a product reason |
| translucent or layered material | `liquid-glass-design` | brand or platform demands it, never as a default |
| high-end marketing polish | `high-end-visual-design` | public marketing surface with photography or motion budget |
| expressive motion | `motion-ui`, `motion-patterns` | `DESIGN.md` section 7 allows expressive motion |
| charts and data visualization | `dataviz` | any chart, sparkline, or stat tile |
| framework implementation patterns | `frontend-patterns`, `react-patterns`, `vue-patterns`, `nextjs-turbopack` | always for implementation |
| accessibility audit | `frontend-a11y`, `accessibility` | Stage 10 |
| rendered QA and click paths | `browser-qa`, `click-path-audit` | Stage 8 and 10 |
| SEO | `seo` | public routes in Stage 10 |
| image or reference generation | `fal-ai-media`, `imagegen-frontend-web`, `brandkit` | only when a provider is configured, see `core/assets.md` |

## Rules

1. At most one taste specialist per surface. The first six rows are taste specialists.
2. Verify the skill exists in the host's skill list before invoking: the Skill tool listing in Claude Code, the `$` picker in Codex, the `skill` tool in OpenCode, `/skills` in Antigravity and Copilot, `activate_skill` in Gemini, `skills_list` in Hermes. A missing skill is skipped and noted in the ship report, never improvised. Invocation per host is in `reference/harness-adapters.md`.
3. Pass the specialist the `DESIGN.md` path and the brief path. It executes within them.
4. If a specialist's output conflicts with `DESIGN.md`, `DESIGN.md` wins. Adjust the output, not the direction.
5. If another general design skill loaded automatically alongside this director, treat it as row one to six: it may execute, it does not redirect.
6. Record every specialist invoked in the ship report.
