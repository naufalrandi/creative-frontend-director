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
- [ ] `prefers-reduced-motion` respected; no infinite animation outside loading.
- [ ] Token conformance: `scripts/check-tokens.sh` passes.

## P1: Refine Round

- [ ] Numbers align with tabular numerals; units and currency are consistent.
- [ ] Dates and times use one format and one timezone convention.
- [ ] Icons share one set, one stroke weight, one size per context.
- [ ] Focus order follows reading order; Escape closes overlays; Enter submits.
- [ ] Text contrast at or above 4.5:1; UI element contrast at or above 3:1.
- [ ] Truncation shows a title or tooltip with the full value.
- [ ] Selected, current, and active states are distinguishable from hover.
- [ ] Transitions use the duration scale; nothing animates layout.
- [ ] The wordmark, browser title, and page h1 agree.

## P2: Note If Skipped

- [ ] Keyboard shortcuts for the two most repeated actions on expert surfaces.
- [ ] Print stylesheet for reports and handovers.
- [ ] Dark mode, only if `DESIGN.md` declares it.
- [ ] Optimistic updates with rollback on the primary action.
- [ ] Skeleton shimmer respects reduced motion.

## The Finished-Component Test

Pick the one component users touch most on this surface. Would a senior product designer call it finished: states, spacing, alignment, type roles, edge cases, motion? If not, that component is the refine round's first task.
