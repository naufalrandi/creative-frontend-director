#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WITH_HOOK=0
TARGET_ROOT="$HOME/.agents/skills"

for arg in "$@"; do
  case "$arg" in
    --with-hook) WITH_HOOK=1 ;;
    *) TARGET_ROOT="$arg" ;;
  esac
done

TARGET_DIR="$TARGET_ROOT/creative-frontend-director"

mkdir -p "$TARGET_ROOT"
rm -rf "$TARGET_DIR"
mkdir -p "$TARGET_DIR"
# Copy everything except local editor state and git metadata.
(cd "$SOURCE_DIR" && LC_ALL=C tar --exclude='./.git' --exclude='./.claude' --exclude='./.design' --exclude='./.github' --exclude='./CLAUDE.md' --exclude='./CONTRIBUTING.md' --exclude='./setup.sh' -cf - .) | (cd "$TARGET_DIR" && LC_ALL=C tar -xf -)
chmod +x "$TARGET_DIR/hooks/frontend-intent-hook.sh" "$TARGET_DIR/scripts/install.sh"

echo "Installed creative-frontend-director to: $TARGET_DIR"

if [ "$WITH_HOOK" -eq 1 ]; then
  SETTINGS="$HOME/.claude/settings.json"
  HOOK_CMD="bash \"$TARGET_DIR/hooks/frontend-intent-hook.sh\""
  mkdir -p "$(dirname "$SETTINGS")"
  [ -f "$SETTINGS" ] || echo '{}' > "$SETTINGS"
  cp "$SETTINGS" "$SETTINGS.bak.$(date +%s)"
  python3 - "$SETTINGS" "$HOOK_CMD" <<'PY'
import json, sys
path, cmd = sys.argv[1], sys.argv[2]
with open(path) as f:
    data = json.load(f)
hooks = data.setdefault("hooks", {})
entries = hooks.setdefault("UserPromptSubmit", [])
already = any(h.get("command") == cmd for e in entries for h in e.get("hooks", []))
if not already:
    entries.append({"hooks": [{"type": "command", "command": cmd}]})
with open(path, "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
print("Hook " + ("already present in " if already else "added to ") + path)
PY
else
  echo "Optional: rerun with --with-hook to install the first-layer routing hook, or merge hooks/settings-snippet.json manually."
fi
echo "Optional: merge AGENTS-SNIPPET.md into your AGENTS.md or CLAUDE.md."
