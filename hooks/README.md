# First-Layer Hook

Skills cannot control load order. This hook makes the director the first design authority by having the harness inject an instruction whenever a prompt shows frontend intent.

## Install

Merge `hooks/settings-snippet.json` into `~/.claude/settings.json` (global) or `.claude/settings.json` (project). Adjust the path if the skill is installed somewhere other than `~/.agents/skills`.

Or run:

```bash
./scripts/install.sh --with-hook
```

## Test

```bash
echo '{"prompt":"build the dashboard for this project"}' | bash hooks/frontend-intent-hook.sh
echo '{"prompt":"optimize this postgres query"}' | bash hooks/frontend-intent-hook.sh
```

The first prints the routing instruction. The second prints nothing.

## Tuning

Edit `PATTERN` in the script to add product-specific vocabulary. Keep it a word-boundary regex so "form" does not match "format".
