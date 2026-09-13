#!/usr/bin/env bash
# Install creative-frontend-director into one or more agent hosts.
#
#   ./scripts/install.sh                      # ~/.agents/skills (read by most hosts)
#   ./scripts/install.sh --agent agy          # one host preset (see --list)
#   ./scripts/install.sh --agent agy --agent cursor
#   ./scripts/install.sh --all                # every host detected, one copy per host, no duplicates
#   ./scripts/install.sh --link               # symlink instead of copy
#   ./scripts/install.sh --with-hook          # Claude Code: merge the routing hook into settings.json
#   ./scripts/install.sh /custom/skills/dir   # explicit skills directory
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILL=creative-frontend-director
WITH_HOOK=0
LINK=0
ALL=0
AGENTS=()
CUSTOM_ROOT=""

# preset name -> global skills directory
preset_dir() {
  case "$1" in
    agents|default)   echo "$HOME/.agents/skills" ;;
    claude|claude-code) echo "$HOME/.claude/skills" ;;
    codex)            echo "$HOME/.agents/skills" ;;
    opencode)         echo "$HOME/.config/opencode/skills" ;;
    agy|antigravity)  echo "$HOME/.gemini/antigravity-cli/skills" ;;
    gemini)           echo "$HOME/.gemini/skills" ;;
    cursor)           echo "$HOME/.cursor/skills" ;;
    copilot)          echo "$HOME/.copilot/skills" ;;
    hermes)           echo "$HOME/.hermes/skills" ;;
    project)          echo "$PWD/.agents/skills" ;;
    *) return 1 ;;
  esac
}

# preset name -> marker that shows the host is present on this machine
preset_marker() {
  case "$1" in
    claude)     echo "$HOME/.claude" ;;
    codex)      echo "$HOME/.codex" ;;
    opencode)   echo "$HOME/.config/opencode" ;;
    agy)        echo "$HOME/.gemini/antigravity-cli" ;;
    gemini)     echo "$HOME/.gemini" ;;
    cursor)     echo "$HOME/.cursor" ;;
    copilot)    echo "$HOME/.copilot" ;;
    hermes)     echo "$HOME/.hermes" ;;
  esac
}

# preset name -> agents directory and agent file to copy, if the host has one
preset_agent() {
  case "$1" in
    claude)   echo "$HOME/.claude/agents|agents/frontend-director.md" ;;
    hermes)   echo "$HOME/.hermes/agents|agents/frontend-director.md" ;;
    opencode) echo "$HOME/.config/opencode/agents|agents/opencode/frontend-director.md" ;;
    codex)    echo "$HOME/.codex/agents|agents/codex/frontend-director.toml" ;;
    *) echo "" ;;
  esac
}

list_presets() {
  echo "Presets (--agent NAME):"
  for p in agents claude codex opencode agy gemini cursor copilot hermes project; do
    dir="$(preset_dir "$p")"
    marker="$(preset_marker "$p")"
    state=""
    if [ -n "$marker" ]; then
      [ -e "$marker" ] && state="detected" || state="not detected"
    fi
    printf '  %-9s %-45s %s\n' "$p" "$dir" "$state"
  done
}

install_to() {
  local root="$1" target="$root/$SKILL"
  mkdir -p "$root"
  rm -rf "$target"
  if [ "$LINK" -eq 1 ]; then
    ln -s "$SOURCE_DIR" "$target"
    echo "Linked   $target -> $SOURCE_DIR"
    return
  fi
  mkdir -p "$target"
  (cd "$SOURCE_DIR" && LC_ALL=C tar --exclude='./.git' --exclude='./.claude' --exclude='./.design' \
      --exclude='./.github' --exclude='./CLAUDE.md' --exclude='./CONTRIBUTING.md' --exclude='./setup.sh' \
      -cf - .) | (cd "$target" && LC_ALL=C tar -xf -)
  chmod +x "$target/hooks/frontend-intent-hook.sh" "$target/scripts/"*.sh
  echo "Installed $target"
}

