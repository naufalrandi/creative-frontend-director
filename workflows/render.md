# Stage 8: Render

The taste gate judges pixels. Produce screenshots before scoring. Save them under `.design/screens/` named `<route>-<width>.png`.

## Viewports

| Name | Width | Why |
|---|---|---|
| phone | 390 | dominant mobile width, catches shrunken-desktop layouts |
| tablet | 768 | the breakpoint where most navigation models change |
| desktop | 1440 | common laptop-external monitor width |

Capture full-page height for marketing routes and the first viewport plus one scrolled position for app routes.

## Procedure

1. Reuse the app's reachable managed URL first. If none exists and startup is allowed, read `package.json` scripts and start its dev script in a managed background job. Track that job and wait for its actual URL to answer; never assume port 3000.
2. Capture with whichever is available, in this order:
   - The host's browser tool, if one is enabled: Claude-in-Chrome in Claude Code, `browser_agent` in Gemini CLI, the `browser` toolset in Hermes, a Playwright or agent-browser MCP server elsewhere. Open the route, set each width, screenshot, save.
   - Playwright: `npx playwright screenshot --viewport-size=390,844 --full-page http://localhost:3000/<route> .design/screens/<route>-390.png`, repeated per width.
   - A headless Chrome binary: `chrome --headless --screenshot=<file> --window-size=<w>,<h> <url>`.
3. Read each screenshot back with the file reader so it is actually inspected, not only saved.
4. Wait for font readiness and settled layout. Verify intended fonts actually loaded (not just declared); check failed images, intrinsic dimensions, horizontal overflow, and overlapping or clipped text. Use computed measurements where available; zero automated findings is not visual or WCAG compliance.
5. Scroll screen by screen on long routes, allowing reveals to settle. Inspect readable viewport frames as well as the full-page overview; capture sticky-header collisions and post-reveal clipping. Test reduced motion without losing content. Record any uninspected extent.
6. Reproduce applicable states from the brief's state matrix. Exercise the primary action through its expected result and recovery, not merely a click. Use safe fixtures; never submit a real payment, deletion, or external message as a test.
7. Write evidence in `.design/review.md`: route, viewport, state/fixture, reproduction steps, screenshot path, intended versus loaded fonts, failed images, overflow/clipping, console/runtime errors, primary-action result, and blockers. Findings use `id | severity | evidence | fix`; separate measurements from visual judgment. Unavailable checks are "not run", never PASS.

## Animated And 3D Surfaces

For expressive/immersive contracts, inspect start/mid/end states at all three widths and record a short browser video or reproducible timestamped action trace. Test reduced-motion preference changes, keyboard/touch alternatives, pin entry/exit, pause/resume, missing WebGL/model, context loss, resize, and repeated mount/unmount where applicable. Check cleanup and input responsiveness; record measured frame/timing evidence or "not measured", not assumed FPS. Static screenshots alone do not prove choreography. See `reference/expressive-experiences.md`.

## Portable Measurements

Read `scripts/browser-check.js` and pass its complete expression to the host browser's evaluate operation (or Playwright `page.evaluate(source)`) on the current page after fonts/layout settle and again after scroll reveals. Save returned JSON alongside screenshots. It reports font-face availability, not proof of the font actually used for each glyph; use browser rendered-font inspection for that, or mark verification unavailable. Clipping findings are review candidates, not automatic taste failures. The helper does not capture past console errors, contrast, screenshots, scrolling, or interactions; collect those through the host browser and the procedure above. No browser dependency is installed by this skill.

## Fallback

If no browser path works, list the exact error and attempted paths in the ship report. Record "not scored: render blocked"; static findings may be reported separately, never as a taste score. Implementing workflows stay in progress until inspected renders exist. Do not start a replacement server for an existing app unless requested; use its actual managed URL.

## Component Workflow

Render the component inside a real page that uses it. If none exists yet, create a temporary route or story that places it in realistic context and delete the route afterwards.
