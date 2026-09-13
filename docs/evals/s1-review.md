# Taste Gate Review: DepotDesk main dashboard

Judged from the rendered screenshots in `.design/screens/` (headless Google Chrome, final code state), not from the code.

Screens judged:
- `dashboard-1440-900.png`, `dashboard-1440-2400.png`, `dashboard-1440-3600.png` (desktop, first viewport and scrolled)
- `dashboard-768-1024.png`, `dashboard-768-2600.png` (tablet, first viewport and scrolled)
- `dashboard-390-844.png`, `dashboard-390-3200.png` (phone, rendered through a 390 px iframe because headless Chrome on macOS clamps windows to 500 px)

## Rounds

Round 1 (pre-fix renders): structure held, but three craft defects and two structural defects were visible. Craft: status label wrapped its mark onto its own line, reg and type broke with a dangling middot, "~1.5 h" gapped in mono. Structural: at 768 five columns in 720 px forced defects onto three lines, and at 768 and 390 the whole rail (bays, parts, MOT) sat above the list so "Pull next" started about 900 px down on the mechanic's primary device. The parts panel's after-pull-out ETAs overflowed their column. The phone capture also looked like a horizontal overflow; an instrumented probe showed the true cause was Chrome's 500 px minimum window, and a real 390 px viewport reports docW 390 with nothing outside the viewport except the bay strip's own scroll container.

Fixes were structural first: rows recompose to three columns (vehicle; defects over due; plan over action) between 768 and 1023, then stack fully below 768; the bay strip stays above the list at all narrow widths and the parts and MOT lists move below it; ETAs shorten to day plus time inside the week. Then craft: type on its own line, plain status word, "about 1.5 h" in sans, link underline removed from the Job sheet button.

Round 2 (final renders): scored below.

## Score

| Dimension | Score | Evidence in the screenshots |
|---|---|---|
| Product fit | 5 | Nothing here transfers to another product. The page is ranked against the 05:30 pull-out, the groups are "Pull next", "In a bay", "Parts due before pull-out", "Parts after pull-out", "Off road"; severities read VOR, Urgent, Minor; due dates are PMI and MOT; the rail is six physical bays with since and done times, then parts landing before and after 05:30, then MOTs lapsing. Blockers are written the way a supervisor says them: "Pads in stock, about 2 h", "Awaiting MOT slot, Mon 14 Sep 10:30". |
| Hierarchy | 4 | At 1440 the eye lands on "58 of 72", then on rank 1, 3388, then the blue button; the rail reads second. At 768 the bay strip is short enough that "Pull next" is on the first screen. Deduction: the amber due dates in the Due column pull attention across the row before the plan text does, and the pull-out line itself sits far down the desktop page below the ready chips, so on desktop its first appearance is the 3 px mark in the strip. |
| Typography | 4 | Roles are consistent and carry structure: 44 px mono count, 22 px mono fleet numbers, 13 px uppercase group titles with mono counts, mono for every time, date and registration, sans for words. Rhythm is even across groups and panels. Deduction: system faces only (task constraint), so identity comes from the mono and sans split rather than a chosen face; the 13 px hint text after group titles is at the floor of the scale. |
| Rhythm | 4 | Rows separate by hairline, groups by 32 px and a 1 px rule, sections by the 3 px line; surfaces exist only for the three rail panels, which are independent objects. Deduction: at 768 the legend wraps to three lines beside the count and the strip looks loose compared to the rest of the page; the ready chip block is the one place with mechanically identical gaps. |
| Identity | 4 | The pull-out line is the signature and it does work: 58 above, 14 below, the same line appears in the strip and inside the parts list, and the group titles are phrased relative to it. Brand-removal test passes: strip the wordmark and the blue, and the page is still recognisably a depot pull-out board. Deduction: on desktop the line is only met after scrolling past 43 chips; a supervisor sees the count first and the line second, so it is less memorable than it could be at the first viewport. |

Total: 21 of 25. No dimension under 4.

Result: PASS (total 20 or above with no dimension under 4).

## Remaining weaknesses, structural before cosmetic

1. The pull-out line's first appearance on desktop is late. A candidate for the next round is to pin the line's counts into the strip label ("58 above the line, 14 below") so the strip reads as the line, not as a chart.
2. The Due column competes with Plan when a date is within seven days. Amber is doing state work correctly, but a mechanic choosing the next vehicle reads plan before due; the order of the two columns could be swapped on desktop.
3. The 768 pull-out strip could drop the count to a single line with the legend under it rather than beside it.
4. "Return to service" is a two-tap confirm; the confirm button is outline red, which is the destructive treatment. Returning to service is high-consequence but not destructive; a neutral confirm treatment would be more honest.

## Secondary gates (Stage 10)

Route type: private, authenticated. `noindex` meta added. SEO and GEO do not apply.

Accessibility, checked by hand (axe not run: `@axe-core/cli` is not installed locally and the task allows no network installs):
- Contrast, computed from the tokens: fg on bg 15.92:1; muted on bg 6.24:1; muted on surface 6.80:1; accent on bg 5.85:1; white on accent 6.66:1; warn on bg 5.15:1; warn on warn-tint 4.84:1; danger on bg 5.68:1; danger on danger-tint 4.82:1; ok on bg 4.72:1; border on bg 3.38:1. All text at or above 4.5:1, outer UI borders above 3:1. `--rule` (inner row hairlines) is 1.31:1 and is decorative; rows are also separated by 10 px padding and the column alignment, so nothing depends on it.
- Keyboard: every action is a `button` or `a`; visible 2 px accent focus ring with 2 px offset; Escape cancels a bay choice or a confirm; no focus traps; no hover-only actions.
- Targets: buttons 44 px tall, rows 56 px, ready chips 32 px (they are informational, not controls).
- Semantics: `header`, `main`, `aside` with a label, one `h1` (visually hidden "Pull-out at 05:30"), `h2` per group and panel, search input with a label, column header row hidden from assistive tech with per-cell labels always present in the DOM, ranked list as `ol`, pull-out line as `role="separator"` with a label, proportional bar as `role="img"` labelled by its legend, a polite live region announcing "3388 pulled into bay 4." and "returned to service".
- Motion: only a 120 ms background transition; disabled under `prefers-reduced-motion`.

Performance: one file, 41.7 KB raw, 11.2 KB gzipped, one inline script, no fonts, no images, no network requests beyond the document. LCP is text, no layout shift sources (no images, no web fonts). Lighthouse not run for the same tooling reason as axe; nothing in the page is in a category Lighthouse would penalise.

Final check: re-rendered all seven captures after the last edit; no visual regression against the round 2 renders.
