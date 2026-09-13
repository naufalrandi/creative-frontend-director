# Directions: DepotDesk main dashboard

Input: `.design/brief.md`, `.design/brand-spec.md` (Branch B). The page must answer two questions at a glance: "which vehicle do I pull into a bay next?" (mechanic) and "what is stopping the fleet going out at 05:30?" (supervisor). 40 to 80 vehicles, shared workshop PC and rugged tablets.

## Direction A: Pull-out Line

The whole page is organised around one deadline. The fleet is a single ranked list, sorted by what stops a vehicle going out at 05:30, and a heavy horizontal rule (the pull-out line) is drawn through the list: everything above it is expected to go out, everything below it will not. Mechanics read from the top of the "fixable now" group and take the next row; supervisors read the position of the line and the group below it. The first screen feels like a departure board crossed with a job sheet: big monospaced fleet numbers, severity in colour, plain-language blockers ("Brake pads, ETA 03:10"), and a running count of how many buses will make the pull-out. A narrow bay panel on the right shows the physical bays and who is in them, so "pull into bay" is a real, bounded action.

- Hierarchy: the pull-out count (58 of 72 will go out) and the first row of the fixable-now group; then the line; then bays.
- Navigation: minimal persistent top bar (depot, shift, clock, user). No sidebar; the dashboard is the home and other pages are reached from rows.
- Density: dense, tablet-scaled (15 px body, 48 px rows).
- Typography: mono for fleet numbers, registrations, times and dates; quiet sans for everything else; one big tabular number.
- Data: one ranked, grouped list plus a six-bay board. No charts; the pull-out line and group counts are the chart.
- Signature candidate: the pull-out line and its moving count.
- Risk: the ranking rule must be legible or mechanics will distrust the order; the list needs a stable ready-group so 50 quiet vehicles do not drown the 20 that matter.

## Direction B: Bay Board

The page is the depot floor. Six bays are large columns across the screen, each showing the vehicle inside, the mechanic, and the job; a yard queue on the left lists vehicles waiting, and off-road vehicles sit in a parked strip at the bottom. Mechanics drag or tap a vehicle from the yard into a free bay. Spacious, tactile, whiteboard-like. The first screen feels like the physical bay whiteboard that most depots already keep, made live.

- Hierarchy: free bays first, then the yard queue.
- Navigation: contextual; tapping a vehicle opens a job sheet drawer.
- Density: spacious.
- Typography: expressive, oversized bay numbers and fleet numbers.
- Data: cards in columns; blockers as card badges.
- Signature candidate: the bay columns as a live whiteboard.
- Risk: it is a kanban board with a paint job; 80 vehicles as cards do not scan, supervisors lose the fleet-level count, and drag on a gloved tablet is unreliable.

## Direction C: Shift Ledger

A dense, printed-job-sheet ledger: every vehicle as a row in one tall table with sticky headers and column filters, grouped by status, with a persistent left navigation (Vehicles, Defects, Parts, PMI, MOT). Quiet type, hairline rules, no cards, no colour except severity. The first screen feels like a well-set timetable: authoritative and complete.

- Hierarchy: column headers and status groups; the eye scans for red.
- Navigation: persistent left rail.
- Density: dense, desktop-scaled.
- Typography: quiet, small-cap column labels, tabular numerals.
- Data: a full table; sort and filter carry the workflow.
- Signature candidate: status groups rendered as ledger sections with running totals.
- Risk: the decision "which one next" is left to the user's scanning; on a tablet the table needs horizontal scroll; the left rail spends 220 px on navigation the dashboard does not need.

## Scores

| Criterion | A Pull-out Line | B Bay Board | C Shift Ledger |
|---|---|---|---|
| Product fit | 5 | 4 | 3 |
| User fit (mechanic + supervisor) | 5 | 3 | 3 |
| Workflow clarity | 5 | 3 | 2 |
| Distinctiveness | 4 | 3 | 2 |
| Scalability (40 to 80 vehicles, more pages) | 4 | 2 | 5 |
| Accessibility (gloves, glare, keyboard) | 4 | 2 | 4 |
| Implementation realism (single HTML, no libs) | 5 | 3 | 5 |
| Total | 32 | 20 | 24 |

## Pick

Direction A, Pull-out Line, taking the bay board from B as a secondary panel (tap-to-assign, no drag) and the grouped, running-total rhythm from C for the list. A alone wins on the two jobs the README names; B's bay panel makes "pull into bay" a bounded, visible action instead of an abstract status change; C's grouping keeps 80 rows scannable. The synthesis is coherent because all three pieces serve the same deadline.

Controlled risks taken: the pull-out line as a layout element inside a list; the ranking of the list by blocker rather than by fleet number; no charts on a dashboard.
