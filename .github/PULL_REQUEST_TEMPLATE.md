## Summary

Brief description of the changes and why they improve creative-frontend-director.

## Type of Change

- [ ] Bug fix (non-breaking change fixing an issue)
- [ ] Enhancement (non-breaking change adding capability)
- [ ] Breaking change (fix or feature that would cause existing behavior to change)
- [ ] Documentation update

## Which Files Changed

- `core/` (stage files)
- `gates/` (rubric or quality gates)
- `workflows/` (routing or stage order)
- `templates/` (output templates)
- `hooks/` (first-layer routing)
- `SKILL.md` (entry point)
- Other: _______

## Eval Run

**Required:** Which scenario from `evals/scenarios.md` did you run?

- [ ] S1: Anti-slop dashboard
- [ ] S2: Context adaptation
- [ ] S3: Existing identity preserved
- [ ] S4: Question-first materiality
- [ ] S5: Skip when sufficient
- [ ] S6: Brand extraction
- [ ] S7: Render gate holds
- [ ] S8: Sibling skill collision
- [ ] S9: Asset ladder
- [ ] S10: Secondary gates do not flatten
- [ ] Other: _______

**Baseline Observation:**
_Copy the baseline behavior from evals/baseline.md or describe what the agent did without your change._

**Treatment Observation:**
_Describe what happened after your change. Did it improve or regress?_

**Verdict:**
_Did your change improve the outcome? Record the full row you added to evals/baseline.md._

## Checklist

- [ ] I have read the [CONTRIBUTING.md](CONTRIBUTING.md) guide
- [ ] I ran an eval scenario and updated `evals/baseline.md`
- [ ] I verified installation with `./setup.sh /tmp/test-install`
- [ ] If adding a stage file, it is referenced in SKILL.md or workflows/workflows.md
- [ ] If adding a file, I updated manifest.json file list
- [ ] If modifying SKILL.md, I verified the frontmatter stays under 1024 characters and the description stays trigger-only
- [ ] I used conventional commit format: `type: description`
- [ ] My changes follow the skill's own no-slop principles

## Additional Notes

Any edge cases, known limitations, or follow-up work needed?
