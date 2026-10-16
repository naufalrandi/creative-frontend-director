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
| Finish | missing states, placeholder copy, inconsistent controls | states exist, details uneven | the most-used component would pass a senior designer's review: states, edge cases, alignment, motion |

## Who Scores

Run `gates/craft-checklist.md` P0 first; an open P0 caps Finish at 2. Then dispatch the judge in `gates/judge-prompt.md` if the host can. The judge's score is the gate. Without a judge, self-score and mark it "self" in the review.

## Thresholds

- Product fit, hierarchy, typography, rhythm, or identity under 3: RETHINK. Return to `core/anti-slop.md` correction order and change structure. Polishing is forbidden at this point.
- Finish under 3 with the other five at 3 or above: REFINE, starting with the finished-component test.
- Otherwise, any dimension at 3: REFINE, even if total is 24 or above. Fix craft: spacing, alignment, type scale, borders, icon sizing, responsive details, states, transitions.
- Every dimension at least 4 (total at least 24 of 30), with no open P0: PASS.

For implementing workflows, maximum three correction rounds across RETHINK and REFINE. If still failing after the third, report "in progress" with the score, remaining weaknesses, and next fixes. The limit never converts failure to PASS. Visual-review reports the verdict as a recommendation without executing correction rounds; low scores do not block an evidenced review. Without inspected screenshots at all required widths, record "not scored: render blocked", not a code-based taste score.

## Rethink Moves

Remove sections, reorganize content, replace cards with tables or lists, change navigation, change composition, change the type scale, change the data representation, redesign the interaction.

## Rationalizations

| Excuse | Reality |
|---|---|
| "It compiles and matches the spec" | The spec asked for a designed product. Compiling is not the gate. |
| "It looks clean and modern" | Clean and modern is what every default produces. Score product fit honestly. |
| "The user did not ask for creativity" | The user asked for this product's interface. Generic is a defect. |
| "I will polish it to a 3" | A structural dimension at 2 needs structural change. Finish at 2 needs missing craft/states fixed, not cosmetic cover. |
| "The component library only offers cards" | Compose or extend the primitive. The library is infrastructure. |
| "I cannot render, so I will score from the code" | No screenshot, no score. Fix the render path first. |
| "Three rounds is too many for a small page" | Small pages are where generic shows fastest. Score it. |
| "States can come later" | A component without states is half a component. Finish caps at 2. |
| "My own score is fine" | Self-scores drift upward. Dispatch the judge when the host allows it. |

## Red Flags

Stop and rethink when you notice any of these in the screenshot or in your own reasoning:

- a sidebar and a card grid appeared without a written reason
- four equal tiles at the top of a page
- a purple or cyan accent nobody asked for
- the brand-removal test fails
- you are adjusting shadows or radii while a structural dimension is under 3
- you are about to write "modern and clean" in the ship report
