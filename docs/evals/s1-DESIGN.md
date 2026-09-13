# DepotDesk Design System

> Category: internal operations tool (bus depot maintenance)
> A departure board crossed with a paper job sheet: one ranked list of the fleet with a pull-out line drawn through it, because the only question that matters at 02:00 is which buses will go out at 05:30.

## 1. Visual Theme

DepotDesk looks like the best-kept whiteboard in the depot. Warm paper canvas, ink text, hairline rules, monospaced numbers, and colour used only where a mechanic would reach for a red or amber pen. Density is high but tablet-scaled: 15 px body, 48 px row hit areas, nothing smaller than 13 px. Hierarchy is carried by type size, weight, mono versus sans, and position relative to the pull-out line, never by boxes or shadows. The first screen shows the pull-out count, the next vehicle to pull, and the six bays, in that order.

Key characteristics:
- One deadline organises the page; everything is ranked relative to 05:30.
- Severity is the loudest thing on the page; the brand is quiet.
- Identifiers, times and dates are monospaced and tabular so columns align by eye.
- Surfaces separate by hairline, not elevation.

## 2. Color

| Token | Value | Role |
|---|---|---|
| --bg | #F3F0E8 | page background, warm paper |
| --surface | #FBFAF6 | grouped surface (bay panel, list body) |
| --fg | #17160F | primary text (about 16:1 on --bg) |
| --muted | #5B5850 | secondary text (about 6.4:1 on --bg) |
| --border | #87826F | outer hairlines and group rules (about 3.1:1 on --bg) |
| --rule | #D8D3C6 | inner row rules |
| --accent | #1D4FD7 | primary action, selected bay, focus ring |
| --accent-ink | #FFFFFF | text on accent |
| --ok | #1E7A3C | ready for pull-out (text and mark) |
| --ok-tint | #DCEFE1 | ready background tint |
| --warn | #9A5200 | urgent defect, due soon (text) |
| --warn-tint | #FBE7C6 | urgent background tint |
| --danger | #B91C1C | off road, will not go out (text) |
| --danger-tint | #F8D7D3 | off road background tint |
| --ink-line | #17160F | the pull-out line |

Rules: accent appears on the one primary action per row ("Pull into bay"), the selected bay, and focus rings only. Semantic colours appear on status and severity only, always paired with a word. Dark mode: no. The tablets are matte and the workshop is lit; a fixed light canvas avoids reflections and keeps one contrast budget. A "night" token set can be added later without changing structure.

## 3. Typography

Faces: display and body `ui-sans-serif, system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif`; mono `ui-monospace, "SF Mono", Menlo, Consolas, "Liberation Mono", monospace`. No external fonts (task constraint).

| Role | Size | Weight | Line height | Notes |
|---|---|---|---|---|
| display | 44 px | 700 | 1 | the pull-out count; mono, tabular-nums, letter-spacing -0.02em |
| page title | 20 px | 600 | 1.2 | depot and shift in the top bar |
| section title | 13 px | 700 | 1.2 | uppercase, letter-spacing 0.06em, with a count in mono |
| object title | 22 px | 700 | 1 | fleet number; mono |
| body | 15 px | 400 | 1.4 | blockers, defect text |
| label | 13 px | 600 | 1.2 | column labels, uppercase, letter-spacing 0.04em |
| metadata | 13 px | 400 | 1.3 | muted; dates and mechanic names |
| numeric | 15 px | 500 | 1.3 | mono, tabular-nums; times, dates, registrations, bay numbers |

## 4. Spacing And Grid

Scale: 4, 8, 12, 16, 24, 32, 48 px. Within group: 8 to 12. Between groups: 16 to 24. Between sections: 32 to 48. Content max width: 1600 px, fluid below that, 16 px side gutter at all widths (24 px from 1024). Grid: 1200 px and up, two columns `minmax(0,1fr) 360px` with a 24 px gutter; 768 to 1199, one column with the bay board as a horizontal six-up strip above the list; below 768, one column, bay strip scrolls horizontally, list rows stack their cells.

## 5. Layout And Composition

