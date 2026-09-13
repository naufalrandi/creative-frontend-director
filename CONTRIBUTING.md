# Contributing

Thank you for contributing to creative-frontend-director. This guide covers how to propose changes safely.

## Proposing a Change

Creative Frontend Director is a multi-stage workflow skill. Changes to stage behavior, the rubric, or routing must be tested before merging.

### 1. Identify the File

- **Stage behavior** → Edit file in `core/` (stages 1-6) or `workflows/`
- **Taste rubric** → Edit `gates/taste-rubric.md` (stage 9)
- **Quality gates** → Edit `gates/quality-gates.md` (stage 10)
- **Skill entry point** → Edit `SKILL.md` (frontmatter under 1024 characters, body about 600 words)

### 2. Add New Files

If you create a new stage file or template:
1. Write the markdown file
2. Add it to `SKILL.md` stage matrix (lines 43-56) or reference from `workflows/workflows.md`
3. Regenerate `manifest.json` file list:
   ```bash
   ./scripts/update-manifest.sh
   ```

### 3. SKILL.md Frontmatter

The frontmatter is critical. Keep it valid and under size limits:

```
---
name: creative-frontend-director
description: Use when...
---
```

Rules:
- **Frontmatter size:** ≤1024 characters (currently 534)
- **Name:** No spaces, lowercase
- **Description:** Starts with "Use when" and lists triggering requests only. Never summarize the workflow; agents follow the summary instead of reading the body.

Verify:
```bash
# Check YAML validity
python3 -c "import yaml; yaml.safe_load(open('SKILL.md'))" && echo "Valid"

# Count characters
awk 'NR>1 && /^---$/{exit} NR>1{print}' SKILL.md | wc -c
```

### 4. Run an Eval

Before opening a PR, run at least one scenario from `evals/scenarios.md`:

```bash
# Pick a scenario (e.g., S1: Anti-slop dashboard)
# Read the fixture, prompt, and expected behavior

# Baseline: Run without your change (use a fresh session or disable the skill)
# Record verbatim agent reasoning in evals/baseline.md

# Treatment: Apply your change, rerun same prompt
# Compare behavior in evals/baseline.md

# Update evals/baseline.md with a new row
# Verdict: Did your change improve or regress the outcome?
```

After running the eval, commit the baseline.md update together with your changes.

### 5. Commit

Use conventional commit format:

```
type: description

optional body explaining why
```

Allowed types:
- `feat:` New stage file, new routing decision, new rubric dimension
- `fix:` Incorrect behavior in a stage, wrong scoring
- `refactor:` Restructure existing logic without changing behavior
- `docs:` Update templates, README, CLAUDE.md (no logic change)
- `test:` Update eval scenarios or baseline
- `chore:` Dependencies, metadata, housekeeping
- `perf:` Improve agent response time or token cost
- `ci:` Hook or installation scripts

Example:
```
feat: add secondary brand extraction stage

Adds core/brand-extraction.md and routes to it in create-page
workflow when README mentions brand or brand.css is present.

Run S6 eval (brand extraction): agent identified hex values,
font-face, and single statement without inventing tokens.
Baseline shows agent attempted to invent colors; treatment
grepped from provided file only. Verdict: correctly gatekeeps
invention.
```

## Testing Your Change

### Dry-Run Installation

```bash
./setup.sh /tmp/test-install
# Verify file is present:
ls /tmp/test-install/creative-frontend-director/core/your-new-file.md
```

### Hook Testing

If you modify `hooks/frontend-intent-hook.sh`:

```bash
# Should trigger (frontend keyword)
echo '{"prompt":"build the dashboard"}' | bash hooks/frontend-intent-hook.sh

# Should not trigger (backend)
echo '{"prompt":"optimize postgres"}' | bash hooks/frontend-intent-hook.sh

# Should trigger (tuned keyword)
echo '{"prompt":"improve the navigation"}' | bash hooks/frontend-intent-hook.sh
```

### Eval Scenarios

Use `evals/scenarios.md`:
- **S1**: Anti-slop dashboard
- **S2**: Context adaptation
- **S3**: Existing identity preserved
- **S4**: Question-first materiality
- **S5**: Skip when sufficient
- **S6**: Brand extraction
- **S7**: Render gate holds
- **S8**: Sibling skill collision
- **S9**: Asset ladder
- **S10**: Secondary gates do not flatten

## Code Style

- **Markdown:** Clear, short paragraphs. Prefer lists. Code blocks for examples.
- **No hardcoding:** Keep stage files generic (parametrize for the target project).
- **Reference templates:** Use `templates/` for output structure, not inline.
- **Avoid slop:** Follow the skill's own rules (no generic UI patterns in examples).

## Submitting a Pull Request

1. Fork the repository
2. Create a feature branch: `git checkout -b feat/your-change`
3. Make your change and run an eval
4. Update `evals/baseline.md` with the eval result
5. Commit: `git commit -am "feat: description"`
6. Push: `git push origin feat/your-change`
7. Open a PR with a clear description of what changed and which eval you ran

PR template will ask: **Which scenario did you run?** Include the Verdict from `evals/baseline.md`.

## Releasing

Maintainers only:

1. Update version in `manifest.json`
2. Update `AGENTS-SNIPPET.md` if needed
3. Ensure all evals from the current cycle are in `evals/baseline.md`
4. Create a git tag: `git tag -a vX.Y.Z -m "Release version X.Y.Z"`
5. Push: `git push origin vX.Y.Z`

## Questions?

- Check [CLAUDE.md](CLAUDE.md) for contributor setup
- Review existing stage files for patterns
- Read [SKILL.md](SKILL.md) for the complete workflow definition

Thank you for improving creative-frontend-director!
