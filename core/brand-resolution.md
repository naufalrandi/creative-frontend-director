# Stage 3: Resolve Brand

Decide where the visual identity comes from before exploring directions. Resolve in this order and stop at the first match.

1. `DESIGN.md` exists in the repo: it is the direction. Bind its tokens. Skip to Stage 5 unless the user asked to change the identity.
2. The task, attachments, or repo contain a real brand source: a brand guide, a style CSS file, a reference URL, or screenshots. Run Branch A.
3. The user answered "I have a brand spec" or "Match a reference" in Stage 2: ask for the source if missing, then run Branch A.
4. Otherwise run Branch B.

## Branch A: Extract From A Provided Source

Each step is a real tool call. Never guess values from memory.

1. Locate the source. List attached files. For a URL, fetch the page and, if present, `/brand`, `/press`, or `/about`.
2. Pull the styling artifacts: CSS files, theme tokens, brand PDF, screenshots.
3. Extract real values. For CSS, grep hex, rgb, hsl, and oklch values and font-family declarations. For screenshots, read them and record dominant colors and type character.
4. Write `.design/brand-spec.md` from `templates/brand-spec.md`: six core tokens, three font stacks, and three to five posture rules you actually observed.
5. State the system in one sentence in the conversation so the user can redirect cheaply. Example: "Deep navy canvas, one electric accent used only for primary actions, geometric display type with a system body face."

Then continue to Stage 4 with the brand spec as a fixed constraint.

## Branch B: Derive From Product Context

No source exists. Derive identity from the brief: product character, users, domain, and data. This is the normal case for internal tools and new products. Do not emit a second question asking the user to pick a visual style. Proceed to Stage 4 and let the three directions carry the choice.

## Rules

- A provided brand source is a constraint, not a suggestion. Directions in Stage 4 vary structure, density, and navigation within it.
- If the extracted brand is thin, say so in the brand spec under "Gaps" and derive the missing pieces, tagged inferred.
- Never present a guessed brand fact as observed.