Entry point is the pull-out strip: a single proportional bar of the fleet (will go out, in bay, needs attention, will not go out) with the count in display type. Under it, the list on the left is the page; the bay board on the right is the only secondary surface. Asymmetry is deliberate: the list gets the width because it carries 80 rows; bays are six fixed items. The pull-out line runs full width of the list. Nothing is centered; everything hangs from the left edge and a shared column grid. Full-width rules only: the top bar and the pull-out strip.

## 6. Components

Navigation model: persistent top bar only (wordmark, depot and shift, live clock with time to pull-out, user). The dashboard is home. Other pages are reached from a row or a bay, not from a menu, because the mechanic's route is always vehicle first.
Surfaces: a surface is allowed for the bay board and for the list body. No nested surfaces, no cards inside rows.
Shape language: radius 3 px on controls and tints, 0 on surfaces and rules; border 1 px --border on outer edges, 1 px --rule inside; elevation none anywhere.
Controls: primary button is solid accent, 44 px tall, mono-weight label; secondary is 1 px --border outline; destructive (mark off road) is outline --danger with a confirm step, never solid red. Inputs are 44 px, 1 px --border, 3 px radius. Status is a word with a 10 px square mark, never a pill alone. Rows are 48 px minimum, the whole row is the hit area, and the primary action is a real button inside the row.

## 7. Motion And Interaction

Restrained and functional. Row state changes cross-fade in 120 ms ease-out; the clock ticks every minute; group counts update in place. Nothing animates on load, nothing on hover except a background tint. With `prefers-reduced-motion`, all transitions are disabled. Keyboard: rows are focusable, the primary action is a button, Enter activates, focus ring is 2 px accent with 2 px offset.

## 8. Voice And Brand

Plain depot English, sentence case, no exclamation marks. Use the words on the wall: pull-out, bay, VOR (vehicle off road), PMI (planned maintenance inspection), MOT, defect, parts ETA, walk-round. Blockers are written as reasons a supervisor would say aloud: "Brake pads, ETA 03:10", "Awaiting MOT slot". The brand is the wordmark "DepotDesk" in the top bar and nothing else.

## 9. Anti-patterns

Specific to this product:
- Do not open with a row of four KPI cards; the pull-out strip is the only summary.
- Do not add charts; a ranked list with a line through it answers the question better than a bar chart of statuses.
- Do not sort by fleet number by default; sort by what blocks pull-out.
- Do not use status pills without a word, and never colour by mechanic.
- Do not use hover-only actions, drag-and-drop as the only way to assign a bay, or text under 13 px; the user is wearing gloves and standing.
- Do not add a left sidebar; it spends width the list needs and the dashboard is home.
- Do not use shadows, gradients, glass, or a dark "cyber" console look.
- Do not hide the 50 ready vehicles entirely; collapse them with a count so the fleet total is always verifiable.

## 10. Product Signature

The pull-out line. The fleet list is ranked by what stops each vehicle going out at 05:30; a heavy ink rule labelled with the time and the count is drawn through the list between the vehicles expected to go out and those that will not. Above the line: fixable now, in a bay, ready. Below the line: awaiting parts past pull-out, off road, MOT lapsed. The same line appears as a proportional bar in the pull-out strip at the top. As mechanics finish jobs and pull vehicles into bays, rows cross the line and the count moves, so both the mechanic's "what next" and the supervisor's "what is blocking" are answered by where things sit relative to one rule. Removing it turns the page back into a status table, so it passes the signature test.

## Evidence

| Decision | Evidence |
|---|---|
| Organise by the 05:30 pull-out | observed (README: supervisors use the page to see what blocks the fleet at 05:30) |
| Ranked list, not cards or charts | observed (README data is one flat vehicle record; 40 to 80 rows) |
| Bay board as secondary panel | observed (README: bay number, "pull into a bay next") |
| Warm paper canvas, ink text | inferred (workshop lighting, matte tablets; Branch B) |
| Blue accent, single job | inferred (must not collide with red/amber severity) |
| 15 px body, 48 px rows, 44 px controls | inferred (gloves, standing, arm's length tablet) |
| System font stacks only | provided (no external libraries or CDN) |
| No dark mode | inferred (glare on matte tablets; one contrast budget) |
| Terminology: VOR, PMI, MOT, pull-out | inferred (UK depot vocabulary; README uses MOT) |
| Top bar only, no sidebar | inferred (dashboard is home; width belongs to the list) |
