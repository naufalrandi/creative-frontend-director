# Creative Frontend Director

A project-aware, anti-slop creative frontend skill that makes a coding agent behave like a principal product designer and creative director. It discovers the product, asks at most once, locks a written direction in `DESIGN.md`, routes at most one specialist, renders, and gates completion on a scored taste rubric.

## Why This Skill

Agents trained on web design defaults tend to generate generic UIs: stat card grids, sidebar layouts, pill badges, decorative elements. This skill redirects the agent to reason about the **specific product, its users, and its workflows first**, then design the frontend that could only belong to that product. It writes down the direction, scores the result against a taste rubric, and gates completion on quality.

## Quick Start

```bash
git clone https://github.com/naufalrandi/creative-frontend-director.git
cd creative-frontend-director
./setup.sh                    # Install to ~/.agents/skills
./setup.sh --with-hook        # Also merge first-layer hook
```

Then use it in Claude Code:
```bash
claude    # Loads AGENTS.md snippet or hook automatically
```

Trigger it with natural prompts: *"build the dashboard"*, *"redesign this page"*, *"make the UI less generic"*.

## Priority

1. understand the project deeply
2. beautiful, original, product-specific frontend
3. no generic AI-generated design
4. coherent visual identity, written down
5. excellent UX

Secondary: responsive design, accessibility. Bonus: performance, Core Web Vitals, Lighthouse, SEO, GEO.

## Layout

```
SKILL.md                  entry point, authority stack, router, stages, hard rules
core/                     one file per stage 1 to 6
reference/                design reference for implementation
gates/                    taste rubric and secondary quality gates
workflows/                stage matrix per workflow, render procedure
templates/                DESIGN.md, design read, brand spec, design contract
hooks/                    first-layer UserPromptSubmit hook
agents/                   optional isolated subagent definition
evals/                    runnable scenarios and baseline log
```

Written outputs in the target project: `DESIGN.md` at the root and a `.design/` folder with the brief, directions, brand spec, review, and screenshots.

## Install

```bash
./scripts/install.sh                 # ~/.agents/skills
./scripts/install.sh --with-hook     # also merges the first-layer hook into ~/.claude/settings.json
./scripts/install.sh /path/to/dir    # custom skills directory
```

Project-local: `./scripts/install.sh .agents/skills`.

## First-Layer Routing

Skills cannot control load order. Two mechanisms make the director run first:

1. The hook in `hooks/` injects a routing instruction whenever a prompt shows frontend intent. Strongest option.
2. `AGENTS-SNIPPET.md` merged into your `AGENTS.md` or `CLAUDE.md`. Weaker, costs nothing.

For full isolation, register `agents/frontend-director.md` as a subagent and delegate design tasks to it.

## Working With Sibling Skills

Other design skills may load on the same prompts. The director treats them as executors of the direction it writes. `core/specialist-router.md` holds the registry and the one-taste-specialist rule. Recommended companions: `frontend-patterns` and a framework skill for implementation, `frontend-a11y`, `browser-qa`, and `click-path-audit` for quality, `dataviz` for charts.

## Typical Prompts

`build the dashboard`, `implement user management`, `redesign this page`, `redesign the whole frontend`, `make this UI look better`, `make this less AI-generated`, `build a date picker component`, `extract a design system from the current app`.

## Evals

`evals/scenarios.md` lists runnable scenarios. Run each baseline without the skill, record rationalizations in `evals/baseline.md`, then run with the skill and compare.

## Compatibility

**Primary:** Claude Code (reads `SKILL.md` frontmatter, supports `.agents/skills` and hook system).

**Compatible harnesses:** Any AI agent harness that:
- Loads skill markdown from `~/.agents/skills/{name}/SKILL.md`
- Supports `AskUserQuestion` and `Skill` tool references
- Respects `.claude/settings.json` hooks (UserPromptSubmit)

For harnesses without hook or Skill tool support, `AskUserQuestion` and inline Skill routing degrade to prose fallbacks (see `core/clarify.md`).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for:
- How to propose stage changes
- Eval run requirement
- Frontmatter size limits
- Conventional commit format

## License

MIT License. See [LICENSE](LICENSE) for full text.

---

**More details:** See [CLAUDE.md](CLAUDE.md) for contributor setup and architecture.
