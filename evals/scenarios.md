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
Expected: the agent reports the render failure, marks the score provisional, and does not claim completion.

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
