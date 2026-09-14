# Workflows: Stage Matrix

Every workflow runs a subset of the eleven stages in `SKILL.md`. Run the marked stages in order. A skipped stage is skipped, not summarized.

| Stage | greenfield | create-page | component | redesign-page | redesign-project | improve-existing | visual-review | design-system-extract |
|---|---|---|---|---|---|---|---|---|
| 1 Discover | yes | yes | yes | yes | yes | yes | yes | yes |
| 2 Clarify | if material | if material | rarely | if material | if material | no | no | if material |
| 3 Resolve brand | yes | reuse | reuse | reuse | yes | reuse | no | yes |
| 4 Direction | yes | reuse | reuse | partial | yes | no | no | yes |
| 5 Specialists | yes | yes | yes | yes | yes | yes | no | no |
| 6 Assets | yes | yes | if needed | yes | yes | if needed | no | no |
| 7 Implement | yes | yes | yes | yes | yes | yes | no | tokens only |
| 8 Render | yes | yes | yes | yes | yes | yes | yes | no |
| 9 Taste gate | yes | yes | yes | yes | yes | yes | yes, report only | no |
| 10 Secondary gates | yes | yes | a11y only | yes | yes | a11y, perf | no | no |
| 11 Ship | yes | yes | yes | yes | yes | yes | findings | yes |

Stage 7 ends with the P0 items of `gates/craft-checklist.md` and `scripts/check-tokens.sh` in every workflow that implements. Stage 9 uses the judge in `gates/judge-prompt.md` whenever the host can dispatch one.

"reuse" means read the existing `DESIGN.md` and `.design/` files and do not regenerate them. "partial" means directions are explored for the page structure only, within the existing identity.

## Greenfield

Build order after Stage 4: minimal tokens and shell, then one representative complex screen, taste gate, then one simple form screen, coherence check, then extract shared primitives from what proved itself, then expand to remaining surfaces. Secondary gates run on the representative screens first.

## Create Page

Understand the page's role in the product and inspect adjacent pages before composing. Map goal, information, actions, and states. Preserve the signature while allowing page-specific composition.

## Component

Understand every context the component appears in. Define its states: default, hover, focus, active, disabled, loading, error, empty. Build it from `DESIGN.md` tokens. Render it in at least one real page context, not only in isolation.

## Redesign Page

Inspect before changing. Separate what works from design debt. Diagnose information architecture, hierarchy, density, navigation, interaction, and identity. Explore alternatives to the page structure within the existing identity. Compare old and new screenshots for comprehension, usability, identity, and craft.

## Redesign Project

Never redesign page by page. Inventory routes, modules, layouts, components, and assets. Audit current identity and preserve product equity worth keeping. Explore global directions. Redesign the shell and navigation first, then one dense screen, taste gate, then one simple screen, then lock `DESIGN.md`, extract shared primitives, and propagate by workflow rather than mechanically. Finish with a cross-page consistency and responsive review.

## Improve Existing

Do not turn a local request into an unsolicited redesign. Identify the highest-impact problems, decide rethink or refine per the rubric, preserve intentional identity, and stop when the real interface is clearly better.

## Visual Review

Render at the three viewports. Score with the rubric. Identify the three highest-impact weaknesses, structural before cosmetic. Report findings with screenshots. Do not change code unless asked.

## Design System Extract

Read tokens, styles, components, and rendered pages of the existing product. Write `DESIGN.md` describing what exists, marking each rule observed or inferred, plus a token file in the project's stack. Note inconsistencies as candidates for a later redesign-project run.
