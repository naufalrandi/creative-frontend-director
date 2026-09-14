# Review: marginalia.app landing page

Route: `/` (index.html). Workflow: greenfield. Scored by: self (no judge could be dispatched in this run; the score is marked "self" per `gates/taste-rubric.md`).

## Craft checklist, P0

| Item | Status | Evidence |
|---|---|---|
| Every interactive element has hover, focus-visible, active, disabled | pass | `.btn`, `.textlink`, `.nav a`, `.foot a`, `.switch button` each define :hover, :active, :focus-visible (global ring), and [disabled] |
| Every list and table has an empty state | n/a | the only lists are the margin-note list inside a fixed example and the three pricing tiers; neither is data-driven, so no empty state can occur. Noted, not skipped |
| Every async surface has a loading state | n/a | no async surface; the page is static and the format switch is synchronous |
| Every form field has label, hint, error | n/a | no form fields; the trial CTA is a link to `/start` |
| Destructive actions distinct and confirmed | n/a | none |
| Real copy, realistic data, no invented statistics | pass | every number is from the README (40,000; 2.1 million; 60; $0/$6/$12; 3 documents; 14 days). The passage is Thoreau, public domain. The example notes are labelled as examples in the footer |
| Six identity commitments present and consistent | pass | wordmark with note-anchor glyph in header and footer and title; serif display plus system sans; warm paper tokens only; one accent (button, ticks, note numbers, focus, hover); 3px radius and 1px hairlines everywhere, no shadows; functional motion, reduced-motion honoured |
| No horizontal scroll at 390, 768, 1440 | pass | probe scrollWidth equals viewport at all three widths (390x6562, 768x4298, 1440x4193) |
| Long text does not break layout | pass | document subtitle and cross-document link chip truncate with ellipsis and carry `title`; margin notes wrap; tablet render shows both truncations behaving |
| Zero, one, many handled | n/a | no data-driven collections |
| prefers-reduced-motion respected, no infinite animation | pass | media query disables transitions and the one-time leader draw; no loops |
| Token conformance | pass | `check-tokens.sh` PASS after renaming `--margin-w` to `--rail-w` and snapping one 3px offset |

## Rubric (self)

Product fit: 5. The page is composed as an annotated document: a reading column and a running right margin joined by hairline leaders with red ticks, and the hero is a real passage with three live notes that stay attached when the PDF/EPUB/Web switch reflows the text (index-1440-viewport.png, index-1440-state-epub.png, index-1440-state-web.png). Brand-removal test: strip the wordmark and the red and the structure is still a page with a margin, which is only sensible for a margin-notes product.

Hierarchy: 4. At 1440 the eye lands on the two-line serif "Read like you mean it.", drops to the lede, then into the reading sheet, with the trial button sitting in the margin as the first note; at 390 the order is wordmark, eyebrow, H1, lede, button, sheet. The one competitor is the top-bar trial button duplicating the margin button in the same viewport; it is a deliberate redundancy for scroll depth but costs a point.

Typography: 4. Roles are consistent: serif display and passage, sans lede and notes, mono for format and export chrome, uppercase labels for section markers. The scale reads cleanly from 76px display to 11px locators. Minus one because the system fallback (Iowan Old Style) is doing display duty at 76px where a true display serif would carry more character, and the task forbade downloads.

Rhythm: 4. Gaps step from 8/12 inside notes to 24/32 inside groups to 96 between sections, and the only surface on the page is the reading sheet plus the pricing rule set; no cards anywhere (index-1440-full.png). The proof section's figures column outruns the quotes column, leaving a slightly loose bottom edge.

Identity: 5. The running margin is a signature that improves comprehension: section markers, figures, the trial note, and diagrams all sit in the same track with the same leader grammar the app uses for notes, and the hero demonstrates the first differentiator instead of claiming it.

Finish: 4. The most-used component, the format switch plus attached notes, has pressed state, hover, focus ring, a live region announcement, locator updates per format, collision avoidance between notes, and a safe fallback when animations are unavailable (verified by DOM probe after two rounds of fixes). Minus one: the leader lines jump rather than glide when a note is pushed by collision, and the OG image is a rendered still rather than a designed asset.

Total: 26 of 30. No dimension under 4. Result: PASS (self).

## Structural and craft weaknesses

Structural: the pricing block is the only place where the running margin goes quiet; a fourth "what is on each tier" row in the margin would strengthen the signature but would require inventing tier details the README does not give.

Craft: the wordmark glyph (hairline plus red dash) is 8px wide and reads as a stray mark at small sizes; a 10px version with a heavier dash would survive better in the footer.

Most finished: the reading sheet with the format switch and attached notes. Least finished: the "04 Default" toggle diagram, which is correct but visually lighter than its three siblings.

## Rounds

1. Initial render: web-article state drew leaders mid-transition because `max-width` was animated (a layout property). Removed the transition, capped the web measure at 640px.
2. Web-article state still hid the leaders: draw animation left `stroke-dashoffset` at 1 when the animation clock stalled, and `layout()` waited on a double rAF. Made the keyframes own the dash values with fill-mode none, ran `layout()` synchronously, and added a 700ms safety timer that removes the draw class. Verified with a DOM probe: `d` updates, `stroke-dasharray: none`, `stroke-dashoffset: 0`.
3. Hero CTA note raised to align with the H1 cap line; nav and footer links given 8px vertical padding to clear the 24px target minimum; hidden chapter head changed from h4 to p to keep heading order h1 > h2 > h3; every margin aside labelled.

## Secondary gates (public route)

- Accessibility (manual, axe not installed): landmarks header/nav/main/section/aside/footer, one h1, h2 per section, h3 within; skip link; focus ring 2px accent; live region for the format switch; diagrams are `role="img"` with descriptive labels; decorative document chrome is `aria-hidden`. Contrast: fg on bg 14.1, muted on bg 5.3, muted on surface 4.9, paper on accent 5.2, accent on surface 4.8, all above 4.5:1. Hairlines are 1.36:1 and are decorative separators, not the sole boundary of any control (the switch has text labels and a pressed underline).
- Performance: one file, 43 KB HTML, no fonts downloaded, no images, inline SVG only, JS under 4 KB; explicit width and height on every SVG; no layout-shifting assets. Lighthouse not run (no server in this run).
- SEO: unique title and description; canonical; one h1; heading order verified; OG title/description/url/type/site_name/image with width, height and alt; Twitter summary_large_image; JSON-LD SoftwareApplication with three Offers parsed as valid JSON. `og.png` rendered at 1200x630.
- GEO: the lede states what the product is, for whom, and what it does in three sentences; each h3 is a self-contained claim; proof figures and quotes are in plain text.
