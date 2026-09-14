#!/usr/bin/env bash
# Compose a README hero from a desktop and a phone screenshot.
#   docs/tools/compose-hero.sh <desktop.png> <phone.png> <out.png> "<Name>" "<subtitle>" "<tag>"
set -euo pipefail
DESKTOP="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"
PHONE="$(cd "$(dirname "$2")" && pwd)/$(basename "$2")"
OUT="$3"; NAME="${4:-}"; SUB="${5:-}"; TAG="${6:-creative-frontend-director}"
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TMP="$(mktemp -d)"
python3 - "$HERE/hero.html" "$TMP/hero.html" "$DESKTOP" "$PHONE" "$NAME" "$SUB" "$TAG" <<'PY'
import sys
src, dst, desktop, phone, name, sub, tag = sys.argv[1:]
s = open(src).read()
for k, v in {"{{DESKTOP}}": "file://" + desktop, "{{PHONE}}": "file://" + phone, "{{NAME}}": name, "{{SUB}}": sub, "{{TAG}}": tag}.items():
    s = s.replace(k, v)
open(dst, "w").write(s)
PY
CH="${CHROME:-/Applications/Google Chrome.app/Contents/MacOS/Google Chrome}"
[ -x "$CH" ] || CH="$(command -v google-chrome || command -v chromium || command -v chrome)"
mkdir -p "$(dirname "$OUT")"; rm -f "$OUT"
"$CH" --headless=new --disable-gpu --hide-scrollbars --no-first-run --user-data-dir="$TMP/profile" \
  --force-device-scale-factor="${HERO_SCALE:-1.5}" --virtual-time-budget=3000 --window-size=1600,900 \
  --screenshot="$OUT" "file://$TMP/hero.html" >/dev/null 2>&1 &
PID=$!
for i in $(seq 1 40); do [ -s "$OUT" ] && break; perl -e 'select(undef,undef,undef,0.5)' 2>/dev/null; done
kill $PID 2>/dev/null || true
[ -s "$OUT" ] && echo "wrote $OUT" || { echo "compose-hero: no output"; exit 1; }
rm -rf "$TMP" 2>/dev/null || true
