#!/usr/bin/env bash
set -euo pipefail

# Creative Frontend Director — installation wrapper
# Usage:
#   ./setup.sh                     # Install to ~/.agents/skills
#   ./setup.sh --with-hook         # Install + merge hook
#   ./setup.sh /path/to/install    # Install to custom directory

echo "=== Creative Frontend Director Setup ==="
echo ""
echo "This will install the agent skill package to:"
if [[ $# -eq 0 ]]; then
  echo "  ~/.agents/skills/creative-frontend-director"
  echo ""
  echo "Modes:"
  echo "  ./setup.sh                   # Standard install"
  echo "  ./setup.sh --with-hook       # Install + merge UserPromptSubmit hook"
  echo "  ./setup.sh /path/to/dir      # Custom install directory"
  echo ""
fi

# Delegate to the actual installer
exec "$(dirname "$0")/scripts/install.sh" "$@"
