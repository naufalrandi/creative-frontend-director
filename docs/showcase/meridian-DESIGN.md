# Meridian Design System

> Category: cash-flow intelligence for finance teams (authenticated, desktop-first operational product)
> A kept ledger: one quiet vertical spine of tables where the thirteen forecast weeks are a single shared x-axis for the chart and the numbers, and exceptions are the only red on the page.

## 1. Visual Theme

Meridian looks like the workbook a good controller keeps, moved to a screen that can recompute. Dense, aligned, monochrome, with one shape to read (the 13-week band) and one color of interruption (late money and breached minimums in red). Hierarchy is carried by alignment, mono numerals, type weight, and the position of the red rows, not by boxes, tiles, or elevation. The first screen shows the consolidated cash figure with its six components under it, the forecast band with its minimum-cash line, and the two working tables for today. Nothing on the page is there to look like software.

Key characteristics:
- Ledger rhythm: hairline-separated rows, right-aligned tabular numerals, cents shown wherever money moves.
- One shared week axis: the chart and the transposed week table use the same thirteen columns; scenario toggles recompute both.
- Exceptions interrupt: red is reserved for late receivables, breached minimums, and unusual outflows; nothing else is red.

## 2. Color

Temperature: cool slate. Every neutral sits on hue 250.

| Token | Value | Role |
|---|---|---|
| --bg | oklch(98% 0.004 250) | page background |
| --surface | oklch(100% 0 0) | table bodies, controls, the chart plane |
| --surface-2 | oklch(96% 0.006 250) | header rows, skeletons, hover rows |
| --fg | oklch(20% 0.02 250) | primary text and numerals |
| --muted | oklch(46% 0.02 250) | labels, metadata, axis text |
| --border | oklch(89% 0.008 250) | hairlines and separators |
| --border-strong | oklch(78% 0.012 250) | table head rule, section rule |
| --control-border | oklch(60% 0.016 250) | borders of buttons, switches, checkboxes; 3:1 on --bg |
| --accent | oklch(44% 0.17 262) | primary action, active nav, forecast median line, scenario-on, focus |
| --accent-hover | oklch(38% 0.17 262) | primary action hover |
| --accent-soft | oklch(44% 0.17 262 / 0.12) | confidence band fill, selected row tint |
| --ok | oklch(48% 0.13 155) | approved, on time, positive delta text |
| --warn | oklch(52% 0.13 65) | pending, unusual; 5:1 on --bg |
| --danger | oklch(50% 0.2 25) | late, breached, held payments |
| --danger-soft | oklch(50% 0.2 25 / 0.08) | breached cells and late row tint |

Rules: accent appears on the primary action, the active nav tab, the forecast median line, scenario-on switches, and focus rings only. Budget: at most seven accent occurrences per 1440x900 viewport. Semantic colors on state only; positive deltas use --ok text, never a green fill. Dark mode: no. The product is used at a desk in the morning on a lit screen; a second palette would double the QA surface for no workflow gain.

## 3. Typography

Faces: display and body `-apple-system, "SF Pro Text", "Segoe UI", system-ui, "Helvetica Neue", Arial, sans-serif`; mono `"SF Mono", ui-monospace, Menlo, Consolas, "Liberation Mono", monospace`.

Reason for one system family: the task forbids downloads, and the operational row of the identity kit makes one utility family the deliberate choice; identity comes from mono numerals and the ledger density, not from the display face.

| Role | Size | Weight | Line height | Notes |
|---|---|---|---|---|
| display (consolidated cash) | 2.5rem | 500 | 1.05 | mono, tracking -0.02em, one per page |
| page title | 1.125rem | 600 | 1.2 | tracking -0.01em |
| section title | 0.9375rem | 600 | 1.3 | followed on the same line by metadata |
| object title | 0.8125rem | 600 | 1.35 | customer or vendor names in tables |
| body | 0.8125rem | 400 | 1.45 | |
| label | 0.6875rem | 500 | 1.3 | uppercase, tracking 0.06em, --muted; table heads and field labels only |
| metadata | 0.75rem | 400 | 1.3 | --muted |
| numeric | 0.8125rem | 400 | inherit | mono, tabular-nums, right-aligned; 0.75rem in the week grid |
| wordmark | 0.6875rem | 600 | 1 | mono, uppercase, tracking 0.18em |

## 4. Spacing And Grid

Scale: 4, 8, 12, 16, 24, 32, 48 px. Within group: 4 to 8. Between groups: 16 to 24. Between sections: 32 to 48. Content max width: 1440 px with 32 px page padding (16 px at phone). Grid: 12 columns, 24 px gutters at 1200 and up; 6 columns at 768; single column below 720. Table row height 32 px; week grid cell 28 px.

## 5. Layout And Composition

