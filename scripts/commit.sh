#!/usr/bin/env sh
set -eu

repo_root="$(git rev-parse --show-toplevel)"
validator="$repo_root/scripts/validate-commit-msg.sh"

if [ ! -x "$validator" ]; then
  echo "Validator not executable: $validator" >&2
  exit 2
fi

if git diff --cached --quiet; then
  echo "No staged files found. Stage files before committing." >&2
  exit 1
fi

type=""
scope=""
description=""
breaking=""

if [ "$#" -gt 0 ]; then
  message="$*"
else
  printf "type (feat, fix, chore, docs, ...): "
  read -r type
  printf "scope (optional, press Enter to skip): "
  read -r scope
  printf "description: "
  read -r description
  printf "breaking change? [y/N]: "
  read -r breaking

  if [ -n "$scope" ]; then
    message="$type($scope): $description"
  else
    message="$type: $description"
  fi

  case "$breaking" in
    y|Y|yes|YES)
      if [ -n "$scope" ]; then
        message="$type($scope)!: $description"
      else
        message="$type!: $description"
      fi
      ;;
  esac
fi

tmp_file="$(mktemp)"
trap 'rm -f "$tmp_file"' EXIT INT TERM
printf "%s\n" "$message" > "$tmp_file"

"$validator" "$tmp_file"
git commit -m "$message"
