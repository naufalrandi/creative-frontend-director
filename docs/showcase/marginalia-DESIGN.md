# Marginalia Design System

> Category: reading and annotation tool, public marketing page
> The page is an annotated document: prose in the column, everything else in a running margin attached by hairline leaders, because the margin is the product.

## 1. Visual Theme

Paper and ink with one red. The page reads like a well-annotated book rather than a software site: a reading column of serif prose, a persistent right margin where section markers, figures, and quotes sit as notes, and hairline leaders that tie each note to its passage. The first screen is the product itself, a real passage with live margin notes, not an illustration of it. Density is spacious in the argument and dense inside the reading view, because a serious tool should look serious. Hierarchy is carried by type size, position (column versus margin), and the single red, never by boxes, shadows, or colour fields. Character: editorial, considered, unhurried, allergic to hype.

Key characteristics:
- one temperature (warm paper), one accent (rubric red), one shape (crisp hairline)
- the margin is structural, not decorative: it carries real information on every section
- the product appears as real HTML in the page, with real text and working notes

## 2. Color

| Token | Value | Role |
|---|---|---|
| --bg | #faf8f3 (oklch 98% 0.006 85) | page background, paper |
| --surface | #f3efe6 (oklch 96% 0.008 85) | the reading sheet, table header band, code-like labels |
| --fg | #2b2620 (oklch 22% 0.02 60) | primary text, ink |
| --muted | #6f665c (oklch 48% 0.015 60) | secondary text, margin notes, metadata |
| --border | #dcd6ca (oklch 88% 0.01 80) | hairlines, leaders, table rules |
| --accent | #b5432c (oklch 52% 0.16 32) | primary action, note anchors and ticks, focus ring, link hover |
| --highlight | #f2e3a6 (oklch 91% 0.09 92) | product semantic only: a highlighted span inside the reading view |
| --ok / --warn / --danger | none used on this page | state only; not needed on a marketing route |

Rules: the accent appears on the primary button, note anchors and their leader ticks, focus rings, and link hover. It never appears as a background fill larger than a button, never in gradients. `--highlight` is not an accent; it is the product's highlighter colour and appears only inside the reading view, never in marketing chrome. Dark mode: no. The product is a paper metaphor and the audience reads on iPad in daylight; a dark theme is a later product decision, not a landing-page one.

## 3. Typography

Faces: display "Source Serif 4", "Iowan Old Style", Georgia, "Times New Roman", serif. Body "Source Sans 3", Inter, system-ui, -apple-system, "Segoe UI", sans-serif. Mono "IBM Plex Mono", ui-monospace, "SF Mono", Menlo, monospace. No font is downloaded; on macOS and iPadOS the display renders in Iowan Old Style, the body in the system sans, the mono in SF Mono, and the pairing holds.

| Role | Size | Weight | Line height | Notes |
|---|---|---|---|---|
| display | clamp(44px, 6.2vw, 84px) | 400 | 1.02 | serif, tracking -0.02em, one line if possible |
| page title | 34px | 400 | 1.15 | serif, tracking -0.01em |
| section title | 26px | 400 | 1.2 | serif |
| object title | 19px | 600 | 1.3 | sans, used for tier names and note titles |
| body (marketing) | 18px | 400 | 1.55 | sans, measure 60 to 68ch |
| body (reading view) | 17px | 400 | 1.6 | serif, measure 62ch, this is the product's reading face |
| label | 12px | 600 | 1 | sans, uppercase, tracking 0.08em |
| metadata / margin note | 13.5px | 400 | 1.45 | sans, muted |
| numeric | 40px figures, 13px table | 400 | 1 | serif for figures, sans tabular-nums in the pricing table |

## 4. Spacing And Grid

Scale: 4, 8, 12, 16, 24, 32, 48, 64, 96, 128 px. Within group: 8 to 16. Between groups: 24 to 48. Between sections: 96 to 128. Content max width: 1200px. Grid at 1440: a 12-column implied grid resolved as two tracks, column 1 (the reading column, minmax(0, 760px)) and column 2 (the margin, 280px), gutter 48px, left aligned inside the 1200 frame. At 768: column 640px, margin 200px, gutter 32px. At 390: one column; margin content stacks under its passage as a ruled list.

## 5. Layout And Composition

The eye enters at the H1, a single line of serif, then drops into the reading view, which is the largest object on the page and sits on a `--surface` sheet defined by a hairline. The margin rail begins at the top bar and runs the full page: every section's marker (a small uppercase label), its figures, and its asides live in the margin, left aligned to the margin's track, attached to the reading column by a 1px leader that ends in an 8px accent tick. Asymmetry is the rule: the composition is always column plus margin, never centred. Nothing is full bleed except the top bar rule and the footer rule. The CTA in the hero sits in the margin beside the H1, as the first note on the page.

## 6. Components

