# Skill Hardening Evidence — 2026-10-16

Scope derived from source audit and user request to implement fixes. No checkpoint commits created. No new runtime dependencies; Python 3 standard library powers installation/token lint, Node standard library powers browser-helper unit checks.

## Guarantees And Actual Results

| Behavior | Check | Evidence |
|---|---|---|
| Source cannot be removed by self/ancestor/nested or parent-symlink installation | `python3 scripts/test-tooling.py` | Initial RED: 14 tests, 9 failures and 1 error inside disposable copies. Final parent run: 17 tests PASS. |
| Existing installation survives copy failure and failed publication; failed restoration retains backup | Same suite | Includes injected copy/publish/restore failures and competing nonempty destination. Reviewer reproduced backup loss before correction. |
| Existing symlink installs support link-to-link and link-to-copy | Same suite | Reviewer reproduced failure before fix; regression now passes. |
| Filenames with spaces, per-match colors, multi-value spacing, token utilities, scoped exceptions, CLI validation | Same suite | Initial failures fixed. Reviewer reproduced custom-property/HTML-attribute bypass; regression now passes. |
| Shell scripts parse | `bash -n scripts/install.sh scripts/check-tokens.sh scripts/update-manifest.sh` | PASS, parent run exit 0. |
| Entrypoint metadata and frontend/non-frontend hook routing | Python assertions over frontmatter and two hook subprocesses | PASS; frontmatter 686 characters, description starts Use when; frontend prompt emits routing, backend prompt emits nothing. |
| Completion rules distinguish failure, review, extraction, missing widths, and round limits | Independent fresh-agent S16 review | Initial contradictions found and corrected; second independent review resolved nine cases consistently. Recorded in `evals/baseline.md`. |
| Browser evidence collector | `node scripts/test-browser-check.cjs` and `node --check scripts/browser-check.js` | RED: missing helper file; GREEN: 8 mock-DOM assertions PASS and syntax PASS. Checks overflow, pending fonts, failed image, clipping candidate, and honest unmeasured glyph-font status. |
| Real browser compatibility | Headless local Chrome `--dump-dom` on temporary fixture with embedded helper | PASS: actual overflow and clipped paragraph detected. No dependency installed. Not a visual-design or accessibility certification. |
| Full package install | Installer subprocess into disposable temporary directory | PASS: entrypoint, asset rules, protocol, and tooling test present; docs excluded as intended. No global installation changed. |
| Diff whitespace | `git diff --check` | PASS. |

## Expressive Experience Enhancement

Added content-led layout/choreography guidance, GSAP/Motion/Three.js property ownership, reduced-motion/renderer fallbacks, lifecycle cleanup, and temporal review evidence. Official GSAP matchMedia, Motion accessibility, and current Three.js renderer/disposal docs checked; Context7 tools unavailable, so direct official sources used. Added S19–S21 specifications. Existing 17 tooling tests and 8 browser-helper assertions rerun PASS; guide included in 50-file manifest and disposable install; reference/frontmatter/whitespace checks PASS. No GSAP/Three/Motion demo application or frame-rate benchmark was run.

## Limits

No coverage percentage measured. Tests exercise safety and representative heuristic boundaries, not full CSS/JS parsing. S16 is instruction-compliance evaluation, not a rendered product evaluation. New S13–S21 scenarios and the paired/holdout protocol are specifications; no paired visual-quality, accessibility, time, or cost improvement is claimed. Existing showcase scores remain historical and unverified. No upstream code was vendored.
