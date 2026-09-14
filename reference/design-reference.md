# Design Reference

Load for Stage 7. Each topic states the recipe and one concrete example. Values are starting points to adapt to `DESIGN.md`, not defaults to paste.

## Content Before Layout

Write the real copy and seed data first: product name, navigation labels, realistic records, plausible dates and names. Layout decisions made on lorem ipsum are wrong on real content. Details and seed-data rules are in `reference/implementation-recipes.md`.

## Composition

Build pages from relationships, not component inventories. A strong page has one visual entry point, one scanning path, and one action hierarchy.

- Asymmetry when importance is asymmetric. A primary object gets more width, more contrast, or the first position.
- Alignment creates order. Fewer alignment lines than columns.
- Whitespace separates concepts. It is not a luxury signal.
- Full width when data benefits from it. Do not center application interfaces by habit.

Example: an order detail page places the order timeline as a two-thirds column with the customer and fulfilment facts as a narrow rail, because the timeline is what operators read first and act on.

## Typography

Typography is architecture. Define roles, then a scale, then faces.

Roles: display, page title, section title, object title, body, label, metadata, numeric, code.

Example scale for a dense operational product, in rem with line heights:

| Role | Size | Weight | Line height | Notes |
|---|---|---|---|---|
| display | 2.0 | 600 | 1.1 | rare, one per page at most |
| page title | 1.375 | 600 | 1.2 | tracking -0.01em |
| section title | 1.0 | 600 | 1.3 | |
| object title | 0.9375 | 500 | 1.35 | |
| body | 0.875 | 400 | 1.5 | |
| label | 0.8125 | 500 | 1.3 | sentence case, no tracking |
| metadata | 0.75 | 400 | 1.3 | muted color |
| numeric | inherit | 500 | inherit | `font-variant-numeric: tabular-nums` |

Operational products favor scanability and compact rhythm. Editorial experiences use larger measure and stronger reading rhythm. Creative products may let type carry identity. Avoid oversized headings as a substitute for composition, low-contrast body text, random uppercase labels, and monospace merely because a product is technical.

## Color

Derive from brand, product character, environment, and semantics. Use color for brand, action, state, severity, selection, and emphasis. Nothing else.

Example token structure:

```css
:root {
  --bg: oklch(99% 0.003 250);
  --surface: oklch(97% 0.004 250);
  --fg: oklch(20% 0.02 250);
  --muted: oklch(50% 0.015 250);
  --border: oklch(90% 0.006 250);
  --accent: oklch(55% 0.16 250);       /* primary action and selection only */
  --ok: oklch(60% 0.15 150);
  --warn: oklch(75% 0.15 80);
  --danger: oklch(55% 0.2 25);
}
```

The accent appears on primary actions, selection, and focus. Semantic colors appear only on state. Dark mode is a context decision for the product's environment, not a premium shortcut.

## Spacing And Rhythm

Do not make every gap identical. Proximity shows relationships, larger transitions separate concepts.

Example scale: 4, 8, 12, 16, 24, 32, 48, 64 px. Within a group use 4 to 12. Between groups 16 to 24. Between sections 32 to 64. Dense expert tools sit at the low end of each band, marketing pages at the high end. Spaciousness is not quality.

## Surfaces

A surface exists for independent interaction, distinct state, a selectable or draggable object, contextual grouping, or meaningful elevation. Otherwise prefer typography, spacing, alignment, indentation, and separators. Never nest cards without a hierarchy reason.

Example: a settings page uses section headings with a hairline separator and grouped rows, not one card per setting.

## Navigation

Choose from module count, hierarchy depth, switching frequency, screen density, and object context. Do not default to a sidebar.

| Situation | Model |
|---|---|
| 3 to 5 modules, frequent switching | top navigation with contextual sub-navigation |
| 6+ modules, deep hierarchy | collapsible sidebar with sections |
| object-centric work | list plus inspector or split view |
| expert repeated workflows | command palette plus persistent context |
| linear process | stepper with visible progress |

Navigation preserves context during repeated expert workflows.

## Data UI

Design data around decisions.

| User intent | Presentation |
|---|---|
| scan for problems | status strip, ranked list, table with change indicators |
| compare | aligned columns, shared scales |
| investigate | drill-down, inspector, coordinated views |
| detect anomaly | thresholds, deltas, sparklines |
| track over time | timeline, trend with event overlays |

Never add charts to look sophisticated. Place actions next to the evidence that motivates them. Use tabular numerals everywhere numbers align.

## Forms And Admin UI

Optimize comprehension, grouping, safe defaults, validation, and consequence clarity. Sections and progressive disclosure for complexity. Destructive actions visually and spatially distinct. Expert admin surfaces can be dense but must stay scannable.

Example: a user edit form groups identity, access, and danger zone as three sections, the danger zone separated by space and a muted red outline, never a red filled card.

## Landing Pages

Start from product truth: audience, pain, promise, differentiation, proof, objections, activation path. Do not use the canonical SaaS sequence by default.

A hero clarifies what the product is, who it is for, and why it matters, in the brand voice. Prefer workflow-driven storytelling and real product UI over decorative mockups. One decisive flourish per page.

## Application UI

Dashboards answer recurring questions: what requires attention, what changed, what should I do next, what is unhealthy, what is performing well. Build each answer in the tightest form. Detail pages reflect object identity, state, actions, evidence, history, relationships, and configuration in the order the workflow needs.

## Responsive

Responsive design is recomposition, not shrinking. At each breakpoint reconsider hierarchy, navigation, ordering, density, visibility, grouping, and target size. Preserve product logic while changing composition. Verify no horizontal scroll at 390, 768, and 1440.

## Motion

Motion communicates state, continuity, hierarchy, spatial relationship, and feedback. Restrained by default, expressive only when `DESIGN.md` allows it. Always respect `prefers-reduced-motion`. Animate transform and opacity, never layout properties.
