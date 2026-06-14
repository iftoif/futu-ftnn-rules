#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

fail() {
  echo "ERROR: $*" >&2
  exit 1
}

files=(
  "$ROOT_DIR/modules/FTNN.module"
  "$ROOT_DIR/modules/coding.module"
  "$ROOT_DIR/modules/social-media.module"
  "$ROOT_DIR/rules/default.conf"
)

for file in "${files[@]}"; do
  [ -f "$file" ] || fail "missing required file: $file"
  iconv -f UTF-8 -t UTF-8 "$file" >/dev/null || fail "$file is not valid UTF-8"
  if LC_ALL=C grep -n $'\r' "$file" >/dev/null; then
    fail "$file contains CRLF or CR characters; use LF only"
  fi
done

grep -qxF "#!name=Futu FTNN Rules" "$ROOT_DIR/modules/FTNN.module" || fail "missing FTNN module name"
grep -q '^#!desc=FTNN/Futu_Open/moomoo observed domains and IP rules' "$ROOT_DIR/modules/FTNN.module" || fail "missing FTNN module desc"
grep -qxF "#!name=coding" "$ROOT_DIR/modules/coding.module" || fail "missing coding module name"
grep -qxF "#!name=社交媒体" "$ROOT_DIR/modules/social-media.module" || fail "missing social-media module name"

for module in "$ROOT_DIR"/modules/*.module; do
  grep -q '^#!homepage=https://github.com/iftoif/futu-ftnn-rules$' "$module" || fail "missing homepage header in $module"
  grep -q '^#!author=iftoif$' "$module" || fail "missing author header in $module"
done

grep -qxF "[General]" "$ROOT_DIR/rules/default.conf" || fail "missing [General] in default.conf"
grep -qxF "[Rule]" "$ROOT_DIR/rules/default.conf" || fail "missing [Rule] in default.conf"

awk '
  BEGIN { ok = 1 }
  /^[[:space:]]*$/ { next }
  /^#/ { next }
  /^!/ { next }
  /^\[/ { next }
  /,$/ {
    printf "ERROR: invalid trailing comma at line %d in %s: %s\n", FNR, FILENAME, $0 > "/dev/stderr"
    ok = 0
  }
  END { exit ok ? 0 : 1 }
' "${files[@]}"

echo "OK: Shadowrocket files validation passed"

