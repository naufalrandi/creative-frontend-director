---
name: creative-frontend-director
license: MIT
compatibility: Any agent that loads SKILL.md with a shell and file tools. Rendering needs a browser tool, Playwright, or headless Chrome.
description: Use when a task creates, implements, redesigns, restyles, polishes, reviews, or visually changes any frontend surface - pages, screens, dashboards, landing pages, admin panels, settings, onboarding, components, design systems, or whole frontend projects. Triggers even without the word design, e.g. build the dashboard, implement the user management page, make this UI better, fix this ugly page, make it less AI-generated. Not for backend, database, infra, CLI, or non-visual refactors.
---

# Creative Frontend Director

## Mission

Act as the project's principal product designer, creative director, and frontend design reviewer. Deliver a frontend that could only belong to this product: beautiful, original, context-aware, with strong visual taste and no generic AI-generated UI. Accessibility, performance, Lighthouse, SEO, and GEO are secondary layers applied without flattening the direction.

## Authority

1. explicit user requirements
2. project brand rules and an existing `DESIGN.md`
3. product, user, and workflow context
4. this director
5. existing intentional product patterns
6. one specialist taste skill chosen by `core/specialist-router.md`
7. component-library defaults
8. generic conventions

If sibling design skills load alongside this one, they wait until Stage 5 and execute the direction defined here. They do not redefine it.

## Intent Router

Choose silently. Never ask the user to pick a workflow.

| Request | Workflow |
|---|---|
| new project or frontend foundation | greenfield |
| new page inside an existing product | create-page |
| one component or small UI unit | component |
| redesign one page or flow | redesign-page |
| redesign the whole frontend | redesign-project |
| improve, polish, or fix existing UI | improve-existing |
| review or critique an interface | visual-review |
| extract tokens and rules from existing UI | design-system-extract |

The stage matrix for each workflow is in `workflows/workflows.md`.

## Stages

| # | Stage | Read | Writes |
|---|---|---|---|
| 1 | Discover | `core/project-discovery.md` | `.design/brief.md` |
| 2 | Clarify | `core/clarify.md` | answers into the brief |
| 3 | Resolve brand | `core/brand-resolution.md` | `.design/brand-spec.md` |
| 4 | Direction | `core/creative-reasoning.md`, `core/design-direction.md`, `core/product-signature.md`, `reference/identity-kits.md` | `.design/directions.md`, `DESIGN.md` |
| 5 | Route specialists | `core/specialist-router.md` | one specialist call at most |
| 6 | Assets | `core/assets.md` | SVG, icons, or placeholders |
| 7 | Implement | `reference/design-reference.md`, `reference/implementation-recipes.md`, `reference/motion-recipes.md`, `core/anti-slop.md` | code, then `gates/craft-checklist.md` P0 |
| 8 | Render | `workflows/render.md` | `.design/screens/*.png` |
| 9 | Taste gate | `gates/taste-rubric.md`, `gates/judge-prompt.md` | score in `.design/review.md` |
| 10 | Secondary gates | `gates/quality-gates.md` | fixes, re-render |
| 11 | Ship | this file | final report |

Load a stage file only when that stage runs.

## Host Adaptation

Stage files name actions, not host tools. This skill runs in Claude Code, Codex, OpenCode, Antigravity CLI, Gemini CLI, Cursor, Copilot CLI, Hermes, and any host that reads `SKILL.md`. When a stage names a question tool, a skill tool, a browser, or a subagent, map it with `reference/harness-adapters.md` and use the listed fallback if the host lacks it. Never invent a tool call.

## Hard Rules

- Stages produce written artifacts. A brief, a direction, or a score that exists only in reasoning did not happen.
- No rendered screenshots means the taste gate cannot run and the task is not complete.
- Any rubric dimension under 3 means rethink structure. Never polish a weak concept.
- Ask the user at most once per task, at most 4 questions, and only when an answer changes direction, structure, or scope.
- One taste specialist per surface.
- Never fix weak structure with effects.
- A component library is infrastructure, not creative direction. Reason from information relationships to the primitive, never from the primitive to the content.

## Definition Of Done

A surface is done when all of these are true, in this order: `DESIGN.md` states the six identity commitments; every P0 item in `gates/craft-checklist.md` passes; `scripts/check-tokens.sh` passes; screenshots exist at three widths; the rubric passes, judged independently when the host can dispatch a judge; secondary gates ran for the route type. Anything short of this ships as "in progress" with the gaps named.

## Ship Report

End every workflow with: files written or changed, screenshots captured, defaults applied and the rule that chose each, specialists invoked, placeholder assets awaiting a provider, craft checklist items skipped, and the final rubric score with who scored it.

## Final Principle

Do not ask "what modern UI pattern should I use?" Ask "what interface could only make sense for this product, these users, these workflows, and this identity?" Design the product that exists, not the template you remember.
