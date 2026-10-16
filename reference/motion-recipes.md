# Motion Recipes

Load in Stage 7 when `DESIGN.md` section 7 allows motion. Motion communicates state, continuity, hierarchy, spatial relationship, feedback, and intentional brand storytelling. For expressive layouts, GSAP, Motion, or Three.js combinations, also read `reference/expressive-experiences.md`. These recipes are quiet-mode starting points, not ceilings on an explicitly expressive brief.

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
```

Prefer `transform` and `opacity`; color transitions are fine, while shadows/filters need paint-cost measurement. Avoid per-frame layout-property changes; use measured layout transitions only when they preserve continuity without jank. Three.js camera/model changes follow the separate canvas budget. Place reduced-motion overrides after animation rules so the cascade cannot re-enable them.

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

Quiet mode uses one orchestrated primary-region reveal. Expressive mode can choreograph meaningful section beats from its experience contract; do not stagger every element or repeatedly replay entrances.

```css
@keyframes rise { from { opacity: 0; transform: translateY(6px); } to { opacity: 1; transform: none; } }
.reveal > * { animation: rise var(--dur-3) var(--ease-out) both; }
.reveal > :nth-child(2) { animation-delay: 40ms; }
.reveal > :nth-child(3) { animation-delay: 80ms; }
```

Quiet-mode starting budget: five children and 200 ms total stagger. Expressive sequences define timing in the experience contract and keep controls available. Ambient loops need a real purpose, pause offscreen/hidden, and offer pause/stop/hide when required; reduced motion shows a stable state.

## Panels, Drawers, Dialogs

Enter with opacity plus a small transform from the edge they belong to. Exit faster than they enter. Keep the backdrop at one opacity value from the tokens.

```css
.drawer { transform: translateX(100%); transition: transform var(--dur-3) var(--ease-out); }
.drawer[data-open] { transform: none; }
```

## State Changes In Data

When a row changes state, transition its color, not its position, unless the list is explicitly ordered by that state. When a number changes, change it immediately and pulse the container once with `--dur-2`. Counting animations are decoration.

## Scroll-Driven Effects

Use native sticky, supported CSS scroll timelines, or IntersectionObserver for simple reveals; use GSAP ScrollTrigger for coordinated narratives when justified. Marketing storytelling may be expressive; application scroll effects must aid the actual task. Parallax/pinning need written purpose, native-scroll preservation, mobile recomposition, and static/reduced-motion fallbacks. Read `reference/expressive-experiences.md` for engine ownership and cleanup.

## Loading

Skeletons match the final layout's shape and rhythm. A single shimmer at `--dur-3` times four, opacity 0.5 to 0.8. Spinners only for actions under two seconds.

## Reduced Motion Overrides (After Animated Rules)

```css
@media (prefers-reduced-motion: reduce) {
  .reveal > * { animation: none; opacity: 1; transform: none; }
  .button, .drawer { transition: none; }
}
```

For JS timelines/canvas, also react to preference changes and present stable final content; CSS alone cannot stop GSAP or a render loop.