install_agent_for() {
  local spec; spec="$(preset_agent "$1")"
  [ -z "$spec" ] && return 0
  local dir="${spec%%|*}" file="${spec##*|}"
  [ -d "$dir" ] || return 0
  cp "$SOURCE_DIR/$file" "$dir/"
  echo "Agent    $dir/$(basename "$file")"
}

install_hook() {
  local target="$1" settings="$HOME/.claude/settings.json"
  local cmd="bash \"$target/hooks/frontend-intent-hook.sh\""
  mkdir -p "$(dirname "$settings")"
  [ -f "$settings" ] || echo '{}' > "$settings"
  cp "$settings" "$settings.bak.$(date +%s)"
  python3 - "$settings" "$cmd" <<'PY'
import json, sys
path, cmd = sys.argv[1], sys.argv[2]
with open(path) as f:
    data = json.load(f)
entries = data.setdefault("hooks", {}).setdefault("UserPromptSubmit", [])
already = any(h.get("command") == cmd for e in entries for h in e.get("hooks", []))
if not already:
    entries.append({"hooks": [{"type": "command", "command": cmd}]})
with open(path, "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")
print("Hook     " + ("already present in " if already else "added to ") + path)
PY
}

for arg in "$@"; do
  case "$arg" in
    --with-hook) WITH_HOOK=1 ;;
    --link)      LINK=1 ;;
    --all)       ALL=1 ;;
    --list)      list_presets; exit 0 ;;
    --agent)     EXPECT_AGENT=1 ;;
    --agent=*)   AGENTS+=("${arg#--agent=}") ;;
    -h|--help)   sed -n '2,11p' "$0"; exit 0 ;;
    *)
      if [ "${EXPECT_AGENT:-0}" -eq 1 ]; then AGENTS+=("$arg"); EXPECT_AGENT=0
      else CUSTOM_ROOT="$arg"; fi ;;
  esac
done

AGENT_ONLY=()
if [ "$ALL" -eq 1 ]; then
  # Skill goes to ~/.agents/skills once (claude, codex, opencode, gemini, copilot read it)
  # plus the hosts that only read their own folder. Agent files go to every detected host.
  AGENTS=(agents)
  for p in agy cursor hermes; do
    [ -e "$(preset_marker "$p")" ] && AGENTS+=("$p")
  done
  for p in claude codex opencode; do
    [ -e "$(preset_marker "$p")" ] && AGENT_ONLY+=("$p")
  done
fi

ROOTS=()
if [ -n "$CUSTOM_ROOT" ]; then ROOTS+=("$CUSTOM_ROOT"); fi
if [ ${#AGENTS[@]} -eq 0 ] && [ -z "$CUSTOM_ROOT" ]; then AGENTS=(agents); fi
for p in "${AGENTS[@]:-}"; do
  [ -z "$p" ] && continue
  dir="$(preset_dir "$p")" || { echo "Unknown preset: $p (see --list)" >&2; exit 1; }
  ROOTS+=("$dir")
done

# de-duplicate roots (codex and agents share one)
SEEN=""
for root in "${ROOTS[@]}"; do
  case "$SEEN" in *"|$root|"*) continue ;; esac
  SEEN="$SEEN|$root|"
  install_to "$root"
done
for p in "${AGENTS[@]:-}" "${AGENT_ONLY[@]:-}"; do [ -n "$p" ] && install_agent_for "$p"; done

if [ "$WITH_HOOK" -eq 1 ]; then
  install_hook "$(preset_dir agents)/$SKILL"
fi

echo
echo "Routing: Claude Code uses the hook (--with-hook). Other hosts: append AGENTS-SNIPPET.md to AGENTS.md or GEMINI.md, or copy hooks/cursor/*.mdc into .cursor/rules/. See hooks/README.md."
