# Directions: DepotDesk main dashboard

Brief inputs that shape every direction: a hard 05:30 departure clock, 40 to 80 vehicles per shift, a finite number of physical bays, expert users on a bright shared PC and on glare-lit rugged tablets, one decision to make ("pull which vehicle next"), and one question to answer ("what blocks the fleet").

## Direction A: Pull Order
The dashboard is a single ranked queue. Every vehicle that needs work is listed in the order it should be pulled into a bay, and every row states in plain words why it holds that rank ("Safety defect, out at 05:30", "MOT due in 2 days", "Parts landed 21:40"). The rank number is set large in stencil-like condensed type so it reads across a workshop from a tablet on a bench. A bay strip on the right shows the physical bays with what is in them and how long it has been there, so an empty bay and the top of the queue sit beside each other. A departure strip across the top counts what will and will not make 05:30. First screen feeling: a worksheet pinned to the workshop wall, not a management report.
- Hierarchy: rank and fleet number first, reason second, dates and parts third; the departure strip is the supervisor's entry point
- Navigation: persistent, minimal top bar (Dashboard, Vehicles, Defects, Parts); the dashboard is the home, no sidebar
- Density: dense
- Typography: condensed industrial display for ranks, fleet numbers and section heads; plain grotesk body; tabular mono for times and dates
- Data: one ranked table with stated reasons, one fixed bay strip, one readiness count; no charts
- Signature candidate: the pull order with a stated reason on every row; nothing is sorted by id by default
- Risk: the ranking algorithm must be legible and overridable or mechanics will distrust it; a long table can become a wall on tablet

## Direction B: Departure Horizon
The page is a horizontal time canvas from now to 05:30. Each vehicle is a bar placed at the time it is expected to be ready (parts ETA plus job length, or "now" if only inspection is needed). A vertical line marks 05:30; anything to its right will miss departure. Bays are swim lanes at the top of the canvas, showing current jobs as bars that end at the projected finish. Mechanics drag a vehicle from the "unscheduled" shelf into a lane. Supervisors read the right-hand side of the line to see what blocks the fleet. First screen feeling: an airport departure board rebuilt as a planning canvas.
- Hierarchy: the 05:30 line first, then bars crossing it, then the shelf of unscheduled work
- Navigation: contextual, the canvas is the whole page; details open in a side drawer
- Density: balanced, bars need breathing room
- Typography: quiet; time labels in mono carry the identity
- Data: canvas timeline with lanes; vehicle facts in a drawer
- Signature candidate: the departure line that every job is measured against
- Risk: a drag-to-schedule canvas is heavy on a touch tablet with gloves, needs pointer precision, and hides defect severity behind the time axis; job durations are estimates and a canvas presents them as facts

## Direction C: Fleet Wall
The page mirrors the magnetic allocation board in a depot office: a wall of 40 to 80 fleet-number tiles in numeric order, each with a status edge, a defect count, and a due marker. Bays are a fixed row of larger tiles at the top. Supervisors see the whole fleet at once and spot the off-road cluster; mechanics tap a tile to see defects and pull it. Filters by status collapse the wall to what matters. First screen feeling: standing in front of the board with a marker in hand.
- Hierarchy: the whole fleet as a field first, then colour and marks on tiles, then the bay row
- Navigation: persistent top bar with status filter chips as the primary control
- Density: dense grid, spacious detail
- Typography: expressive fleet numbers in condensed display at large size; everything else small
- Data: tile grid, detail on tap
- Signature candidate: the fleet wall, one tile per bus, ordered like the physical board
- Risk: numeric order is not priority order, so the mechanic's core decision ("which next") is not answered by the layout; tiles carry too little to compare two vehicles without opening both; a field of colour fails colour-blind users unless every state also has a glyph

## Scoring

| Criterion | A Pull Order | B Departure Horizon | C Fleet Wall |
|---|---|---|---|
| Product fit | 5 | 4 | 3 |
| User fit (gloves, glare, shared PC) | 5 | 2 | 4 |
| Workflow clarity (which next, what blocks) | 5 | 4 | 2 |
| Distinctiveness | 4 | 5 | 4 |
| Scalability (80 vehicles, more routes) | 4 | 3 | 3 |
| Accessibility | 5 | 2 | 3 |
| Implementation realism (single file, no libs) | 5 | 2 | 4 |
| Total | 33 | 22 | 23 |

## Pick

Direction A, Pull Order, with one element borrowed from C: the bays are shown as a fixed strip of physical tiles rather than a column in the table, because bays are finite and physical and an empty bay is the trigger for the whole workflow. B's single strongest idea, the 05:30 line, survives as the departure strip at the top of A: a readiness count and a segmented bar, not a canvas. This is a synthesis in the sense of the stage rules: A's structure carries the page, C's bay tiles and B's departure clock are elements inside it, and the identity is one thing.

Creative risks taken, per the controlled-risk rule: (1) the ranked table with a stated reason column replaces the KPI-row-plus-chart layout entirely; (2) the rank and fleet numbers are set in large condensed display type, which is unusual in a data table; (3) the departure strip is a segmented count bar, not a chart. Familiar controls, table semantics, and the destructive-adjacent action (pull to bay) stay conventional.
