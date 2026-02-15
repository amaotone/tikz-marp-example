#!/usr/bin/env bash
set -euo pipefail

TIKZ_DIR="tikz"
OUT_DIR="slides/images"

if [ ! -d "$TIKZ_DIR" ]; then
  echo "No tikz/ directory found. Skipping."
  exit 0
fi

shopt -s nullglob
tex_files=("$TIKZ_DIR"/*.tex)
shopt -u nullglob

if [ ${#tex_files[@]} -eq 0 ]; then
  echo "No .tex files found in $TIKZ_DIR/. Skipping."
  exit 0
fi

mkdir -p "$OUT_DIR"

TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

built=0
skipped=0

for tex in "${tex_files[@]}"; do
  name=$(basename "$tex" .tex)
  svg="$OUT_DIR/${name}.svg"

  # Skip if SVG is newer than source
  if [ -f "$svg" ] && [ "$svg" -nt "$tex" ]; then
    skipped=$((skipped + 1))
    continue
  fi

  echo "Building $tex -> $svg"

  # Compile to PDF with standalone class
  lualatex -halt-on-error -interaction=nonstopmode -output-directory="$TMPDIR" "$tex" > /dev/null 2>&1

  # Convert PDF to SVG
  dvisvgm --pdf --no-fonts --exact-bbox --output="$svg" "$TMPDIR/${name}.pdf" > /dev/null 2>&1

  built=$((built + 1))
done

echo "TikZ build: $built built, $skipped skipped (up to date)"
