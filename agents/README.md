# Isolated Director Agents

Optional. Each file is the same director prompt in a host's agent format. Install only the one for your host.

| Host | File | Install to |
|---|---|---|
| Claude Code | `frontend-director.md` | `~/.claude/agents/` or `.claude/agents/` |
| Hermes Agent | `frontend-director.md` | `~/.hermes/agents/` |
| OpenCode | `opencode/frontend-director.md` | `~/.config/opencode/agents/` or `.opencode/agents/` |
| Codex CLI (0.145+, `multi_agent = true`) | `codex/frontend-director.toml` | `~/.codex/agents/` |
| Gemini CLI | none needed | `invoke_agent` with `generalist` and the body of `frontend-director.md` as the prompt |
| Antigravity CLI | none needed | `invoke_subagent` `self` with the body of `frontend-director.md` as the prompt |

`./scripts/install.sh --agent <host>` copies the matching agent file when that host has an agents directory.
