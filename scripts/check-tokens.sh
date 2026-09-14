#!/usr/bin/env bash
# Token conformance check. Fails when raw colors or off-scale spacing appear outside token files.
#   ./scripts/check-tokens.sh [dir] [--tokens <glob>] [--scale "4 8 12 16 24 32 48 64"]
set -uo pipefail
DIR="${1:-.}"; shift || true
TOKEN_GLOB="tokens|theme|DESIGN|design-tokens|globals\.css|app\.css|index\.css"
SCALE="0 1 2 4 6 8 10 12 16 20 24 28 32 40 48 56 64 80 96 128"
while [ $# -gt 0 ]; do case "$1" in --tokens) TOKEN_GLOB="$2"; shift 2;; --scale) SCALE="$2"; shift 2;; *) shift;; esac; done

FILES=$(find "$DIR" -type f \( -name '*.css' -o -name '*.scss' -o -name '*.html' -o -name '*.tsx' -o -name '*.jsx' -o -name '*.vue' -o -name '*.svelte' \) \
  -not -path '*/node_modules/*' -not -path '*/dist/*' -not -path '*/.design/*' -not -path '*/.git/*' | grep -Ev "$TOKEN_GLOB")
[ -z "$FILES" ] && { echo "check-tokens: no source files found under $DIR"; exit 0; }

fail=0
echo "== raw colors outside token files"
hits=$(echo "$FILES" | xargs grep -nHE '(#[0-9a-fA-F]{3,8}\b|rgba?\(|hsla?\(|oklch\()' 2>/dev/null | grep -vE 'var\(--|currentColor|/\*' | grep -vE ':[0-9]+:\s*--[a-z0-9-]+\s*:' | grep -vE '#[0-9a-fA-F]{3,8}"?\s*(>|<)' )
if [ -n "$hits" ]; then echo "$hits" | head -40; fail=1; else echo "none"; fi

echo "== spacing values off the scale"
scale_re="$(echo "$SCALE" | tr ' ' '|')"
hits=$(echo "$FILES" | xargs grep -nHoE '\b(margin|padding|gap|top|left|right|bottom|inset)(-[a-z]+)?\s*:\s*[0-9]+px' 2>/dev/null | grep -vE ":\s*(${scale_re})px$")
if [ -n "$hits" ]; then echo "$hits" | head -40; fail=1; else echo "none"; fi

echo "== inline style attributes"
hits=$(echo "$FILES" | xargs grep -nHE 'style="[^"]*(color|padding|margin|font)' 2>/dev/null | grep -v 'var(--')
if [ -n "$hits" ]; then echo "$hits" | head -20; fail=1; else echo "none"; fi

echo "== arbitrary Tailwind values"
hits=$(echo "$FILES" | xargs grep -nHoE '\b[a-z]+-\[[^]]+\]' 2>/dev/null | head -20)
if [ -n "$hits" ]; then echo "$hits"; fail=1; else echo "none"; fi

[ "$fail" -eq 0 ] && echo "check-tokens: PASS" || { echo "check-tokens: FAIL"; exit 1; }
