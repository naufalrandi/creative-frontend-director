# Implementation Recipes

Load in Stage 7. Generated interfaces fail production for three reasons: hardcoded values that ignore tokens, inconsistent repeated components, and non-semantic markup. These recipes prevent all three.

## Tokens First

Every value in `DESIGN.md` becomes a token before any component is written. One source, consumed everywhere.

Plain CSS:

```css
:root {
  --bg: ...; --surface: ...; --fg: ...; --muted: ...; --border: ...; --accent: ...;
  --space-1: 4px; --space-2: 8px; --space-3: 12px; --space-4: 16px; --space-6: 24px; --space-8: 32px; --space-12: 48px;
  --radius: 6px; --text-sm: 0.8125rem; --text-base: 0.875rem; --text-lg: 1rem; --text-xl: 1.375rem;
}
```

Tailwind v4: put the same values in `@theme { --color-bg: ...; --spacing-1: 4px; }` and use only theme classes. No arbitrary values like `p-[13px]` or `text-[#333]`.

Component libraries: override the library's theme layer with the tokens. Never restyle individual instances.

`scripts/check-tokens.sh` fails the build when a hex, rgb, or off-scale spacing value appears outside the token file.

## Semantic Skeleton

```html
<header>   wordmark, primary navigation, session context
<main>     one h1, sections with h2, the page's job
  <nav aria-label="Sections">   contextual sub-navigation when present
  <section aria-labelledby="...">
<aside aria-label="...">   rail content: bays, activity, related
<footer>   only on public routes
```

Tables are `<table>` with `<th scope="col">`. Lists of objects are `<ul>` or `<ol>`. Actions are `<button>`. Links navigate. Icons inside controls have `aria-hidden` and the control has a text label or `aria-label`.

## One Component, Many Instances

Write each repeated element once as a component or a class with modifiers, then instantiate. Forms are the usual failure: define one field pattern with label, control, hint, and error slots, and use it for every field. A form where two fields differ in spacing is a defect.

```html
<div class="field">
  <label for="reg">Registration</label>
  <input id="reg" name="reg" autocomplete="off" aria-describedby="reg-hint reg-err">
  <p id="reg-hint" class="hint">Format AB12 CDE</p>
  <p id="reg-err" class="error" role="alert" hidden>Enter a valid registration</p>
</div>
```

## States Are Part Of The Component

Every component ships with its states in the same file: default, hover, focus-visible, active, disabled, loading, error, empty, selected where applicable. A component without states is half a component.

## Content And Data

Write real copy before layout. Product name, real navigation labels, realistic records with plausible values, dates that make sense together, names from one region. No lorem ipsum, no "Feature One", no invented statistics. When a fact is unknown, use an honest placeholder: a labeled grey block or a dash.

Seed data lives in one place, is deterministic, and is large enough to show density: 40 rows for a table, 6 to 8 items for a list, at least one long value to test wrapping.

## Responsive Mechanics

Container queries for components, media queries for page layout. Fluid type with `clamp()` between the phone and desktop sizes from `DESIGN.md`. No horizontal scroll at 390, 768, 1440. Tables collapse to a stacked pattern or scroll inside their own container with a visible edge.

## Files

Small files by feature: tokens, layout shell, one file per component, one file per page. No inline styles except dynamic values bound to data. No `!important` outside the reduced-motion rule.
