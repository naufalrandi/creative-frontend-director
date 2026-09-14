# DepotDesk Design System

> Category: internal operations tool, fleet maintenance
> A worksheet pinned to the workshop wall: warm paper, stencilled numbers, one ranked list that says which bus comes in next and why.

## 1. Visual Theme

DepotDesk looks like something that belongs in a bus depot workshop, not in a SaaS demo. The canvas is warm paper because the shared PC sits in a bright office and the tablets go outside; the ink is warm near-black; the only cool colour is the overall blue used for the one action a mechanic takes here. Fleet numbers and rank numbers are set in condensed, uppercase, industrial display type at sizes that read from a bench two metres away. Everything else is quiet grotesk and tabular mono. Density is high: 40 to 80 vehicles fit on the page without pagination. Hierarchy is carried by type size, weight, alignment, and hairline separators, never by boxes or shadows. The first screen feels like a shift sheet: a clock, a count of what makes 05:30, the pull order, and the bays.

Key characteristics:
- Warm paper canvas, warm ink, one cool accent
- Condensed uppercase display numerals for rank, fleet number, bay number, and section heads
- Stated reasons: every ranked row and every at-risk count says why in plain words
- Severity and status are always text plus a glyph, never colour alone
- Touch targets of 44 px or more on every control; no hover-only information

## 2. Color

| Token | Value | Role |
|---|---|---|
| --bg | oklch(97.5% 0.009 85) | page background, warm paper |
| --surface | oklch(99.3% 0.004 85) | table body, bay tiles, top bar |
| --fg | oklch(22% 0.022 60) | primary text, warm ink |
| --muted | oklch(47% 0.022 65) | secondary text, reasons, metadata |
| --border | oklch(85% 0.014 80) | hairlines and separators |
| --accent | oklch(43% 0.12 250) | primary action, selection, focus ring; "overall blue" |
| --ok | oklch(48% 0.12 150) | ready, in service |
| --warn | oklch(76% 0.15 80) | at risk, due soon; used as a fill with --fg text, never as text on paper |
| --danger | oklch(49% 0.19 28) | safety defect, off road, will miss departure |

Derived, non-negotiable: --fg-on-accent oklch(99% 0 0); --accent-soft oklch(93% 0.03 250) for a selected row; --danger-soft oklch(94% 0.03 28); --warn-soft oklch(95% 0.05 85); --warn-ink oklch(52% 0.13 70) for the at-risk glyph and any amber text, because --warn as a fill cannot reach 3:1 on paper; --ok-soft oklch(94% 0.04 150); --ink-2 oklch(30% 0.02 60) for table numerals.

Rules: accent appears on the primary "Pull to bay" action, the selected row, and focus rings only, at most three visible instances per viewport. Semantic colours mark state only and are always accompanied by a word or a glyph. Dark mode: no. The environment is a bright office and daylight bays; a dark theme would lower contrast under glare and there is no per-user preference on a shared PC.

## 3. Typography

Faces:
- display: "Barlow Condensed", "Avenir Next Condensed", "Arial Narrow", "Helvetica Neue", Arial, sans-serif
- body: Barlow, "Avenir Next", "Helvetica Neue", Arial, sans-serif
- mono: ui-monospace, "SF Mono", Menlo, Consolas, "Liberation Mono", monospace

No font files are downloaded. The stacks are chosen so the fallback keeps the personality: a narrow uppercase display on macOS (Avenir Next Condensed) and Windows (Arial Narrow), a plain grotesk body, and the platform mono for numerals.

| Role | Size | Weight | Line height | Notes |
|---|---|---|---|---|
| display (rank, bay number) | 34 px | 700 | 1 | display face, uppercase, letter-spacing 0 |
| page title | 22 px | 700 | 1.1 | display face, uppercase, letter-spacing 0.02em |
| section title | 15 px | 700 | 1.2 | display face, uppercase, letter-spacing 0.06em |
| object title (fleet number) | 24 px | 700 | 1 | display face, tabular-nums |
| body | 15 px | 400 | 1.45 | body face |
| label | 12 px | 600 | 1.2 | body face, uppercase, letter-spacing 0.08em, --muted |
| metadata | 13 px | 400 | 1.4 | body face, --muted |
| numeric (times, dates, ETAs) | 14 px | 500 | 1.3 | mono face, tabular-nums, --ink-2 |

Minimum text size anywhere: 12 px. Minimum body text on tablet: 15 px.

## 4. Spacing And Grid

Scale: 4, 8, 12, 16, 24, 32, 48, 64 px. Within group: 4 to 8. Between groups: 16 to 24. Between sections: 32 to 48. Content max width: none; the dashboard fills the shared PC monitor, with 24 px page gutters (16 px on tablet, 12 px on phone). Grid: at 1200 px and above, main area is 1fr for the pull queue and 300 px for the bay strip with a 32 px gutter; between 760 and 1199 px, the bay strip moves above the queue as a horizontal row; below 760 px, everything stacks in one column and the table becomes a list of rows.

## 5. Layout And Composition

Hierarchy strategy: the eye lands on the 05:30 count, then on rank 1 in the pull order, then on the bay strip. The top bar is thin and quiet. The departure strip is the supervisor's entry point and the pull queue is the mechanic's; both are visible above the fold at 1440 x 900. Asymmetry: the queue takes the wide column, the bays the narrow one, never equal halves. Full width is reserved for the departure strip and the queue table; nothing else spans the page. No empty state cards, no hero.

## 6. Components

