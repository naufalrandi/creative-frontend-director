#!/usr/bin/env bash
# Regenerate the "files" list in manifest.json from the working tree.
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."
python3 - <<'PY'
import json, os
skip = ('./.git', './.claude', './.design', './.github', './docs')
files = sorted(
    os.path.relpath(os.path.join(r, f), ".")
    for r, _, fs in os.walk(".")
    if not r.startswith(skip)
    for f in fs
    if f not in (".gitignore", ".DS_Store")
)
m = json.load(open("manifest.json"))
m["files"] = files
with open("manifest.json", "w") as fh:
    json.dump(m, fh, indent=2)
    fh.write("\n")
print(f"manifest.json: {len(files)} files")
PY
