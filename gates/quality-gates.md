# Stage 10: Secondary Quality Gates

Accessibility basics constrain implementation from discovery and block at the craft P0 gate. Run the comprehensive audits below after the taste gate passes; they improve implementation without flattening direction. After changes, re-render and confirm no regression.

## Route Branching

| Route type | Gates |
|---|---|
| public, indexable | accessibility, performance, Lighthouse, SEO, GEO, visual regression check |
| private, authenticated | accessibility, performance, Lighthouse; add `noindex` |

## Token Conformance

Run before the comprehensive audits. Unexplained raw colors, off-scale spacing, and literal arbitrary utilities outside declared token sources cause drift. Token-based inline styles are allowed; review dynamic and non-px values separately. Follow the project's tokens and scale rather than imposing this checker's defaults.

```bash
./scripts/check-tokens.sh src
```

Prefer existing tokens or the project's declared scale (`--scale`). The checker is a source heuristic, not a CSS parser. A necessary exception must name the check and a specific reason on the preceding standalone comment as documented in `scripts/check-tokens.sh`; record its audit output in the review. Never blanket-hide files or treat exceptions as evidence of correctness.

## Accessibility

Target WCAG 2.2 Level AA.

- Contrast: 4.5:1 for body text, 3:1 for large text and UI components.
- Keyboard: every interactive element reachable and operable, visible focus ring, no traps.
- Targets: 24 by 24 CSS px minimum, 44 by 44 for primary mobile actions.
- Semantics: landmarks, heading order, labels tied to inputs, error text associated with fields, live regions for async state.
- Motion: honor `prefers-reduced-motion`.

Check with axe against the running app:

```bash
npx @axe-core/cli http://localhost:3000/<route> --exit
```

## Performance

Fix implementation inefficiency first. Never remove meaningful design to chase a score.

- Core Web Vitals targets: LCP under 2.5 s, INP under 200 ms, CLS under 0.1.
- Budgets: initial JS under 200 KB gzipped for apps, under 100 KB for marketing pages; one or two font families with subset weights; hero image under 200 KB.
- Techniques: route and component splitting, defer non-critical JS, `font-display: swap` with size-adjusted fallbacks, responsive images with explicit dimensions, lazy loading below the fold, priority on the LCP image, preconnect only for real third parties.

## Lighthouse

Run after the visual direction is stable:

```bash
npx lighthouse http://localhost:3000/<route> --preset=desktop --output=json --output-path=.design/lighthouse.json --chrome-flags="--headless"
```

Targets: performance 90+ for apps and 95+ for simple public pages, accessibility 95+, best practices 95+, SEO 95+ on public routes. Investigate LCP, CLS, render-blocking resources, image and font payload, unused code, main-thread cost, and third-party impact.

## SEO

Public routes only.

- unique useful title and meta description per route
- canonical, robots, sitemap inclusion
- one h1, logical heading order, semantic HTML
- crawlable internal links, meaningful alt text
- Open Graph and Twitter card metadata with a real image
- valid structured data where a type genuinely applies

Verify the rendered head:

```bash
curl -s http://localhost:3000/<route> | grep -Ei '<title|name="description"|rel="canonical"|property="og:|application/ld\+json'
```

Never keyword-stuff headings, add filler, dump FAQs, invent ratings or claims, or degrade brand voice.

## GEO

AI discoverability for important public content is clarity, not tricks. Make it easy for a reader or model to state what the product is, who it is for, what it does, its major capabilities, how concepts relate, and its factual claims with evidence. Prefer descriptive headings, self-contained explanations, comparison tables when genuinely useful, and current information. No AI-targeted filler or fake citations.

## Final Check

Re-run Stage 8 at the three viewports. Compare against the pre-optimization screenshots. Any visual regression is fixed before shipping.
