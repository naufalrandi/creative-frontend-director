# First-Layer Routing

Skills cannot control load order. These files make the director the first design authority on each host.

| Host | Mechanism | File | Install |
|---|---|---|---|
| Claude Code | `UserPromptSubmit` hook, harness-enforced | `frontend-intent-hook.sh`, `settings-snippet.json` | `./scripts/install.sh --with-hook`, or merge the snippet into `~/.claude/settings.json` |
| Codex, OpenCode, Copilot CLI, Hermes | instructions file | `../AGENTS-SNIPPET.md` | append to `AGENTS.md` (global `~/.codex/AGENTS.md`, `~/.config/opencode/AGENTS.md`, `~/.hermes/AGENTS.md`, or the project root) |
| Gemini CLI | instructions file | `../AGENTS-SNIPPET.md` | append to `~/.gemini/GEMINI.md` or the project `GEMINI.md` |
| Cursor | always-applied rule | `cursor/creative-frontend-director.mdc` | copy to `.cursor/rules/` in the project |
| Antigravity CLI | none verified | | invoke explicitly with `/creative-frontend-director`, or rely on description matching |

The Claude Code hook is the only mechanism the harness enforces. The others are instructions the model reads, so keep the skill description current too.

## Test The Claude Code Hook

```bash
echo '{"prompt":"build the dashboard for this project"}' | bash hooks/frontend-intent-hook.sh
echo '{"prompt":"optimize this postgres query"}' | bash hooks/frontend-intent-hook.sh
```

The first prints the routing instruction. The second prints nothing.

## Tuning

Edit `PATTERN` in the script to add product-specific vocabulary. Keep it a word-boundary regex so "form" does not match "format".