Navigation model: a persistent top bar with four text links (Dashboard, Vehicles, Defects, Parts), the depot code, the shift, and a live clock. No sidebar: the tool has four sections and tablets lose too much width to a rail.
Surfaces: a surface is allowed only for bay tiles and the table body. Sections are separated by hairlines and section titles, not by cards.
Shape language: radius 2 px, border 1 px, elevation none. Non-interactive hairlines use --border; interactive boundaries (inputs, selects, chips, secondary buttons) use --border-strong so the control edge reaches 3:1 on paper. Status is shown with a 4 px left edge on bay tiles and a glyph plus word on rows, not with borders or shadows.
Controls: one primary button (accent fill, --fg-on-accent text, 44 px tall); secondary buttons are outlined in --border with --fg text; the only destructive-adjacent action on the dashboard, "Pull to bay", is primary because it is the job, and it is confirmed with an inline "which bay" choice rather than a modal. Inputs are 44 px tall with a 1 px border and a 2 px accent focus ring offset by 2 px.

## 7. Motion And Interaction

Restrained and functional. Durations: 120 ms for hover and focus colour, 200 ms for the expand of a row or the bay picker. Easing: cubic-bezier(0.2, 0, 0, 1). Nothing animates on load. Numbers never count up. The clock ticks by replacing text. Under prefers-reduced-motion every transition is 0 ms.

## 8. Voice And Brand

Copy is short, imperative, and in a mechanic's words: "Pull to bay", "Parts landed", "Will miss 05:30", "Safety defect". Sentence case for everything except the display numerals and section titles, which are uppercase by type treatment, not by copy. Dates are written as "Tue 16 Sep" and times as 24-hour "21:40". No exclamation marks, no "Great job", no empty-state illustrations. Wordmark: "DEPOTDESK" set in the display face at 18 px, weight 700, uppercase, letter-spacing 0.04em, followed by the depot code in mono; a filled 2 px-radius block before the name carries the current rank-1 fleet number's first digit only in the browser title, otherwise the wordmark is text alone.

## 9. Anti-patterns

Specific to this product:
- Do not open the page with a row of four KPI cards; the departure strip is one sentence and one bar.
- Do not add a donut or pie of vehicle status; the counts are in the strip and the queue is the detail.
- Do not sort vehicles by fleet number by default; the pull order is the point.
- Do not mark severity or status by colour alone; sodium lighting and colour-blind mechanics.
- Do not use hover to reveal the reason, the ETA, or the action; tablets have no hover.
- Do not use a dark theme or glass panels; this is a workshop, not a control room.
- Do not put "Pull to bay" behind a modal confirmation; use the inline bay picker.
- Do not paginate the fleet; 80 rows on one page is the job.
- Do not use Inter plus slate; the identity is condensed industrial type on warm paper.

## 10. Product Signature

The pull order with a stated reason. Every vehicle on the dashboard is presented in the order it should be pulled into a bay, with a large rank number and a one-line reason for that rank drawn from a fixed vocabulary (Safety defect, Will miss 05:30, MOT due, Parts landed, Service due, Inspection only). The same vocabulary labels the at-risk counts in the departure strip, so the supervisor's count and the mechanic's queue are visibly the same list. Removing the reason column would make the ranking a black box and the product harder to trust, which is the test that this is a signature and not decoration.

## Identity Commitments

1. Wordmark treatment: "DEPOTDESK" in the display face, 18 px, 700, uppercase, letter-spacing 0.04em, followed by the depot code "HDN" in mono at 13 px; no logo glyph.
2. Type pairing: display "Barlow Condensed" / "Avenir Next Condensed" / "Arial Narrow"; body Barlow / "Avenir Next" / "Helvetica Neue" / Arial; mono ui-monospace / "SF Mono" / Menlo / Consolas. Industrial character that survives the fallbacks.
3. Palette temperature: warm paper. --bg oklch(97.5% 0.009 85), --surface oklch(99.3% 0.004 85), --fg oklch(22% 0.022 60), --muted oklch(47% 0.022 65), --border oklch(85% 0.014 80), --accent oklch(43% 0.12 250).
4. Accent budget: one accent, overall blue, on the primary "Pull to bay" button, the selected row, and focus rings; at most three visible instances per viewport.
5. Shape language: radius 2 px, border 1 px, elevation none; status carried by a 4 px left edge and a glyph.
6. Motion attitude: functional; 120 ms for colour, 200 ms for expand; cubic-bezier(0.2, 0, 0, 1); zero under reduced motion.

## Evidence

| Decision | Evidence |
|---|---|
| Users are expert mechanics and supervisors | observed (README) |
| Devices are a shared PC and rugged tablets | observed (README) |
| 05:30 departure is the organising deadline | observed (README) |
| Data fields for each vehicle | observed (README) |
| Vite + vanilla, no component library | observed (package.json, README) |
| Warm paper temperature | inferred (rule: workshop and long reading under bright light; identity-kits palette table) |
| Industrial condensed display type | inferred (rule: identity-kits "industrial, raw" row adapted; fleet numbers are stencilled on real buses) |
| Overall blue accent | inferred (rule: the only hue not reserved for a semantic state; domain meaning from mechanics' overalls) |
| Density dense | inferred (rule: expert operators plus 40 to 80 tabular rows) |
| No dark mode | inferred (rule: bright environment, shared device, no per-user preference) |
| Four-section top bar, no sidebar | inferred (rule: tablet width and a small number of sections) |
| Six bays at the depot | inferred (placeholder count for seed data; the strip scales to any count) |
| Depot code HDN, night shift, supervisor name | inferred (seed data only) |
