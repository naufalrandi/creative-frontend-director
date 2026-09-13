# Anti-Slop Recipe

AI slop is not a visual style. It is evidence that structure was assembled from defaults instead of designed from the product. The fix is always structural, so this file states what to build instead of each reflex.

## Reflex To Recipe

| Default reflex | Build this instead |
|---|---|
| sidebar plus card grid dashboard | Start from the questions the user asks on arrival. Answer each with the tightest form: a status strip, a ranked list, a table with change indicators. Choose navigation from module count and switching frequency. |
| a row of four KPI cards | One primary number with its trend and context, secondary figures inline in a single line or a compact table with tabular numerals. |
| bento grid for unrelated content | Group by relationship and reading order. Equal-weight tiles only when the items are genuinely peers. |
| purple, cyan, or neon AI palette | Derive color from brand, domain, and semantics. One neutral foundation, one accent reserved for primary action and selection, semantic colors only for state. |
| glow, gradient, or glass as identity | Identity comes from composition, typography, and the product signature. Surfaces are flat and quiet unless the brand demands otherwise. |
| rounded card inside rounded card | Use typography, spacing, alignment, indentation, and separators for hierarchy. A surface exists only for independent interaction, distinct state, a draggable object, or meaningful elevation. |
| badge and pill overload | Plain text for metadata. A pill only for a state the user must scan for. |
| charts to look sophisticated | A chart only when a decision depends on shape over time or comparison. Otherwise a number with a delta. |
| decorative icon in a circle beside every heading | Headings carry themselves. Icons only where they aid recognition in a scan. |
| huge hero typography as composition | Composition comes from hierarchy and rhythm. Display size follows the message and the viewport. |
| three-column feature grid | Tell the workflow in order. Each section frames one real product moment with real product UI or a real outcome. |
| floating device mockups | Show the actual interface at a legible scale, cropped with intent. |
| mechanically identical spacing | Small gaps within a group, larger gaps between concepts, largest gaps between sections. Rhythm communicates structure. |
| motion to feel premium | Motion only for state, continuity, spatial relationship, or feedback. |
| Inter or Roboto as the display face by default | Choose faces from product character and read `reference/design-reference.md` typography before deciding. Same family for display and body only when the direction is deliberately utilitarian. |

None of the reflexes are forbidden. Each needs a written product-specific reason in `DESIGN.md`.

## Correction Order

When a surface feels generic, fix in this order and stop when the problem disappears:

1. product understanding
2. information architecture
3. hierarchy
4. navigation
5. grouping
6. typography
7. density and rhythm
8. interaction
9. visual treatment
10. decoration

Never attempt to fix weak structure by adding effects.

## Two Tests

Removal test: if an element can be removed without reducing hierarchy, meaning, state, or interaction, remove it.

Brand-removal test: strip the logo, brand colors, and copy. If the structure could belong to dozens of unrelated products, the underlying design is generic. Rethink.
