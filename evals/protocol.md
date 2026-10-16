# Controlled Evaluation Protocol

Run after stage changes and before release. Tooling checks are not design-outcome evaluations. Never fabricate runs or convert self-scores into independent evidence.

## Matched Runs

1. Freeze fixture commit, prompt, approved assets, skill revision, model/version, host/tools, network availability, time/token budget, and allowed questions. Keep baseline, current, and candidate identical except skill version. Use fresh isolated sessions and separate output directories; baseline must not inherit director instructions or artifacts.
2. Use at least five task types: operational dashboard (S1), form with async failure, public page with factual assets (S13), constrained redesign (S15), and component in real context. Repeat each condition at least three times. Reserve separate unseen briefs as holdouts; do not tune against them.
3. Save artifacts, screenshots at 390/768/1440, state fixtures, action results, errors, time, tokens/cost when reported by host, and unresolved gaps. For expressive/3D conditions include matching recordings or timestamped traces, reduced-motion and renderer-failure paths, lifecycle and frame/input observations. Give both conditions the same capture procedure. Missing measurements are "not measured".
4. Randomize output labels. Two independent judges see only brief, supplied facts, screenshots, matching temporal evidence when applicable, and rubric, not condition, implementation rationale, or self-score. Record both scores and disagreement. Keep objective functional/accessibility checks separate from subjective visual scores.
5. Compare per-task results and spread, not only pooled means: completion/pass rate, task success, accessibility failures, six-dimension taste scores, time, cost, and judge disagreement. Run unseen holdouts only after candidate is frozen. A zero-lint result is rule compliance, not proof of design superiority.
6. Record results in `evals/baseline.md`. State sample size, limitations, baseline parity, and regressions. Claim improvement only for tested conditions; fix functionality/accessibility regressions before promotion.

## Result Record

| Field | Value |
|---|---|
| Scenario / fixture commit / prompt | |
| Condition / skill revision / output label | |
| Model / host / tools / asset and network constraints | |
| Budget / actual elapsed / tokens / cost | |
| Repetition / holdout or development | |
| Functional result / accessibility result | |
| Browser findings / screenshot and state paths | |
| Judge A / judge B six scores and verdicts | |
| Failures / disagreement / next fix | |

## Regression Scenarios

Use S13–S18 in `evals/scenarios.md` for evidence, preservation, and completion-contract failures. Run `python3 scripts/test-tooling.py` and `node scripts/test-browser-check.cjs` for deterministic tooling regressions. These checks do not substitute for fresh-agent evaluation.
