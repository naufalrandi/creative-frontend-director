# Stage 4b: Lock The Direction Into DESIGN.md

Once a direction is chosen, write `DESIGN.md` at the project root from `templates/DESIGN.md`. Every later stage, every specialist skill, and every future session reads this file. If `DESIGN.md` already existed, update only the sections the task changes and note the change at the top.

## What The Direction Defines

| Decision | Goes in section |
|---|---|
| visual personality and conceptual story | 1. Visual Theme |
| color strategy and token values | 2. Color |
| type roles, scale, and faces | 3. Typography |
| spacing scale and rhythm rules | 4. Spacing and Grid |
| layout philosophy, hierarchy strategy, density | 5. Layout and Composition |
| navigation model, surfaces, shape language | 6. Components |
| motion strategy | 7. Motion and Interaction |
| tone of copy, brand voice | 8. Voice and Brand |
| explicit anti-patterns for this product | 9. Anti-patterns |
| the product signature | 10. Product Signature |

For public-facing content pages, resolve the brief's claim/proof map before composing sections. Let the argument and available proof determine the layout; preserve the map in section 8 or link to the brief. Missing proof stays explicit, never becomes invented content.

Record material decisions with source evidence: observed from a file/URL/screenshot, provided by the user, inferred with a reason, or chosen deliberately with a rationale. A chosen design value is not an observed brand fact; note any inferred premise behind it for the defaults report. Keep existing authoritative rules intact.

## Worked Example

Product: infrastructure monitoring. Users: experienced operators. Character: calm, precise, technical. Density: high. Hierarchy: alignment, type weight, and status semantics carry it, not boxes. Surfaces: restrained, separators over cards. Motion: functional only. Signature: a continuous signal and event timeline that connects every change over time. Anti-patterns: marketing cards, neon cyber styling, glass panels, KPI card rows.

## Commit To The Identity

Half-committed identity reads as a template. `DESIGN.md` must state the six commitments in `reference/identity-kits.md`: wordmark treatment, type pairing, palette temperature, accent budget, shape language, motion attitude. Each with a concrete value. Inter plus slate is allowed only with a written reason.

## Expressive Experiences

When the brief asks for animation, immersive layout, GSAP, Three.js, or Motion, read `reference/expressive-experiences.md` now. Lock the static composition/section sequence, then section 7's choreography, engine ownership, touch/keyboard alternatives, reduced-motion and canvas fallbacks, cleanup and performance budget. Explicit animation requests should produce purposeful visible interaction; do not silently downgrade them to quiet mode or install all engines without need.

## Rules

- Token values are concrete: hex or oklch, px or rem, real font stacks. No placeholders left in `DESIGN.md`.
- Anti-patterns are specific to this product, not the generic list.
- List every inferred decision in the defaults report at ship time.
