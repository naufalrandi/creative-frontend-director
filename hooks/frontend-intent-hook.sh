#!/usr/bin/env bash
# UserPromptSubmit hook: when the prompt shows frontend intent, tell the agent
# to load creative-frontend-director before any other design skill.
# Reads the hook JSON from stdin, prints context to stdout, exits 0.
set -u

INPUT="$(cat)"

if command -v python3 >/dev/null 2>&1; then
  PROMPT="$(printf '%s' "$INPUT" | python3 -c 'import json,sys
try:
    print(json.load(sys.stdin).get("prompt",""))
except Exception:
    print("")')"
else
  PROMPT="$INPUT"
fi

PATTERN='(\b(ui|ux|frontend|front-end|page|screen|dashboard|landing|website|web app|admin panel|settings page|onboarding|component|design system|layout|navbar|sidebar|modal|form|hero|pricing page|interface|redesign|restyle|polish|beautif|modern(ize|ise)|look(s)? (better|ugly|generic|bad)|ai[- ]generated|less generic|make it (pretty|nicer|cleaner))\b)'

if printf '%s' "$PROMPT" | grep -Eiq "$PATTERN"; then
  cat <<'MSG'
Frontend intent detected. Before any other design or taste skill, invoke the `creative-frontend-director` skill and follow its stages. Sibling design skills execute the direction it defines; they do not redefine it.
MSG
fi
exit 0
