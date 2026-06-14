#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: $0 <github-username>" >&2
  exit 1
fi

USERNAME="$1"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

find "$ROOT_DIR" \
  -type f \
  ! -path "$ROOT_DIR/.git/*" \
  ! -path "$ROOT_DIR/dist/*" \
  -print0 |
while IFS= read -r -d '' file; do
  perl -0pi -e "s/iftoif/$USERNAME/g" "$file"
done

echo "OK: replaced iftoif with $USERNAME"

