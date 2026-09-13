---
name: Bug Report
about: Report a problem with the creative-frontend-director skill
title: "[BUG] "
labels: bug
assignees: ''

---

## Description

A clear and concise description of what the bug is.

## Steps to Reproduce

1. Installation: `./setup.sh` (or `./setup.sh --with-hook`)
2. Triggered with prompt: "..."
3. Observed behavior: ...

## Expected Behavior

What should have happened?

## Screenshots / Artifacts

If applicable, attach:
- `.design/brief.md` (what was inferred)
- `.design/directions.md` (which direction was chosen)
- `.design/review.md` (the rubric score and failing dimensions)
- `.design/screens/*.png` (rendered screenshots, if applicable)
- Paste key log output or error messages

## Environment

- Claude Code version (or harness name if using a compatible agent)
- Installation method: `./setup.sh` or `./setup.sh --with-hook`
- Target project type: (React app, Vue app, Next.js, etc.)
- Scenario triggered: (greenfield, redesign-page, component, etc.)

## Possible Root Cause

If you have a hypothesis, share it. For example:
- Stage file not found
- Hook not firing
- Missing context in brief
- Rubric score below threshold
- Render step failed

## Additional Context

Add any other context about the bug here (log excerpts, project README snippet, etc.).
