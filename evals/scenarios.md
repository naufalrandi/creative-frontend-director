# Evals

Each scenario is runnable: a fixture, a prompt, the expected behavior, and space for the baseline (no skill) and treatment (with skill) observations. Run baselines with a fresh subagent that does not have the skill loaded. Record verbatim rationalizations in `evals/baseline.md`.

## Trigger Evals

Should trigger: build the dashboard for this project; implement the user management page; create a landing page for this product; redesign this settings page; redesign the whole frontend; make this page look better; this UI looks ugly and generic, fix it; make the frontend less AI-generated; improve this onboarding flow; build a responsive admin panel; review the visual quality of this page; polish the application UI; create the pricing page; build a date range picker component; extract a design system from our current app.

Should not trigger alone: optimize this PostgreSQL query; fix the Dockerfile; create a Terraform VPC; refactor this Python parser; debug a Redis connection; write a shell backup script; format this JSON.

## Behavioral Scenarios

### S1 Anti-slop dashboard
Fixture: empty Vite React app with a `README.md` describing a fleet-maintenance tool for depot mechanics.
Prompt: "Build the main dashboard."
Expected: brief written with mechanics as users, dense direction chosen, no KPI card row, no sidebar unless justified in `DESIGN.md`, rubric score recorded, screenshots at three widths.
Fail signals: four stat cards, purple accent, cards inside cards, no `DESIGN.md`.

### S2 Context adaptation
Fixture: two READMEs, a children's reading app and a treasury settlement console.
Prompt: "Build the home screen." run once per fixture.
Expected: the two `DESIGN.md` files differ in density, navigation, typography, and signature. Identical structure is a fail.

### S3 Existing identity preserved
Fixture: app with an existing `DESIGN.md` and tokens, and one weak page.
Prompt: "Make the reports page better."
Expected: improve-existing workflow, no clarification question, `DESIGN.md` unchanged, tokens reused, rubric before and after.

### S4 Question-first materiality
Fixture: bare repo with only `package.json`.
Prompt: "Create the landing page."
Expected: exactly one AskUserQuestion call with at most 4 questions including brand context, recommended option first, then no further questions. Defaults report at ship time.

### S5 Skip when sufficient
Fixture: repo with `DESIGN.md`, PRD, and routes.
Prompt: "Add the invoices list page."
Expected: no question asked. Brief cites observed evidence.

### S6 Brand extraction
Fixture: repo plus an attached `brand.css` with real hex values and a font-face.
Prompt: "Redesign the app to match our brand, see brand.css."
Expected: `.design/brand-spec.md` with values grepped from the file, none invented, one-sentence statement in the conversation.

### S7 Render gate holds
Fixture: app whose dev server fails to start.
Prompt: "Polish the settings page."
Expected: report exact render failure and "not scored: render blocked". No code-based taste score and no completion claim.

### S8 Sibling skill collision
Fixture: session with `frontend-design` and `ui-ux-pro-max` also available.
Prompt: "Build the pricing page."
Expected: director stages run first, at most one taste specialist invoked, `DESIGN.md` governs conflicts.

### S9 Asset ladder
Fixture: app needing an empty-state illustration and a favicon, no image provider configured.
Prompt: "Add the empty state for the projects list."
Expected: authored SVG using `DESIGN.md` tokens, no raster attempt, ship report lists the rung.

### S10 Secondary gates do not flatten
Fixture: a public page that passed the taste gate.
Prompt: "Get Lighthouse to 95."
Expected: implementation fixes only, re-render after, screenshots compared, no removed design elements.

### S11 Host portability
Fixture: the S1 fixture.
Prompt: "Build the main dashboard." run in a host without AskUserQuestion, Skill tool, or a browser tool (for example Codex or OpenCode).
Expected: clarify falls back to numbered prose or a tagged default, specialists are read from SKILL.md or skipped with a note, render falls back to Playwright or headless Chrome, the same `.design/` artifacts and `DESIGN.md` are written. No invented tool calls.

### S12 Finish and identity commitment
Fixture: the S1 fixture.
Prompt: "Build the main dashboard."
Expected: `DESIGN.md` states all six identity commitments with concrete values and does not default to Inter plus slate without a reason; every interactive element has hover, focus-visible, active, disabled; empty and loading states exist; seed data is realistic with at least one long value; `scripts/check-tokens.sh` passes; the review records a Finish score and who scored it.
Fail signals: lorem ipsum or "Item 1", a control without focus-visible, a raw hex outside the token block, a self-score where a judge was available.

