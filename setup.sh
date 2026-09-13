#!/usr/bin/env bash
set -euo pipefail

# Creative Frontend Director — installation wrapper
# Usage:
#   ./setup.sh                     # Install to ~/.agents/skills
#   ./setup.sh --agent agy         # One host preset (see --list)
#   ./setup.sh --all               # Every host detected on this machine
#   ./setup.sh --with-hook         # Claude Code: also merge the routing hook
#   ./setup.sh /path/to/install    # Install to custom directory

echo "=== Creative Frontend Director Setup ==="
echo ""
echo "This will install the agent skill package to:"
if [[ $# -eq 0 ]]; then
  echo "  ~/.agents/skills/creative-frontend-director"
  echo ""
  echo "Modes:"
  echo "  ./setup.sh                   # Standard install"
  echo "  ./setup.sh --agent agy       # One host preset (see --list)"
  echo "  ./setup.sh --all             # Every host detected on this machine"
  echo "  ./setup.sh --with-hook       # Claude Code: also merge the routing hook"
  echo "  ./setup.sh /path/to/dir      # Custom install directory"
  echo ""
fi

# Delegate to the actual installer
exec "$(dirname "$0")/scripts/install.sh" "$@"