Navigation model: a single top bar with the wordmark, three anchor links (Product, Proof, Pricing) and the trial button. No sticky behaviour; the audience reads, they do not need chrome following them.
Surfaces: only the reading sheet and the pricing table header band may use `--surface`. Marketing sections sit directly on paper with rules between them. No cards.
Shape language: radius 3px, border 1px `--border`, elevation none; separators only. The reading sheet is a hairline, not a shadow.
Controls: primary button is `--accent` fill, paper text, 3px radius, 44px tall. Secondary is a text link with a hairline underline that turns accent on hover. Segmented control (format switch) is three hairline-bordered buttons sharing rules; the selected one has ink text and an accent underline. No destructive actions on this page.

## 7. Motion And Interaction

Functional. Durations: 120ms for hover and focus, 220ms for note reposition and reveal, 400ms for the one-time leader draw when the hero settles. Easing cubic-bezier(0.2, 0.7, 0.2, 1). Animated: leader length and note position when the format switch changes the passage layout, button hover colour. Never animated: text size, page scroll, background. `prefers-reduced-motion: reduce` disables all transitions and the leader draw; notes simply appear in place.

## 8. Voice And Brand

Plain declarative sentences. No exclamation marks, no "supercharge", no "AI-powered". Say what the thing does and stop. Sentence case everywhere except uppercase labels. Terminology: margin note (not comment), passage (not selection), edition, cross-document link, export. The brand appears as the wordmark and the red only.

Wordmark: "Marginalia" set in the display serif at 21px, weight 500, tracking -0.01em, preceded by the note-anchor glyph: an 18px vertical hairline in `--border` with a 6px accent dash at its top, the same mark the leaders use. Browser title carries the same word.

## 9. Anti-patterns

Specific to this product:
- do not put the product inside a floating laptop, iPad, or phone frame; the product is text and is rendered as text
- do not use a gradient hero, a glow, glass, or a coloured hero block; this is paper
- do not lay out features as a three-column icon card grid; features are passages with margin notes
- do not use a highlighter-yellow or pastel palette for the brand; yellow is the product's highlighter and appears only inside the reading view
- do not add "AI" language, sparkles, or magic-wand icons; the product's position is that the reader does the thinking
- do not invent proof: only 40,000 readers, 2.1 million annotations, 60 universities, and the two quotes exist
- do not centre the composition; column plus margin, always
- do not use a script or handwriting face for notes; notes are set in the UI sans

## 10. Product Signature

The running margin. Every section of the page has a margin track, and every item in it is attached to its passage by a hairline leader ending in an accent tick, the same grammar the app uses to anchor a note to a passage. In the hero, the signature is demonstrated rather than described: the passage can be switched between a PDF page layout and an EPUB reflow, the line breaks change, and the notes stay attached to their passages. Removing the margin would make the page harder to scan, because section markers, figures, and asides would fall back into the column and compete with the argument.

## Identity Commitments

1. Wordmark treatment: "Marginalia" in the display serif, 21px, weight 500, tracking -0.01em, preceded by the note-anchor glyph (18px hairline with a 6px `--accent` dash at the top). Same treatment in the top bar, footer, and browser title.
2. Type pairing: display "Source Serif 4", "Iowan Old Style", Georgia, "Times New Roman", serif; body "Source Sans 3", Inter, system-ui, -apple-system, "Segoe UI", sans-serif; mono "IBM Plex Mono", ui-monospace, "SF Mono", Menlo, monospace. No downloads; the fallback pairing (Iowan Old Style or Georgia plus the system sans) holds the personality.
3. Palette temperature: warm paper. --bg #faf8f3, --surface #f3efe6, --fg #2b2620, --muted #6f665c, --border #dcd6ca, --accent #b5432c. Every neutral sits on hue 60 to 85.
4. Accent budget: one accent, rubric red #b5432c. Allowed on the primary button, note anchors and leader ticks, focus rings, and link hover. Maximum 6 accent instances per 1440x900 viewport, where the set of note anchors inside the reading view counts as one instance.
5. Shape language: crisp. Radius 3px on controls and the reading sheet, 1px hairline borders in --border, elevation none, separators only.
6. Motion attitude: functional. 120ms hover, 220ms reposition, 400ms one-time leader draw, easing cubic-bezier(0.2, 0.7, 0.2, 1), everything off under reduced motion.

## Evidence

| Decision | Evidence |
|---|---|
| Product, users, features, pricing, proof, quotes | observed (README) |
| Static single-file HTML, system fonts, inline SVG only | provided (task) plus observed (README stack) |
| Warm paper temperature | inferred (identity-kits: read for long stretches, editorial) |
| Rubric red accent | inferred (domain: rubrication is the historical ink of marginal notes; avoids highlighter yellow which reads as generic) |
| Editorial serif display, sans body | inferred (identity-kits editorial row, text-first audience) |
| Spacious marketing density, dense reading view | inferred (clarify default: text-first experts, marketing surface) |
| Running margin signature | inferred (product-signature: the information structure users think in) |
| Edition switch in hero | inferred (first differentiator is "notes stay attached across editions and formats"; a demonstration beats a claim for a skeptical audience) |
| Public-domain passage: Thoreau, Walden, "Reading" | inferred (needs a real passage about reading, out of copyright) |
| No dark mode | inferred (paper metaphor, marketing route) |
