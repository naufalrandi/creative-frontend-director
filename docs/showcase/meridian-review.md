# Review: Meridian cash overview

Screens judged: `.design/screens/overview-1440.png`, `overview-1440-full.png`, `overview-1440-scenario.png`, `overview-768.png`, `overview-390.png`, `overview-empty-1440.png`, `overview-loading-1440.png`.

Scored by: self (no judge can be dispatched in this context). Marked "self" per `gates/judge-prompt.md`.

## Craft checklist P0

| Item | Result | Evidence |
|---|---|---|
| Interactive elements have hover, focus-visible, active, disabled | pass | `.btn`, `.switch`, `.check`, nav links, exception links: all four states in CSS; disabled Approve/Hold visible in overview-1440-full.png |
| Every list and table has an empty state with a sentence and action | pass | overview-empty-1440.png: accounts, exceptions, forecast, receivables, payables each carry a sentence and a connect action |
| Async surfaces have a loading state matching final layout | pass | overview-loading-1440.png: skeleton rows match the 32 px row rhythm, 240 px chart block, 5 week-grid rows |
| Form fields have visible label, hint, error | pass with note | the only inputs are switches and checkboxes; each has a text label (switch) or sr-only label (row checkbox). No free-text field on this page, so no hint/error slot needed |
| Destructive actions distinct and confirmed | pass | Hold is `--danger` text with hairline; first click arms "Confirm hold $48,200.00", Escape or blur disarms; verified by the headless drive probe |
| Real copy and realistic data | pass | deterministic seed: 6 accounts, 13 weeks, 6 invoices, 7 payments, 3 scenarios, 3 exceptions; no lorem, no invented statistics |
| Six identity commitments present and consistent | pass | wordmark rule, system sans + SF Mono numerals, cool slate, cobalt accent 6 uses per viewport, 3 px crisp, functional motion |
| No horizontal scroll at 390, 768, 1440 | pass | probes: scrollWidth 390/768/1440 equal clientWidth in ready, empty, loading states; wide tables scroll inside `.table-scroll` |
| Long text does not break layout | pass | 62-char customer name clipped with title (overview-1440-full.png row 4); 230-char exception wraps in the rail at all widths |
| Zero, one, many handled | pass | empty state renders for zero; pluralisation handles one ("1 invoice overdue"); many is the shipped data. Forty-row density not applicable to an overview page, noted in ship report |
| prefers-reduced-motion respected; no infinite animation outside loading | pass | global 1 ms override; skeleton shimmer disabled under reduced motion |
| Token conformance | pass | `check-tokens.sh`: PASS (raw colors none, spacing none, inline styles none, arbitrary values none) |

## Rubric (self)

Product fit: 5. The transposed thirteen-week table with Inflows / Outflows / Closing / P10 low under the band, the $2,000,000 minimum line, aging buckets, and an approval run with a Hold control only make sense for a cash-forecasting controller (overview-1440-full.png).
Hierarchy: 4. At 1440 the eye lands on $4,337,175.65, then drops to the band and its three red columns, then the red rows; the long Unusual exception text competes slightly with the accounts table for second position (overview-1440.png).
Typography: 4. Roles are consistent across every table and rail, mono numerals align everywhere; the mono figures set inside the trough sentence read slightly wide next to the sans prose (overview-1440-scenario.png).
Rhythm: 4. No cards; sections are separated by a single strong rule and 40 px; the position rail leaves empty space under the facts at 1440 while the exceptions column runs long (overview-1440.png).
Identity: 4. The shared week axis is a real signature: scenario on moves the trough marker, the dotted baseline, and the tinted breach columns in chart and grid together (overview-1440-scenario.png); the alignment between chart points and right-aligned cells is by column, not by glyph, so the link reads at a glance rather than exactly.
Finish: 4. Most-used component, the payables row, has select, hover, selected tint, disabled checkbox for approved rows, approve with amount, undo, hold with confirm; weaker spots are the phone nav scrolling with no edge affordance and the truncated customer name relying on a title attribute (overview-390.png, overview-1440-full.png).

Total: 25 of 30, no dimension under 4. Verdict: PASS.

Structural weakness: the position rail at 1440 carries less content than its column width; a 7-day balance movement line was rejected under "charts only where a decision depends on shape", so the space stays quiet.
Craft weakness: the phone nav has no visual cue that it scrolls.
Most finished: payables row and action bar. Least finished: primary nav at 390.

## Secondary gates (private route)

- noindex: `<meta name="robots" content="noindex, nofollow">` present.
- Contrast (computed from tokens, OKLCH to linear sRGB): fg 17.1:1, muted 6.7:1, accent 7.6:1, ok 5.7:1, warn 5.4:1, danger 6.3:1 on --bg; control borders 3.7:1; white on accent 8.1:1. All AA. `--warn` was darkened from 58% to 52% L and `--control-border` added after the first computation failed.
- Keyboard: 24 focusable controls in the ready state, all native elements with visible focus rings; Escape disarms Hold; no traps.
- Semantics: header, nav[aria-label], main, sections with aria-labelledby, real tables with th scope and sr-only captions, role="switch" on scenarios, aria-live on both notices, SVG with title and desc.
- Targets: buttons 28 px tall and 24 px on the small variant; checkboxes 14 px inside 32 px rows. Small checkboxes are a desktop trade-off noted for the phone follow-up.
- Performance: one file, no fonts fetched, no images, no external requests; JS renders synchronously from a 5 KB data set. Lighthouse and axe not run (no server, no npx allowed in this context); listed as a gap.
