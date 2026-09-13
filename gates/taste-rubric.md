# Stage 9: Taste Gate

The most important completion gate. Judge the rendered screenshots from Stage 8, not the code. Write the score to `.design/review.md`.

## Rubric

Score each dimension 1 to 5.

| Dimension | 1 | 3 | 5 |
|---|---|---|---|
| Product fit | could be any SaaS product | fits the domain in places | only makes sense for this product and these users |
| Hierarchy | everything competes | primary element found after a moment | the eye lands in one place, then follows a clear path |
| Typography | default sizes, no roles | roles exist, scale is uneven | type carries structure and identity with consistent rhythm |
| Rhythm | uniform gaps, containers everywhere | some grouping by proximity | spacing communicates structure, surfaces only where required |
| Identity | no signature, brand-removal test fails | a signature exists but is cosmetic | one memorable, appropriate decision that improves comprehension |

## Thresholds

- Any dimension under 3: RETHINK. Return to `core/anti-slop.md` correction order and change structure. Polishing is forbidden at this point.
- All dimensions 3 or above and total under 20: REFINE. Fix craft: spacing, alignment, type scale, borders, icon sizing, responsive details, states, transitions.
- Total 20 or above with no dimension under 4: PASS.

Maximum three rethink rounds. After the third, ship with the score and the remaining weaknesses stated plainly in the ship report.

## Rethink Moves

Remove sections, reorganize content, replace cards with tables or lists, change navigation, change composition, change the type scale, change the data representation, redesign the interaction.

## Rationalizations

| Excuse | Reality |
|---|---|
| "It compiles and matches the spec" | The spec asked for a designed product. Compiling is not the gate. |
| "It looks clean and modern" | Clean and modern is what every default produces. Score product fit honestly. |
| "The user did not ask for creativity" | The user asked for this product's interface. Generic is a defect. |
| "I will polish it to a 3" | A 2 is structural. Polish cannot move it. |
| "The component library only offers cards" | Compose or extend the primitive. The library is infrastructure. |
| "I cannot render, so I will score from the code" | No screenshot, no score. Fix the render path first. |
| "Three rounds is too many for a small page" | Small pages are where generic shows fastest. Score it. |

## Red Flags

Stop and rethink when you notice any of these in the screenshot or in your own reasoning:

- a sidebar and a card grid appeared without a written reason
- four equal tiles at the top of a page
- a purple or cyan accent nobody asked for
- the brand-removal test fails
- you are adjusting shadows or radii while a dimension is under 3
- you are about to write "modern and clean" in the ship report
