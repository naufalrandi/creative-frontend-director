# Creative Frontend Director

**Version:** 4.0.0 | **Stack:** Agent Skill (Markdown + Bash) | **License:** MIT

## What

An agent skill package for Claude Code and compatible harnesses that makes coding agents behave like principal product designers. It discovers the product context, locks a written design direction in `DESIGN.md`, routes to at most one specialist skill, renders screenshots, and gates completion on a scored taste rubric.

## Quick Start

```bash
./setup.sh                         # Installs to ~/.agents/skills
./setup.sh --with-hook             # Also merges first-layer routing hook
./setup.sh ~/.agents/skills        # Custom installation path
```

## Commands

### Installation & Testing

```bash
# Install (copies to ~/.agents/skills/creative-frontend-director)
./scripts/install.sh
./scripts/install.sh --with-hook   # Also merge hook into ~/.claude/settings.json

# Test hook (returns routing instruction for frontend prompts)
echo '{"prompt":"build the dashboard"}' | bash hooks/frontend-intent-hook.sh

# Dry-run install to verify files
./scripts/install.sh /tmp/test-install
```

### Development

```bash
# Edit SKILL.md (frontmatter must stay under 1024 characters; body about 600 words)
nano SKILL.md

# Edit a stage file (e.g., core/project-discovery.md)
# After editing: verify referenced from SKILL.md or workflows/workflows.md
nano core/project-discovery.md

# Regenerate manifest.json file list (after adding/removing files)
./scripts/update-manifest.sh
```

## Architecture

```
SKILL.md                      Entry point; authority stack, router, 11 stages
core/                         Stage files 1-6: discovery → specialist routing
  ├── project-discovery.md    (Stage 1)
  ├── clarify.md              (Stage 2)
  ├── brand-resolution.md     (Stage 3)
  ├── creative-reasoning.md   (Stage 4 support)
  ├── design-direction.md     (Stage 4)
  ├── specialist-router.md    (Stage 5)
  └── ...
reference/                    Design reference, identity kits, motion and implementation recipes, harness adapters
gates/                        Taste rubric, craft checklist, judge prompt (Stage 9), quality gates (Stage 10)
workflows/                    Router logic and render procedure
templates/                    Output templates (DESIGN.md, brand-spec, etc.)
hooks/                        UserPromptSubmit hook for first-layer routing
agents/                       Optional subagent for full isolation
evals/                        Test scenarios and baseline log
scripts/install.sh            Bootstrap installer (also runs with --with-hook)
manifest.json                 Package metadata and file registry
```

Flow: Frontend prompt → hook or AGENTS.md snippet routes → SKILL.md → router chooses workflow → stages 1-11 execute → outputs written to target project (.design/, DESIGN.md).

## Key Files

```
SKILL.md                   11-stage workflow definition; hard rules; authority stack
core/project-discovery.md  Analyze README, codebase, existing design for brief
core/clarify.md           Ask user at most once (≤4 questions) if needed
core/specialist-router.md  Route to one taste specialist (frontend-patterns, dataviz, etc.)
core/design-direction.md  Create written direction in DESIGN.md (required artifact)
gates/taste-rubric.md     Score the final UI on nine dimensions (≥3/5 per dimension)
workflows/workflows.md     Stage matrix for each workflow type (greenfield, redesign, etc.)
scripts/install.sh         Bash installer; handles --with-hook to merge settings
hooks/frontend-intent-hook.sh  Detects frontend intent, injects routing instruction
templates/DESIGN.md        Template for project design direction document
```

## Configuration

No environment variables or .env required. The skill operates on the target project's source and metadata (README, package.json, existing DESIGN.md, code).

Hook installation:

| Step | File | Action |
|------|------|--------|
| 1 | `.claude/settings.json` (project) or `~/.claude/settings.json` (global) | Add hook entry under `hooks.UserPromptSubmit` |
| 2 | `hooks/frontend-intent-hook.sh` | Must be executable and in `$PATH` or absolute |
| 3 | `PATTERN` in hook script | Regex for frontend keywords (edit to add product vocabulary) |

## Editing Workflow

### 1. Modify a stage file

Edit `core/creative-reasoning.md`, `gates/taste-rubric.md`, etc. freely. When done:
- Verify it is listed in `SKILL.md` stage matrix (lines 43-56)
- Or verify it is referenced from `workflows/workflows.md` or `templates/`
- Run a full eval (see Testing below)

### 2. Edit SKILL.md safely

Keep the YAML frontmatter block **under 1024 characters** (currently 534). Frontmatter must be valid YAML in `---` delimiters. After editing:
```bash
# Verify frontmatter: name and description
head -4 SKILL.md
# Verify YAML parses
python3 -c "import yaml; yaml.safe_load(open('SKILL.md'))" && echo "Valid YAML"
# Recount characters
wc -c SKILL.md
```

### 3. Add a new stage or template

1. Create the file (e.g., `core/new-stage.md`)
2. Add to `SKILL.md` stage matrix or reference from `workflows/workflows.md`
3. Regenerate `manifest.json` file list (see commands above)
4. Run eval: `./setup.sh /tmp/x` then test with `evals/scenarios.md`

### 4. Update workflows

Edit `workflows/workflows.md` to change which stages run for which request type (greenfield, redesign, etc.). Update stage matrix in `SKILL.md` to match.

## Testing

### Verify Installation

```bash
# Dry run to /tmp (no changes to ~/.agents)
./scripts/install.sh /tmp/test-install

# Verify all files present
ls /tmp/test-install/creative-frontend-director/SKILL.md
ls /tmp/test-install/creative-frontend-director/core/project-discovery.md
```

### Test Hook

```bash
# Should print a routing instruction (because prompt has "dashboard")
echo '{"prompt":"build the dashboard"}' | bash hooks/frontend-intent-hook.sh

# Should print nothing (backend-only request)
echo '{"prompt":"optimize postgres query"}' | bash hooks/frontend-intent-hook.sh
```

### Run Evals

Baselines must be recorded in `evals/baseline.md` before each release:

```bash
# Read scenarios in evals/scenarios.md
# Pick one (e.g., S1: anti-slop dashboard)

# Baseline: Run without skill (comment out hook, or use fresh session)
# Prompt: "Build the main dashboard."
# Record behavior and artifacts in evals/baseline.md

# Treatment: Load skill, same prompt
# Compare: Did treatment produce all 11 stages? DESIGN.md? Taste score?

# Verdict column: note differences
```

After each eval, update `evals/baseline.md` with a new row. This log proves the skill's behavior.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). In brief:
- Stage edits require an eval run recorded in `evals/baseline.md`
- SKILL.md frontmatter ≤1024 chars; description starts with "Use when" and lists triggers only, never the workflow
- Conventional commits: `type: description` (feat, fix, refactor, docs, test, chore, perf)
- All new stage files must be referenced in SKILL.md or workflows/workflows.md
- Regenerate manifest.json files array when adding/removing files

## License

MIT — see [LICENSE](LICENSE)
