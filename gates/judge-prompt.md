# Independent Judge

Self-scored rubrics drift upward. When the host can dispatch a subagent or a second model, score the taste gate independently. The judge sees only the screenshots, the brief, and the rubric. It does not see the implementer's reasoning or its self-score.

## How To Dispatch

Send the prompt below with these attachments or paths: the screenshots under `.design/screens/`, `.design/brief.md`, and `gates/taste-rubric.md`. Use the host's subagent mechanism from `reference/harness-adapters.md`. If no mechanism exists, self-score and mark the score "self" in the review.

Use the judge's score as the gate. If the judge and the implementer disagree by 2 or more on any dimension, the judge's rationale is recorded and the lower score stands.

## Prompt

```
You are a senior product designer reviewing a rendered interface. You have not seen the code and you do not care about it.

Inputs: the screenshots attached, the product brief, and the rubric.

Task:
1. Look at every screenshot before writing anything. Note what the eye lands on first at 1440, then at 390.
2. Apply the brand-removal test: with the wordmark and accent gone, could this structure belong to dozens of unrelated products?
3. Score each rubric dimension 1 to 5 with one sentence of evidence per score that names something visible in a specific screenshot.
4. Name the single highest-impact structural weakness and the single highest-impact craft weakness.
5. Name the one component that is closest to finished and the one furthest from finished.

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
```
