#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR/modules" "$DIST_DIR/rules"

cp "$ROOT_DIR/modules/FTNN.module" "$DIST_DIR/modules/FTNN.module"
cp "$ROOT_DIR/modules/coding.module" "$DIST_DIR/modules/coding.module"
cp "$ROOT_DIR/modules/social-media.module" "$DIST_DIR/modules/social-media.module"
cp "$ROOT_DIR/rules/default.conf" "$DIST_DIR/rules/default.conf"

release_files=()
while IFS= read -r file; do
  release_files+=("$file")
done < <(find "$DIST_DIR/modules" "$DIST_DIR/rules" -type f | sort)

if command -v sha256sum >/dev/null 2>&1; then
  sha256sum "${release_files[@]}" > "$DIST_DIR/sha256.txt"
else
  shasum -a 256 "${release_files[@]}" > "$DIST_DIR/sha256.txt"
fi

if command -v md5sum >/dev/null 2>&1; then
  md5sum "${release_files[@]}" > "$DIST_DIR/md5.txt"
else
  : > "$DIST_DIR/md5.txt"
  for file in "${release_files[@]}"; do
    md5 -q "$file" | awk -v f="$file" '{print $1 "  " f}' >> "$DIST_DIR/md5.txt"
  done
fi

echo "OK: checksums generated in $DIST_DIR"
