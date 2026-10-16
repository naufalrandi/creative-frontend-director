# Craft Checklist

Run after implementation and before the taste gate. P0 items block. P1 items are fixed in the refine round. P2 items are noted in the ship report if skipped.

## P0: Blocks Completion

- [ ] Every interactive element has hover, focus-visible, active, and disabled treatments.
- [ ] Every list and table has an empty state with a sentence and, where sensible, an action.
- [ ] Every async surface has a loading state that matches the final layout shape.
- [ ] Every form field has a visible label, hint slot, and an associated error message.
- [ ] Destructive actions are visually distinct and confirmed.
- [ ] Real copy and realistic data everywhere. No lorem ipsum, no "Item 1", no invented statistics.
- [ ] Six identity commitments from `reference/identity-kits.md` are present and consistent across the surface.
- [ ] No horizontal scroll at 390, 768, 1440. Tables and code blocks scroll inside their own container.
- [ ] Long text does not break the layout: test one 60-character title and one 200-character description.
- [ ] Zero, one, and many are all handled: an empty list, a single row, forty rows.
- [ ] Reduced motion preserves visible content and primary tasks without parallax, scrubbed camera travel, or auto-rotation; loading shimmer becomes a stable state too. Auto-moving content has pause/stop/hide when required and pauses offscreen/hidden; no flashing effects.
- [ ] Expressive surfaces follow section 7's engine/property ownership. Timelines, render loops, observers/listeners, and owned GPU resources clean up; unavailable WebGL/assets yield usable static fallback. Keyboard/touch equivalents work; no scroll trap.
- [ ] Token conformance: `scripts/check-tokens.sh` passes with any justified exceptions recorded in the review.
- [ ] Primary action works with keyboard; focus is visible, overlays restore focus, and no keyboard trap exists.
- [ ] Text contrast is at least 4.5:1 (3:1 for large text); required UI boundaries and state indicators reach 3:1.
- [ ] Applicable error states preserve user input and offer recovery; state fixtures and primary-action outcome have reproduction evidence in the review.

## P1: Refine Round

- [ ] Numbers align with tabular numerals; units and currency are consistent.
- [ ] Dates and times use one format and one timezone convention.
- [ ] Icons share one set, one stroke weight, one size per context.
- [ ] Focus order follows reading order; Escape closes overlays; Enter submits.
- [ ] Recheck P0 contrast after refinements: 4.5:1 text, 3:1 large text and required UI indicators.
- [ ] Truncation shows a title or tooltip with the full value.
- [ ] Selected, current, and active states are distinguishable from hover.
- [ ] Transitions use shared timing/springs; layout continuity is transform-based where possible and exceptional reflow/paint costs are measured.
- [ ] The wordmark, browser title, and page h1 agree.

## P2: Note If Skipped

- [ ] Keyboard shortcuts for the two most repeated actions on expert surfaces.
- [ ] Print stylesheet for reports and handovers.
- [ ] Dark mode, only if `DESIGN.md` declares it.
- [ ] Optimistic updates with rollback on the primary action.

## The Finished-Component Test

Pick the one component users touch most on this surface. Would a senior product designer call it finished: states, spacing, alignment, type roles, edge cases, motion? If not, that component is the refine round's first task.
