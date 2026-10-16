#!/usr/bin/env bash
# Heuristic source lint, not a CSS/JS parser or proof of token conformance.
# Checks literal colors, px spacing declarations, and arbitrary utility values.
# Dynamic JS, interpolation, non-px spacing, and computed styles need browser review.
# Usage: check-tokens.sh [dir] [--tokens <glob>] [--scale "4 8 12 16"]
# --tokens matches basenames or relative paths (repeatable; replaces defaults).
# Exception: standalone comment immediately before one line, one named rule:
# /* token-check-allow raw-color: third-party logo requires exact brand color */
# Rules: raw-color, off-scale-spacing, arbitrary-utility. Reason >= 12 characters.
set -euo pipefail
python3 - "$@" <<'PY'
import argparse
from fnmatch import fnmatchcase
from pathlib import Path
import re
import sys

parser = argparse.ArgumentParser(description="Heuristic token source lint; computed/browser review still required.")
parser.add_argument("directory", nargs="?", default=".")
parser.add_argument("--tokens", action="append", metavar="GLOB")
parser.add_argument("--scale", default="0 1 2 4 6 8 10 12 16 20 24 28 32 40 48 56 64 80 96 128")
args = parser.parse_args()
root = Path(args.directory)
if not root.is_dir():
    parser.error(f"not a directory: {root}")
if not re.fullmatch(r"\d+(?:\.\d+)?(?:\s+\d+(?:\.\d+)?)*", args.scale.strip()):
    parser.error("--scale requires space-separated nonnegative numbers")
scale = {float(value) for value in args.scale.split()}
globs = args.tokens if args.tokens is not None else ["tokens.*", "*.tokens.*", "theme.*", "*.theme.*", "design-tokens.*", "globals.css", "app.css", "index.css", "tokens/*", "theme/*"]
if any(not value.strip() for value in globs):
    parser.error("--tokens requires a nonempty glob")
color = re.compile(r"#[0-9a-fA-F]{8}\b|#[0-9a-fA-F]{6}\b|#[0-9a-fA-F]{4}\b|#[0-9a-fA-F]{3}\b|\b(?:rgba?|hsla?|oklch|oklab|hwb|lab|lch|color)\(")
spacing = re.compile(r"\b(?:margin|padding|gap|row-gap|column-gap|top|left|right|bottom|inset)(?:-[a-z]+)*\s*:\s*([^;}\"']+)", re.I)
utility = re.compile(r"(?<![\w-])(?:[!\w-]+)-\[([^]\n]+)\]")
allowed_rules = {"raw-color", "off-scale-spacing", "arbitrary-utility"}
failed = False
count = 0


def report(path, number, rule, evidence):
    global failed
    failed = True
    print(f"{path}:{number}: {rule}: {evidence.strip()}")


try:
    for path in sorted(root.rglob("*")):
        relative = path.relative_to(root)
        if any(part in {"node_modules", "dist", ".design", ".git"} for part in relative.parts):
            continue
        if path.is_symlink() or not path.is_file() or path.suffix not in {".css", ".scss", ".html", ".tsx", ".jsx", ".vue", ".svelte"}:
            continue
        if any(fnmatchcase(path.name, glob) or fnmatchcase(relative.as_posix(), glob) for glob in globs):
            continue
        count += 1
        pending = None
        in_comment = False
        for number, original in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            exception = pending
            pending = None
            if "token-check-allow" in original:
                marker = re.fullmatch(r"\s*(?:/\*|<!--|\{//)\s*token-check-allow\s+([a-z-]+):\s*(.*?)\s*(?:\*/|-->|\})\s*", original)
                if not marker or marker[1] not in allowed_rules or len(marker[2].strip()) < 12:
                    report(path, number, "invalid-exception", original)
                else:
                    pending = marker[1]
                    print(f"{path}:{number}: EXCEPTION {marker[1]}: {marker[2]}")
                continue
            # Strip block comments, including multiline comments, without hiding code beside them.
            line = ""
            remaining = original
            while remaining:
                if in_comment:
                    end = remaining.find("*/")
                    if end < 0:
                        break
                    remaining, in_comment = remaining[end + 2:], False
                else:
                    start = remaining.find("/*")
                    if start < 0:
                        line += remaining
                        break
                    line += remaining[:start]
                    remaining, in_comment = remaining[start + 2:], True
            # Token definitions may hold literals, but do not exempt other declarations on same line.
            checked = re.sub(r"(?<![\w-])--[\w-]+\s*:[^;}\"']*", "", line)
            findings = []
            for match in color.finditer(checked):
                findings.append(("raw-color", match[0]))
            for declaration in spacing.finditer(checked):
                for match in re.finditer(r"(?<![\w.])(-?\d+(?:\.\d+)?)px\b", declaration[1]):
                    if abs(float(match[1])) not in scale:
                        findings.append(("off-scale-spacing", match[0]))
            for match in utility.finditer(checked):
                value = match[1]
                # Token refs allowed; literals in fallbacks still caught by color/spacing checks.
                if not re.fullmatch(r"(?:[\w-]+:)?var\(--[\w-]+\)", value) and not re.fullmatch(r"--[\w-]+", value):
                    findings.append(("arbitrary-utility", match[0]))
            for rule, evidence in findings:
                if rule != exception:
                    report(path, number, rule, evidence)
except (OSError, UnicodeError) as error:
    print(f"check-tokens: {error}", file=sys.stderr)
    sys.exit(2)
print(f"check-tokens: {'FAIL' if failed else 'PASS'} ({count} source files; heuristic checks only)")
sys.exit(1 if failed else 0)
PY
