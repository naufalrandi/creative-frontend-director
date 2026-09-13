# Harness Adapters

Stage files name actions, not host tools. Map each action to the host you are running in. Where a host lacks a capability, use the fallback in the last column. Never invent a tool call.

## Where The Skill Lives

| Host | Global skills directory | Project skills directory | Invoke |
|---|---|---|---|
| Claude Code | `~/.claude/skills/`, also reads `~/.agents/skills/` | `.claude/skills/`, `.agents/skills/` | Skill tool, or auto by description |
| Codex CLI and IDE | `~/.agents/skills/` | `.agents/skills/` at repo root or cwd | `$creative-frontend-director`, or auto by description |
| OpenCode | `~/.config/opencode/skills/`, `~/.claude/skills/`, `~/.agents/skills/` | `.opencode/skills/`, `.claude/skills/`, `.agents/skills/` | `skill` tool, or auto by description |
| Antigravity CLI (`agy`) | `~/.gemini/antigravity-cli/skills/` | `.agents/skills/` | `/creative-frontend-director` slash command, or auto |
| Gemini CLI | `~/.gemini/skills/`, `~/.agents/skills/` | `.agents/skills/` | `activate_skill`, or auto |
| Cursor | `~/.cursor/skills/` | `.cursor/skills/`, `.agents/skills/` | auto by description |
| GitHub Copilot CLI | `~/.copilot/skills/`, `~/.agents/skills/` | `.github/skills/`, `.claude/skills/`, `.agents/skills/` | `/skills`, or auto |
| Hermes Agent | `~/.hermes/skills/` | `.hermes/skills/`, `.agents/skills/` after `hermes skills trust` | `skill_view("creative-frontend-director")` |
| Any other host | wherever it reads `SKILL.md` | | read `SKILL.md` directly with the file tool |

`./scripts/install.sh --agent <host>` installs to the right global directory. `--all` installs to every host detected on the machine. `--agent project` installs to `.agents/skills/` in the current repo, which every host above reads.

## Action Mapping

| Action in the stage files | Claude Code | Codex | OpenCode | Antigravity CLI | Gemini CLI | Cursor | Copilot CLI | Hermes | Fallback |
|---|---|---|---|---|---|---|---|---|---|
| Ask the user (Stage 2) | `AskUserQuestion` | prose | prose | prose | `ask_user` | prose | prose | prose | numbered questions in prose with the recommended default marked, then stop the turn |
| Invoke a specialist skill (Stage 5) | Skill tool | `$name` mention or read its SKILL.md | `skill` tool | `/name` | `activate_skill` | read its SKILL.md | `/skills` | `skill_view` | read the specialist's `SKILL.md` with the file tool |
| Render a screenshot (Stage 8) | Claude-in-Chrome, else Playwright, else headless Chrome | Playwright or headless Chrome | Playwright or headless Chrome | browser tool if enabled, else Playwright | `browser_agent` if enabled, else Playwright | Playwright or headless Chrome | Playwright or headless Chrome | `browser` toolset if enabled, else Playwright | provisional score, task stays open, see `workflows/render.md` |
| Dispatch an isolated director (optional) | `frontend-director` subagent | `spawn_agent` with `agent_type` from `agents/codex/` | `@frontend-director` from `agents/opencode/` | `invoke_subagent` `self` | `invoke_agent` `generalist` with the agent body as prompt | none | none | `delegate_task` | run the stages inline |
| First-layer routing | `UserPromptSubmit` hook in `hooks/` | `AGENTS.md` snippet | `AGENTS.md` snippet | explicit `/creative-frontend-director` or description match | `GEMINI.md` snippet | `hooks/cursor/` rule file | `AGENTS.md` or `copilot-instructions.md` snippet | `AGENTS.md` or `SOUL.md` snippet | description match only |
| Task tracking | `TodoWrite` | `update_plan` | `todowrite` | task artifact | `write_todos` | plan | plan | `todo` | a checklist in `.design/plan.md` |

## Rules For Any Host

- Written artifacts are the contract. `DESIGN.md` and the `.design/` folder work identically everywhere, so a direction locked in one host is readable by another.
- If a stage names a tool the host does not have, use the fallback column. Do not stop the workflow and do not pretend the tool ran.
- The specialist registry in `core/specialist-router.md` names skills from one ecosystem. On a host without them, skip the specialist, note it in the ship report, and continue with `reference/design-reference.md`.
- The Claude Code hook is the only harness-enforced routing. Everywhere else, routing depends on the instructions file snippet and on the description in `SKILL.md`, so keep both current.
