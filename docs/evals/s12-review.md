# Review: DepotDesk main dashboard

Surface: `index.html` (greenfield representative screen). Screenshots in `.design/screens/`. Scored by: self (no judge can be dispatched in this run).

## Render evidence

| File | Width | What it shows |
|---|---|---|
| dashboard-1440.png | 1440 x 900 | first viewport, shared workshop PC |
| dashboard-1440-full.png | 1440 x 4400 | whole page: strip, 26-row pull order, 40-row in-service table |
| dashboard-1440-picker.png | 1440 x 1100 | inline "which bay" step open on rank 1 (`?open=4213`) |
| dashboard-1440-empty.png | 1440 x 900 | pull order empty state (`?state=empty`) |
| dashboard-1440-one.png | 1440 x 900 | single-row state (`?state=one`) |
| dashboard-1440-loading.png | 1440 x 900 | skeletons on every async surface (`?state=loading`) |
| dashboard-768.png, dashboard-768-full.png | 768 | rugged tablet portrait, recomposed to one column |
| dashboard-390.png, dashboard-390-full.png | 390 | phone; captured in a 500 px window (macOS clamps Chrome to 500) with the body constrained to 390 px via `?probe=390`, centre-cropped; the 390 no-scroll check is `document.body.scrollWidth` = 390 |

Horizontal overflow probe (documentElement.scrollWidth vs clientWidth): 1440 = 1440, 768 = 768, 390 body = 390. Three overflow bugs were found and fixed during Stage 8: sections keeping the table's intrinsic width (min-width 0 on column children), an absolutely positioned visually-hidden span escaping the table wrapper (position relative on the wrapper), and two-up bay tiles at 390 (single column under 760).

## Craft checklist P0

| Item | Result | Evidence |
|---|---|---|
| Hover, focus-visible, active, disabled on every interactive element | pass | nav links, chips (pressed and disabled in empty state), primary/secondary/quiet buttons (hover, active, disabled with reason "No bay free", loading spinner), search input, select, bay radios (hover, checked, focus ring), wordmark hover |
| Empty state on every list and table | pass | pull order ("Nothing to pull…"), filtered no-match with "Clear search and filters", blocking list, parts list, in-service table, empty bay tile ("Nothing queued") |
| Loading state matching final layout | pass | dashboard-1440-loading.png: skeleton figures, bar, blocking rows, bay tiles, parts rows, six table rows |
| Form fields: label, hint, error | pass | "Find vehicle" (label, hint, role=alert error for bad input); picker legend, mechanic select with label and hint, "Choose a bay" error |
| Destructive actions distinct and confirmed | pass, none destructive | "Pull to bay" is the job, confirmed inline with a bay choice, not a modal |
| Real copy and data | pass | 70 vehicles, London fleet numbering and plates, 8 mechanics, coherent dates around Mon 14 Sep 2026 |
| Six identity commitments present | pass | see DESIGN.md; wordmark, condensed display/body/mono stacks, warm paper tokens, accent on primary, selection and focus only (max 3 per viewport, verified in picker capture: rank-1 button, selected row, Confirm), 2 px radius / 1 px border / no elevation, 120/200 ms motion |
| No horizontal scroll at 390, 768, 1440 | pass | probe above; in-service table scrolls inside its wrapper with a strong edge at phone width |
| Long text | pass | 200+ character defect on 3118 clamps to two lines in the Defects cell; 58-character bay job on Bay 6 wraps inside the tile |
| Zero, one, many | pass | `?state=empty`, `?state=one`, default 26 + 40 rows |
| Reduced motion, no infinite animation outside loading | pass | global reduced-motion rule; only skeleton pulse and button spinner loop |
| Token conformance | pass | `scripts/check-tokens.sh .` → PASS |

