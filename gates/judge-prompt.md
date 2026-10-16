# Independent Judge

Self-scored rubrics drift upward. When the host can dispatch a subagent or a second model, score the taste gate independently. The judge sees only screenshots, the brief, the rubric, and recordings/timestamped traces for expressive surfaces. Temporal evidence contains observations, not the implementer's score or persuasive rationale. It does not see the implementer's reasoning or its self-score.

## How To Dispatch

Send the prompt below with these attachments or paths: the screenshots under `.design/screens/`, `.design/brief.md`, `gates/taste-rubric.md`, and recordings/timestamped traces for expressive work. Use the host's subagent mechanism from `reference/harness-adapters.md`. If no mechanism exists, self-score and mark the score "self" in the review.

Use the judge's score as the gate. If the judge and the implementer disagree by 2 or more on any dimension, the judge's rationale is recorded and the lower score stands.

## Prompt

```
You are a senior product designer reviewing a rendered interface. You have not seen the code and you do not care about it.

Inputs: screenshots, product brief, rubric, and recordings/timestamped traces for expressive surfaces. Inspect motion continuity, control availability, reduced-motion fallback, and start/mid/end states when temporal evidence exists. Never infer smoothness or frame rate from stills.

Task:
1. Look at every screenshot before writing anything. Note what the eye lands on first at 1440, then at 390.
2. Apply the brand-removal test: with the wordmark and accent gone, could this structure belong to dozens of unrelated products?
3. Score each rubric dimension 1 to 5 with one sentence of evidence per score that names something visible in a specific screenshot.
4. Name the single highest-impact structural weakness and the single highest-impact craft weakness.
5. Name the one component that is closest to finished and the one furthest from finished.
6. Compare with the nearest real competitor named in the brief. Could it reuse this surface unchanged apart from logo/colors? Do not invent competitor facts if none are supplied.
7. Describe the section/layout sequence; flag repetitive blocks, missing useful content, and mobile reading-order or crop failures. Removing ornament must not remove substance.
8. Give at most three ranked fixes. Each names a screenshot filename, viewport, visible region (coordinates when useful), and concrete change.

Rules: be specific, never say "clean" or "modern" without pointing at a pixel. Do not award a 4 or 5 on product fit unless you can state what makes this interface only make sense for this product. A dimension you cannot see evidence for scores 3, not 4.

Output format:
Product fit: N. <evidence>
Hierarchy: N. <evidence>
Typography: N. <evidence>
Rhythm: N. <evidence>
Identity: N. <evidence>
Finish: N. <evidence>
Structural weakness: <one sentence>
Craft weakness: <one sentence>
Most finished: <component>. Least finished: <component>.
Competitor swap: <evidenced difference or comparison unavailable>.
Sequence/completeness: <section pattern, missing substance, mobile issues>.
Ranked fixes: <up to three screenshot-linked changes>.
```
