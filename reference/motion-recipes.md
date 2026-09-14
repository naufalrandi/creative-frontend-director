# Motion Recipes

Load in Stage 7 when `DESIGN.md` section 7 allows motion. Motion communicates state, continuity, hierarchy, spatial relationship, and feedback. Every recipe here has a job. Decoration is not a job.

## Duration And Easing Scale

```css
:root {
  --dur-1: 120ms;   /* hover, press, toggle */
  --dur-2: 200ms;   /* reveal, menu, tooltip */
  --dur-3: 320ms;   /* panel, drawer, page section */
  --ease-out: cubic-bezier(0.2, 0, 0, 1);
  --ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
  --ease-spring: cubic-bezier(0.34, 1.3, 0.64, 1);
}
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after { animation-duration: 1ms !important; transition-duration: 1ms !important; }
}
```

Animate only `transform`, `opacity`, `color`, `background-color`, `border-color`, `box-shadow`. Never animate layout properties.

## Interaction Feedback

```css
.button { transition: background-color var(--dur-1) var(--ease-out), transform var(--dur-1) var(--ease-out); }
.button:hover { background-color: var(--accent-hover); }
.button:active { transform: translateY(1px); }
.button:focus-visible { outline: 2px solid var(--accent); outline-offset: 2px; }
.row { transition: background-color var(--dur-1) var(--ease-out); }
.row:hover { background-color: var(--surface); }
```

Every interactive element has hover, active, focus-visible, and disabled treatments. Hover never carries meaning alone.

## Reveal On Load, Once

One orchestrated reveal per page at most. Stagger the primary region, not every element.

```css
@keyframes rise { from { opacity: 0; transform: translateY(6px); } to { opacity: 1; transform: none; } }
.reveal > * { animation: rise var(--dur-3) var(--ease-out) both; }
.reveal > :nth-child(2) { animation-delay: 40ms; }
.reveal > :nth-child(3) { animation-delay: 80ms; }
```

Cap staggers at five children and 200 ms total. Infinite loops are forbidden outside loading indicators.

## Panels, Drawers, Dialogs

Enter with opacity plus a small transform from the edge they belong to. Exit faster than they enter. Keep the backdrop at one opacity value from the tokens.

```css
.drawer { transform: translateX(100%); transition: transform var(--dur-3) var(--ease-out); }
.drawer[data-open] { transform: none; }
```

## State Changes In Data

When a row changes state, transition its color, not its position, unless the list is explicitly ordered by that state. When a number changes, change it immediately and pulse the container once with `--dur-2`. Counting animations are decoration.

## Scroll-Driven Effects

Allowed on marketing surfaces only, one effect per page, with a static fallback. Use CSS scroll-driven animations or an IntersectionObserver that adds a class once. Parallax and pinned horizontal scroll require a written product reason in `DESIGN.md`.

## Loading

Skeletons match the final layout's shape and rhythm. A single shimmer at `--dur-3` times four, opacity 0.5 to 0.8. Spinners only for actions under two seconds.
