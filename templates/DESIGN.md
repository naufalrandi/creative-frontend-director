# <Product Name> Design System

> Category: <product category>
> <One sentence: the visual idea and why it fits this product.>

## 1. Visual Theme

<One paragraph: personality, conceptual story, what a first screen feels like. Name the density and the hierarchy strategy.>

Key characteristics:
- <characteristic>
- <characteristic>
- <characteristic>

## 2. Color

| Token | Value | Role |
|---|---|---|
| --bg | | page background |
| --surface | | raised or grouped surface |
| --fg | | primary text |
| --muted | | secondary text |
| --border | | hairlines and separators |
| --accent | | primary action, selection, focus |
| --ok / --warn / --danger | | state only |

Rules: accent appears on primary actions, selection, and focus only. Semantic colors on state only. Dark mode: <yes with tokens / no, reason>.

## 3. Typography

Faces: display <stack>, body <stack>, mono <stack>.

| Role | Size | Weight | Line height | Notes |
|---|---|---|---|---|
| display | | | | |
| page title | | | | |
| section title | | | | |
| object title | | | | |
| body | | | | |
| label | | | | |
| metadata | | | | |
| numeric | | | | tabular-nums |

## 4. Spacing And Grid

Scale: <values>. Within group: <band>. Between groups: <band>. Between sections: <band>. Content max width: <value>. Grid: <columns and gutters per breakpoint>.

## 5. Layout And Composition

<Hierarchy strategy, entry point rules, asymmetry rules, full-width rules.>

## 6. Components

Navigation model: <model and why>.
Surfaces: <when a surface is allowed>.
Shape language: radius <value>, border <weight>, elevation <policy>.
Controls: <button hierarchy, input treatment, destructive action treatment>.

## 7. Motion And Interaction

<Quiet / expressive / immersive, with reason. Shared durations/easings/springs; one focal motion idea; what never animates. Selected engines and property ownership, not a mandatory full stack.>

For expressive/immersive work, use `reference/expressive-experiences.md`:

| Region / purpose | Trigger and target/property | Engine owner / timing | Mobile / reduced-motion / static fallback | Verification |
|---|---|---|---|---|
| | | | | |

<Section composition sequence and responsive reading order; touch/keyboard equivalents; pause behavior; canvas loading/error/context-loss fallback; cleanup ownership and measured performance budget. Omit canvas fields when no 3D is needed.>

## 8. Voice And Brand

<Tone of copy, capitalization, terminology, how the brand appears.>

For public-facing content pages only, link to the brief's claim/proof map or include it here before layout is implemented:

| Audience question / section | Claim | Proof and source / missing | Action |
|---|---|---|---|
| | | | |

<Asset sourcing and factual/illustrative treatment, when relevant; provenance and required credits in `.design/brand-spec.md`.>

## 9. Anti-patterns

Specific to this product:
- <do not ...>
- <do not ...>

## 10. Product Signature

<The one recognizable design behavior, where it appears, and how it improves comprehension.>

<Nearest real competitor and source, or comparison unavailable. Why could it not reuse this surface unchanged beyond logo/colors? Name a content, workflow, or behavior difference; do not force novelty.>

## Evidence

| Decision | Status | Source or rationale |
|---|---|---|
| <decision> | observed / provided / inferred / chosen | <file/URL/screenshot or user statement; inference reason or choice rationale> |

Chosen means deliberate design intent, not an observed brand fact. Identify inferred premises separately and include them in the defaults report.