One vertical spine in the order of the four questions: position, thirteen weeks, this week's risk, today's actions. Entry point is the consolidated cash figure, top left, largest mono figure on the page. The position band is asymmetric: figure and FX basis in a 4-column rail, the accounts table in the wide 5-column middle, exceptions in a 3-column rail. The forecast band is full width because thirteen columns need it. Receivables and payables are equal halves because they are peers. No centering of application content. No cards: sections are separated by a 1 px --border-strong rule and 40 px of space.

## 6. Components

Navigation model: persistent top bar with six text tabs (Overview, Forecast, Receivables, Payables, Scenarios, Accounts); frequent switching between few modules, and a sidebar would spend width the week grid needs.
Surfaces: a surface exists only for controls (buttons, switches, checkboxes) and the chart plane. Tables sit directly on --bg.
Shape language: radius 3 px, border 1 px (--border for separators, --control-border for controls), elevation none.
Controls: one primary button per section at most (accent fill), secondary buttons with hairline border, tertiary as underlined text. Destructive actions (Hold a payment, Dispute) use --danger text with a hairline border and require a second click labelled with the amount. Switches are 28 by 16 px with the knob in --fg when off and --accent when on. Checkboxes are 14 px squares.

## 7. Motion And Interaction

Functional only. --dur-1 120 ms for hover, press, toggle; --dur-2 200 ms for the forecast path recomputing and a row changing state; --dur-3 320 ms for the one skeleton shimmer. Easing cubic-bezier(0.2, 0, 0, 1). Only transform, opacity, color, background-color, border-color, and SVG `d` via CSS transition are animated. Numbers change immediately. No reveal on load, no counting. `prefers-reduced-motion` collapses every duration to 1 ms.

## 8. Voice And Brand

Sentence case everywhere except the wordmark and table-head labels. Terminology from the users' workbooks: "position", "P10 low", "trough", "aging", "chase", "approve", "held". Every figure that is money carries its currency symbol; non-USD figures show native currency with the USD equivalent beside them. Dates as "16 Sep", times as 24-hour. Copy states facts with their basis ("FX at 12 Sep close"), never reassurance. The brand appears as the wordmark and nothing else.

## 9. Anti-patterns

Specific to this product:
- Do not put a KPI card row above the accounts table; the total is a ledger line with its components under it.
- Do not add sparklines to accounts or receivables; the only chart is the one whose shape decides a scenario.
- Do not round the headline to "$4.3M"; the controller reconciles it to the bank.
- Do not use green fills for "healthy"; the absence of red is the healthy state.
- Do not hide the FX basis or the sync times; a stale number without its timestamp is a wrong number.
- Do not use pills for approval state; a word in --warn, --ok, or --danger is enough to scan.
- Do not add a left sidebar, a search bar, or a notification bell that leads nowhere.
- Do not smooth the forecast with a curve; weekly closings are points joined by straight segments.

## 10. Product Signature

The shared week axis. The thirteen forecast weeks are drawn once as columns: the SVG band above and the transposed week table (inflows, outflows, closing, P10 low) below share them exactly, and the minimum-cash line runs across both as a threshold. Flipping a scenario recomputes the band and the cells together, and any week whose P10 low breaches the minimum is tinted in --danger-soft in the chart and the grid. It improves comprehension because the users already think in this transposed week layout; it makes shape and number one object.

## Identity Commitments

1. Wordmark: MERIDIAN set in the mono face at 0.6875rem, weight 600, uppercase, tracking 0.18em, preceded by a 1 by 14 px accent rule (the meridian line). Same treatment in the top bar and the browser title "Meridian · Cash overview".
2. Type pairing: system sans (SF Pro Text / Segoe UI / system-ui) for display and body, SF Mono / ui-monospace / Menlo for every numeral and the wordmark.
3. Palette temperature: cool slate, hue 250 for every neutral; six core tokens above.
4. Accent budget: one accent, cobalt oklch(44% 0.17 262), allowed on primary action, active nav tab, forecast median line, scenario-on switch, focus ring, wordmark rule; at most seven occurrences per viewport.
5. Shape language: crisp; radius 3 px, 1 px hairline, no elevation, separators over cards.
6. Motion attitude: functional; 120 / 200 / 320 ms scale, ease-out only, reduced-motion respected.

## Evidence

| Decision | Evidence |
|---|---|
| Dense ledger, no decoration, mono tabular numbers | observed (README: "expect precision, tabular numbers, and no decoration") |
| Four-question spine order | observed (README: "It must answer: ...") |
| One chart only, the 13-week band | provided (task: charts only where a decision depends on shape) + observed (forecast with confidence band) |
| Top nav, no sidebar | inferred (five to six modules, frequent switching; design-reference navigation table) |
| Cool slate temperature | inferred (identity-kits: operations and finance row) |
| Cobalt accent | inferred (domain: navigator's meridian; low chroma enough to sit under red) |
| System font stack | provided (task: no downloads) |
| No dark mode | inferred (morning desk use) |
| USD reporting currency, FX at prior close | inferred (three currencies need one basis) |
| Batch approval with undo | inferred (financial, high-consequence action) |
