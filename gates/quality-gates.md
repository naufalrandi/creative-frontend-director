# Stage 10: Secondary Quality Gates

Apply only after the taste gate passes. These layers improve implementation without flattening the direction. After any change here, re-render and confirm the design did not regress.

## Route Branching

| Route type | Gates |
|---|---|
| public, indexable | accessibility, performance, Lighthouse, SEO, GEO, visual regression check |
| private, authenticated | accessibility, performance, Lighthouse; add `noindex` |

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
