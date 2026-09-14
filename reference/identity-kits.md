# Identity Kits

Load in Stage 4 after the direction is picked. The best generated interfaces commit to one identity completely: a name treatment, a type pairing with personality, a palette with one temperature, one shape language, one motion attitude. Half-committed identity reads as a template.

These kits are starting points keyed to product character. Adapt values to the product. Never ship a kit verbatim, and never combine two kits.

## Commit Rule

Before implementing, `DESIGN.md` must state all six, each with a concrete value:

1. Wordmark treatment: how the product name is set, even if there is no logo.
2. Type pairing: display face, body face, mono face, with fallbacks that hold the same personality.
3. Palette temperature: warm, cool, or neutral, with the six core tokens.
4. Accent budget: one accent, where it may appear, maximum times per viewport.
5. Shape language: one radius, one border weight, one elevation policy.
6. Motion attitude: functional or expressive, with one duration scale.

## Type Pairings By Character

Free faces first, system fallbacks second. The pairing must survive the fallback.

| Character | Display | Body | Mono | Notes |
|---|---|---|---|---|
| calm, precise, operational | Geist, Inter Tight, or system-ui at 600 | same family at 400 | JetBrains Mono, ui-monospace | one family is the deliberate utility choice, identity comes from mono numerals and density |
| editorial, considered | Fraunces, Source Serif 4, Georgia | Inter, Source Sans 3, system-ui | IBM Plex Mono | serif display sized modestly, generous measure |
| warm, human, consumer | Bricolage Grotesque, Nunito Sans at 700 | Nunito Sans, system-ui | ui-monospace | rounded terminals pair with a larger radius |
| technical, confident | Space Grotesk, IBM Plex Sans at 600 | IBM Plex Sans, system-ui | IBM Plex Mono | tight tracking on display, tabular numerals everywhere |
| premium, quiet | Cormorant Garamond, Playfair Display at 500 | Inter, Helvetica Neue | ui-monospace | very few weights, large whitespace, restrained accent |
| playful, energetic | Outfit, Sora at 700 | Outfit, system-ui | ui-monospace | bolder scale contrast, expressive motion allowed |
| industrial, raw | Archivo Black, Barlow Condensed | Barlow, Arial | Courier Prime | uppercase display, hard edges, no shadows |
| institutional, trustworthy | Public Sans, Libre Franklin at 600 | Public Sans, system-ui | ui-monospace | high contrast, conservative scale, strong focus rings |

Avoid Inter plus slate as a reflex. It is the one pairing every default produces. Use it only when the operational row is the right call and say so in `DESIGN.md`.

## Palette Temperatures

| Temperature | Canvas | Ink | Use when |
|---|---|---|---|
| warm paper | oklch(98% 0.005 85) | oklch(22% 0.02 60) | consumer, editorial, workshop, hospitality, anything read for long stretches |
| cool slate | oklch(98% 0.004 250) | oklch(20% 0.02 250) | operations, finance, infrastructure, developer tools |
| neutral ink | oklch(99% 0 0) | oklch(15% 0 0) | premium, institutional, photography-led surfaces |
| deep canvas (dark) | oklch(16% 0.01 250) | oklch(95% 0.005 250) | monitoring rooms, media, creative tools, only when the environment justifies it |

Pick one temperature and keep every neutral on it. Mixed temperatures are the most common sign of an assembled palette. The accent is derived from brand or domain meaning, never from the temperature table.

## Shape And Elevation Presets

| Language | Radius | Border | Elevation |
|---|---|---|---|
| crisp | 2 to 4 px | 1 px hairline | none, separators only |
| soft | 8 to 12 px | 1 px | one shadow level for floating surfaces only |
| pill | 999 px on controls, 16 px on surfaces | none | one shadow level |
| hard | 0 | 2 px | offset block shadow |

One language per product. Controls, inputs, cards, and dialogs share it.

## Wordmark Without A Logo

Set the product name in the display face at label size with tight tracking, or in the mono face in uppercase with wide tracking. Pair it with one glyph only if the product signature supplies one. A wordmark treated consistently in the top bar, the browser title, and the ship report is identity enough.
