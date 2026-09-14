# Directions: Meridian cash overview

Brief in hand: expert finance operators, morning scan and Monday prep, six accounts in three currencies, a 13-week forecast with confidence, late receivables, payables awaiting approval, scenarios, alerts. The page must answer four questions in order: position today, shape over 13 weeks, risk this week, what to chase or approve today.

## Direction A: Ledger Spine
A single vertical ledger with four bands in the order the questions are asked. Position is a stated total with its six components and the FX basis under it, not a hero tile. The 13-week forecast is the one chart on the page, and its thirteen columns continue straight down into a transposed week table (inflows, outflows, closing, P10 low) so the shape and the numbers share one x-axis, like the forecast tab of an FP&A workbook. Below it, receivables and payables sit side by side as working tables with the action controls inside the rows. Exceptions interrupt the grey rhythm with the only red on the page. The first screen feels like a well-kept ledger: quiet, aligned, dense, with one shape to read.
- Hierarchy: consolidated cash total first (largest mono figure), then the forecast trough versus the minimum-cash line, then the red rows.
- Navigation: persistent top bar with text tabs; page is one scroll, no sidebar.
- Density: dense.
- Typography: quiet. One sans family for labels, mono for every number. Identity comes from tabular rhythm.
- Data: tables everywhere; one SVG band chart aligned to a week grid.
- Signature candidate: the week columns of the chart and the table are the same columns; scenarios recompute both together.
- Risk: reads as flat if section boundaries are weak; the week grid needs a phone fallback.

## Direction B: Week Canvas
The page is a horizontal calendar of cash. Thirteen week columns run edge to edge and everything hangs from them: forecast band on top, then per-week rows for collections expected, payables due, payroll, capex, with today's column widened to show this week's detail (accounts, alerts, approvals) inline. Scenario toggles drag items between columns. It feels like a planning board, workflow-centric, with the calendar as the object.
- Hierarchy: the week grid first, today's column second, totals last.
- Navigation: contextual; clicking a week expands it; top bar minimal.
- Density: balanced.
- Typography: technical; condensed labels on columns.
- Data: canvas-like grid; numbers inside cells; chart above.
- Signature candidate: today's column widened as the working area inside the calendar.
- Risk: today's position and the action list become secondary to the calendar; horizontal scroll on tablet; phone unusable; CFO Monday scan gets slower.

## Direction C: Morning Brief
An editorial page: a written brief at the top, generated from data ("Cash is $4.34M, down $61k since Friday. The forecast dips to $2.44M in the week of 26 Oct, within $440k of the minimum. Three payables need approval by Wednesday."), set in a serif display with generous measure, followed by evidence sections in spacious rhythm. It feels like the note the controller writes the CFO, with the tables as appendices.
- Hierarchy: the sentences first, then the numbers they cite.
- Navigation: persistent top bar; anchor links from sentences to sections.
- Density: spacious.
- Typography: expressive; serif display, sans body.
- Data: tables and the same forecast chart, but subordinate to prose.
- Signature candidate: every figure in the brief is a link to the row that proves it.
- Risk: controllers read prose as decoration and generated sentences as AI filler; the page gets long; precision suffers when numbers are rounded for prose.

## Scores (1 to 5)

| Criterion | A Ledger Spine | B Week Canvas | C Morning Brief |
|---|---|---|---|
| Product fit | 5 | 4 | 3 |
| User fit | 5 | 3 | 3 |
| Workflow clarity | 5 | 3 | 4 |
| Distinctiveness | 4 | 5 | 4 |
| Scalability | 4 | 2 | 3 |
| Accessibility | 5 | 3 | 4 |
| Implementation realism | 5 | 3 | 4 |
| Total | 33 | 23 | 25 |

## Pick

Direction A, Ledger Spine, with one element taken from C: the trough callout beside the forecast is written as a single precise sentence built from the data, with the figures as the visible evidence, not rounded prose. B's idea of scenario toggles recomputing the grid is already inside A's signature.

Controlled risks taken: (1) the transposed 13-column week table aligned under the chart is unusual on a web dashboard but native to the users' workbooks; (2) mono numerals for every figure including the headline; (3) no KPI cards at all, the position is a ledger line.