P1 addressed: tabular numerals everywhere, one date format ("Tue 16 Sep") and 24-hour times, one glyph set at 12 px, Escape closes the picker and returns focus, contrast measured (below), selected row (accent-soft) distinct from hover (paper), wordmark / title / h1 agree ("DepotDesk HDN", "Dashboard · DepotDesk HDN", "Dashboard").
P2: "/" focuses search (kept), print stylesheet as a handover sheet (kept, minimal), dark mode not declared, optimistic update on pull (kept: 350 ms simulated confirm), skeleton pulse respects reduced motion.

## Taste rubric (self)

| Dimension | Score | Evidence |
|---|---|---|
| Product fit | 5 | The first band is "Out at 05:30" with a rostered count and a will-miss list; the rail is six physical bays with who is in them and for how long; the table is a pull order whose reason vocabulary is depot vocabulary (Safety defect, Parts landed, MOT due). None of this composition transfers to another product. |
| Hierarchy | 4 | At 1440 the eye lands on "48 ready", then the rank-1 row with the only blue button, then the bays. The five blocking rows under the bar are heavier than they need to be and delay the queue by one scroll on tablet. |
| Typography | 4 | Condensed uppercase numerals carry rank, fleet number and bay number; mono carries every time and date; body stays quiet. At 768 the reason column wraps to four lines on some rows, an uneven rhythm. |
| Rhythm | 4 | Sections are separated by a 2 px rule and 48 px, groups by hairlines; surfaces only on bay tiles and the table body. The tools row at 768 drops the search field to its own right-aligned line, which reads loose. |
| Identity | 4 | The signature (pull order with a stated reason, same vocabulary in the departure strip) is functional: removing the reason column would make the ranking a black box. Brand-removal test: strip the wordmark and blue and the page is still recognisably a depot shift sheet. Not yet memorable enough for a 5; the type fallback (Avenir Next Condensed) is doing the identity work rather than a committed face. |
| Finish | 4 | The most-used component, the queue row with its inline bay picker, has every state and the picker returns focus. Remaining unevenness: Parts-cell ETAs wrap to two lines on rows 22 and 23 at 1440; bay 4's job wraps under the fleet number rather than beside it. |

Total: 25 / 30, no dimension under 4. Verdict: PASS (self-scored; a judge would be the gate on a host that can dispatch one).

Structural weakness: the blocking list sits between the readiness bar and the pull order; on the tablet it costs a screen of scroll before the mechanic's queue.
Craft weakness: two-line clamps still hide the tail of the longest defect text on touch devices, where `title` does not show; the vehicle detail page (out of scope) is where that text must live in full.
Most finished: the queue row with inline bay picker. Least finished: the Parts cell in the queue table.

## Secondary gates (Stage 10, private route)

- Route: private, internal; `<meta name="robots" content="noindex">` present. SEO and GEO not applicable.
- Accessibility, static checks on the rendered DOM: 1 header, 1 main, 1 nav (labelled), 2 asides (labelled by heading); heading order h1 → h2 only; 0 inputs or selects without an associated label; 0 buttons without a text label; all 15 `<th>` carry `scope="col"`; every SVG glyph is `aria-hidden` with a text word beside it; severity chips carry visually-hidden words; departure bar has an `aria-label` sentence; table bodies set `aria-busy` while loading; every control is 44 px tall.
- Contrast (computed from the oklch tokens, sRGB): fg 16.2:1, ink-2 12.7:1, muted 6.4:1, accent text 7.6:1, ok 6.3:1, danger 7.0:1, amber ink 5.3:1, white on accent 7.9:1, white on danger chip 7.3:1, control borders (--border-strong) 3.4:1. Known 3:1 shortfalls, decorative only: table hairlines 1.5:1, the amber bar fill 2.0:1 (the segment sits between green and striped red and is labelled in text), skeleton blocks 1.2:1.
- Performance: one file, 63 KB raw / 16 KB gzipped, no fonts fetched, no external requests, no layout animations, deterministic seed data rendered once. No Lighthouse or axe run: the eval forbids installing tools and there is no served route; noted as skipped.
- Re-render after gate fixes: 1440, 768, 390 recaptured; no regression.
