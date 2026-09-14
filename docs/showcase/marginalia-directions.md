# Directions

Three structurally different answers to "what landing page could only belong to Marginalia?" Product: a reading app whose whole point is the margin. Audience: expert, text-first, skeptical of hype, iPad and laptop.

## Direction A: Running Margin
The page is itself an annotated document. A wide reading column carries the argument in prose; a persistent right margin carries everything a marginal note would carry in a real book: section markers, proof figures, asides, the two quotes. Each margin item is attached to its passage by a hairline leader with a small ink tick, the same grammar the app uses for notes. The hero is not a picture of the product; it is the product: a real passage (Thoreau, "Reading") rendered as HTML with three live margin notes, and a format switch (PDF page / EPUB reflow) that changes the line breaks while the notes visibly stay attached. First screen feels like opening a well-annotated book: paper, ink, one red, no chrome.
- Hierarchy: the H1 as a single line of large serif, then the reading view dominating the viewport; the CTA sits in the margin beside the H1 like a note, so it is seen without shouting
- Navigation: minimal top bar, wordmark plus three anchors and the trial button; no sticky sidebar
- Density: spacious in the marketing prose, dense inside the reading view (the product is dense and should look it)
- Typography: serif for display and for the passage, a system sans for UI and margin notes, mono only for format and export labels; type is the identity
- Data: proof numbers set as margin figures beside the quotes; pricing as one plain ruled table with tiers as columns
- Signature candidate: the margin rail with leader lines, running the full page, and the edition switch that proves notes stay attached
- Risk: leader positioning needs JS and a fallback; the running margin must collapse gracefully at 768 and 390; serif everywhere can drift into literary-magazine pastiche

## Direction B: Working Desk
The landing page is framed as the app's own workspace: a left library rail listing "documents" (each marketing section is a document you open), a centre reading pane, a right note pane. Marketing copy is delivered as documents inside the tool. Dense, operational, tool-first. First screen feels like sitting at someone's desk mid-project.
- Hierarchy: the workspace chrome first, then whichever document is open; the CTA lives in the toolbar
- Navigation: persistent three-pane workspace; library items act as nav
- Density: dense throughout
- Typography: one sans family at two weights, mono metadata; type is quiet, structure is the identity
- Data: pricing rendered as a "document" in the pane, proof as a status line
- Signature candidate: the whole page is a session in the product
- Risk: the conceit hides the pitch; skeptical readers must hunt for pricing and the trial; a fake app on a phone is cramped and hard to make indexable and scannable; the CTA loses weight inside chrome

## Direction C: Plain Statement
A single column of large, quiet type on paper. No product image above the fold: one sentence, four numbered claims, the two quotes, a ruled pricing table, one button. The product appears once, small, below the fold as a still reading view. First screen feels like a letter from the maker.
- Hierarchy: the sentence, then the numbered claims; nothing competes
- Navigation: none beyond the wordmark and the button; everything is on one scroll
- Density: spacious, almost austere
- Typography: quiet serif at generous measure; no display contrast
- Data: numbers as text in sentences; pricing as a three-line list
- Signature candidate: the numbered claims set as a manuscript with hanging figures
- Risk: it reads as a manifesto and never shows the thing; the task requires the product to be visible; austerity can look like an unfinished template rather than restraint

## Scores

| Criterion | A Running Margin | B Working Desk | C Plain Statement |
|---|---|---|---|
| Product fit | 5 | 4 | 3 |
| User fit | 5 | 3 | 4 |
| Workflow clarity | 4 | 2 | 4 |
| Distinctiveness | 5 | 4 | 3 |
| Scalability (more pages later) | 4 | 3 | 4 |
| Accessibility | 4 | 3 | 5 |
| Implementation realism | 4 | 3 | 5 |
| Total | 31 | 22 | 28 |

## Pick

Direction A, Running Margin, borrowing C's restraint in copy and C's refusal of decoration. B's honesty about the tool survives as the reading view's minimal chrome (a title, a format switch, a page count, nothing else). Controlled risks taken: (1) the running margin as page structure, (2) the edition switch in the hero as a demonstration of the first differentiator, (3) the CTA placed in the margin beside the H1 rather than under it. Familiar controls, semantics, and the pricing table stay conventional.
