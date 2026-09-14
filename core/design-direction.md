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

## Worked Example

Product: infrastructure monitoring. Users: experienced operators. Character: calm, precise, technical. Density: high. Hierarchy: alignment, type weight, and status semantics carry it, not boxes. Surfaces: restrained, separators over cards. Motion: functional only. Signature: a continuous signal and event timeline that connects every change over time. Anti-patterns: marketing cards, neon cyber styling, glass panels, KPI card rows.

## Commit To The Identity

Half-committed identity reads as a template. `DESIGN.md` must state the six commitments in `reference/identity-kits.md`: wordmark treatment, type pairing, palette temperature, accent budget, shape language, motion attitude. Each with a concrete value. Inter plus slate is allowed only with a written reason.

## Rules

- Token values are concrete: hex or oklch, px or rem, real font stacks. No placeholders left in `DESIGN.md`.
- Anti-patterns are specific to this product, not the generic list.
- List every inferred decision in the defaults report at ship time.
