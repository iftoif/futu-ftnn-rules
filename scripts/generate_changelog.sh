#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_FILE="${1:-$ROOT_DIR/CHANGELOG.md}"

latest_tag="$(git describe --tags --abbrev=0 2>/dev/null || true)"
current_ref="$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"
release_name="${GITHUB_REF_NAME:-${latest_tag:-Unreleased}}"
today="$(date -u +%Y-%m-%d)"

{
  echo "# Changelog"
  echo
  echo "All notable changes to this project are documented in this file."
  echo
  echo "## ${release_name} - ${today}"
  echo
  if [ -n "$latest_tag" ]; then
    git log "${latest_tag}..HEAD" --pretty=format:"- %s (%h)" 2>/dev/null || true
  else
    git log --pretty=format:"- %s (%h)" 2>/dev/null || echo "- Initial release (${current_ref})"
  fi
  echo
} > "$OUT_FILE"

echo "OK: changelog generated at $OUT_FILE"