### S13 Factual assets and public proof
Fixture: bookstore brief naming two actual books, approved cover URLs with permission evidence, one CC BY atmospheric image, no generation provider. One testimonial claim lacks evidence.
Prompt: "Build our bookstore landing page."
Expected: correct covers or explicit missing assets; archive image never presented as store premises; local assets, provenance and visible required credit; claim/proof map before layout; unsupported testimonial omitted. Network failure produces honest gaps, not invented proof.

### S14 Scroll and state evidence
Fixture: list page with deterministic empty/error/long-title data, delayed reveal below fold, one broken image, and unavailable custom font.
Prompt: "Polish this list page."
Expected: state matrix, input-preserving recovery, primary-action result, readable scroll frames, failed-image/font evidence and fixes. Saving only initial screenshots or treating declared font as verified is failure.

### S15 Redesign invariants
Fixture: settings form with deep link, fixed field names/order, consent text, analytics event, permission guard, and mock submission endpoint.
Prompt: "Redesign settings without changing behavior."
Expected: invariants written before changes and checked after; keyboard submit and mock rejection preserve input. No changed route, consent, event, permissions, or submission contract without approval.

### S16 Completion boundaries
Fixture: rubric scores 5/4/4/4/4/3, separate all-4 case, separate failed render, and extraction-only task.
Prompt: "Review completion against the skill rules."
Expected: first REFINE, all-4 PASS only with P0 clear, failed render not scored/in progress, extraction completes from observed/inferred source rules and tokens without requiring new renders. Three exhausted correction rounds never become PASS.

### S17 Accessibility blocks taste
Fixture: visually polished modal with keyboard trap and primary button below contrast minimum.
Prompt: "Finish this modal."
Expected: open P0, Finish capped at 2, keyboard/focus and contrast fixed before completion. No attractive screenshot can override failure.

### S18 Product specificity and substance
Fixture: public service page with supplied facts and nearest competitor reference, repeated stock sections, and missing service detail.
Prompt: "Make this page less generic."
Expected: competitor-swap test grounded in reference, useful details retained, varied composition follows content rather than quotas; judge gives at most three screenshot-linked concrete fixes.

### S19 Coordinated expressive experience
Fixture: React public product page with approved copy, real product model/poster, and GSAP, Three.js, Motion installed. Existing simple header/CTA works with keyboard.
Prompt: "Make the layout cinematic and interactive. Combine GSAP storytelling, Three.js product exploration, and Motion UI."
Expected: static responsive composition first; section 7 records purpose/trigger/target/property/owner/timing/fallback. Motion owns DOM controls, GSAP owns narrative progress, Three owns one canvas/render loop. Separate wrappers/properties prevent competing writes. Working product interaction, not generic particles; scoped cleanup, no per-frame React state; primary action stays immediate. Temporal evidence at 390/768/1440 plus measured or explicitly unmeasured performance.
Fail signals: importing all engines without roles, same-transform writers, library count mistaken for beauty, static output labeled animated, inaccessible canvas-only controls, no cleanup.

### S20 Motion and renderer fallback
Fixture: S19 with reduced motion enabled then changed live; WebGL 2 unavailable, model request failure, context loss, touch-only input, and hidden-tab/offscreen transitions exercised separately.
Prompt: "Verify cinematic experience stays usable across these conditions."
Expected: no camera flight/parallax/pinning in reduced mode, full content remains in normal flow; usable poster/DOM fallback, keyboard/touch/non-drag controls; pause/stop where required, loops pause offscreen/hidden; owned resources/observers/listeners dispose across repeated mount/unmount. Failures block completion, not hidden by taste score.

### S21 Restrained task versus expressive brief
Fixture: treasury form with existing identity and no animation libraries; separate creative portfolio brief explicitly requests motion.
Prompt: "Improve this UI and make interaction feel polished."
Expected: treasury preserves efficient task flow with native feedback, no unsolicited WebGL/engine stack. Portfolio receives content-led varied composition and purposeful visible choreography when brief calls for it. One taste authority; engineering guidance may combine without replacing direction.

## Evaluation Procedure

Use `evals/protocol.md` for matched conditions, repeated runs, blind independent judging, holdouts, and separate functional/accessibility/cost measures. Record actual runs in `evals/baseline.md`; scenarios alone are not evidence of improvement.
