# Expressive Layout, Motion, And 3D

Load in Stage 4 when the brief requests cinematic, immersive, playful, animated, GSAP, Three.js, or Motion experiences; revisit in Stage 7. This is a coordinated capability, not a requirement to install three libraries. Existing brand and product direction remain authoritative.

## Compose Before Choreographing

Start with the brief's content/proof map and a complete static, responsive composition. Explore structurally different candidates: editorial type-led opening, immersive product stage, asymmetric story split, comparison workspace, image-led narrative. Choose by subject, task, and actual assets—not random novelty. Do not turn operational screens into marketing showcases.

Write the section sequence as layout words plus purpose: `product stage → annotated detail → comparison → proof → action`. Change scale, alignment, media treatment, and density when meaning changes; repeated peers may share structure. Avoid identical feature blocks and alternating splits by reflex. Bento cells follow content relationships; no filler tiles. Mobile gets its own reading order, touch controls, and legible media crops.

Use Taste Skill as a public-page taste reference: subject-specific visual idea, real content before markup, useful interactive demonstration, layout rhythm, and screenshot-led critique. Do not import universal font/color bans, photo/motion quotas, fake proof, or a second rubric. Record the inspected upstream revision; installed skill names/versions may differ from current repository default.

## Experience Contract In DESIGN.md Section 7

Choose `quiet`, `expressive`, or `immersive` from the brief. Explicit requests for animation should produce observable, purposeful motion—not a static page labeled animated. For each major beat record:

`region | user/story purpose | trigger | animated target/property | owner | timing/spring | mobile behavior | reduced-motion/static fallback | verification`

Make one focal moment carry identity; supporting transitions share the same timing and spatial language. This is a hierarchy, not a fixed effect quota. Demonstrations must use actual content and respond meaningfully to input. Primary actions remain immediately available, never delayed behind a reveal.

## Pick Roles, Not A Mandatory Stack

| Need | First choice | Escalate when |
|---|---|---|
| hover, press, simple reveal | CSS / Web Animations API | coordinated state or gesture needs justify library |
| React state, gesture, shared-element/layout continuity | Motion (`motion/react` for installed modern package) | imperative scene sequencing is clearer in GSAP |
| authored timeline, SVG choreography, scroll narrative | GSAP; ScrollTrigger only when scroll owns progress | spatial object/exploration needs a 3D renderer |
| real spatial scene, model inspection, lighting/material story | Three.js isolated canvas | use static image/SVG if depth adds no meaning |

Inspect package files and current official docs before imports. Reuse installed engines; install only selected packages with the target project's package manager. Do not migrate frameworks or add React Three Fiber merely for one scene. Motion also has JS/Vue APIs; do not force React onto another stack.

## Combining GSAP + Three.js + Motion

They may coexist in one page/component tree. The boundary is ownership: **one writer per target property**, not one library per tree. Example: Motion owns DOM navigation/controls, GSAP owns narrative progress, Three.js owns canvas rendering and camera/model transforms. GSAP may drive a plain progress object consumed by the renderer; do not also tween that camera from another engine. If GSAP moves a wrapper, Motion animates a distinct child. Avoid shared `transform`, opacity, scroll position, and competing render loops.

React continuous input uses refs/Motion values, not per-frame state updates. Keep SSR HTML deterministic; client-only canvas/library initialization happens after mount. Scope selectors to each instance. GSAP uses context/matchMedia cleanup; React may use installed `@gsap/react` or scoped context in an effect. Revert local timelines/triggers on unmount or media changes, never kill unrelated global triggers. Motion and legacy `framer-motion` imports must not be mixed.

## Interaction And Safety

- Normal scrolling remains native. Pinning/scrubbing explains something; no trapped scroll, forced smooth-scroll dependency, or excessive blank travel. Refresh measurements after fonts/media settle. Mobile and reduced-motion paths remove pinning/parallax and preserve full content in document flow.
- Hover effects have keyboard/focus and touch equivalents. Drag/3D orbit has buttons or other non-drag controls; no precision-gesture-only task. Keep semantic headings, copy, controls, and text alternatives in DOM; decorative canvas is non-interactive and hidden from assistive technology.
- Reduced motion changes choreography, not just duration: disable spatial travel, auto-rotation, camera flights and scroll scrubbing; show final content or static poster. Respond if preference changes while page is open.
- Auto-moving content continuing beyond five seconds alongside other content has pause/stop/hide controls unless essential. Pause ambient loops offscreen and on hidden tabs; resume without jumps. No flashing effects. Loading does not grant permission for distracting motion.
- WebGL initialization failure, unsupported renderer, model-load error, or context loss exposes usable static fallback and preserves primary task. Lazy-load optional scenes after critical content; reserve canvas dimensions. Prefer render-on-demand when scene is idle, cap pixel ratio by measured device budget, reduce geometry/textures/effects before sacrificing responsiveness.
- Check WebGL 2 support before creating current Three.js WebGLRenderer; feature checks do not replace initialization/error handling. One render-loop owner per canvas: use `renderer.setAnimationLoop(callback)` for continuous rendering and `renderer.setAnimationLoop(null)` to stop; use explicit invalidation for idle scenes. Dispose owned geometries, materials, textures, render targets, controls, renderer, listeners and observers on teardown; material disposal does not dispose textures. Shared resources stay alive until their owner releases them. Test repeated mount/unmount and resize.

## Proof Before Shipping

Inspect 390/768/1440 at start, mid-animation, and settled state. Capture scroll-pin entry/exit, keyboard and touch action, reduced-motion mode, pause/resume, missing WebGL/assets, and repeated mount/unmount. Record timing/frame observations and input responsiveness on representative mobile hardware or explicitly label emulation; do not claim 60 FPS without measurement. Static screenshots cannot prove motion: add a short recording or reproducible timestamped interaction trace to the review. Existing taste rubric remains the only visual score; lifecycle/accessibility failures block completion.

## Sources

- [GSAP matchMedia and automatic reversion](https://gsap.com/docs/v3/GSAP/gsap.matchMedia()/)
- [GSAP React integration](https://gsap.com/resources/React/)
- [Motion accessibility](https://motion.dev/docs/react-accessibility)
- [Three.js renderer and animation loop](https://threejs.org/docs/pages/WebGLRenderer.html)
- [Three.js disposal guide](https://raw.githubusercontent.com/mrdoob/three.js/dev/manual/pages/how-to-dispose-of-objects.html)
- [Three.js capability check](https://raw.githubusercontent.com/mrdoob/three.js/dev/manual/pages/webgl-compatibility-check.html)
- [Taste Skill inspected default](https://github.com/Leonxlnx/taste-skill/blob/f624f37a8c650b9cc550253104925efe4c8de246/skills/taste-skill/SKILL.md)

Verify version-specific APIs against current official docs; these sources inform implementation, never override project constraints.
