#!/usr/bin/env sh
set -eu

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <commit-message-file>" >&2
  exit 2
fi

msg_file="$1"

if [ ! -f "$msg_file" ]; then
  echo "Commit message file not found: $msg_file" >&2
  exit 2
fi

header="$(sed -n '1p' "$msg_file" | tr -d '\r')"

if [ -z "$header" ]; then
  echo "Commit message cannot be empty." >&2
  exit 1
fi

# Allow some Git-generated messages that are not conventional headers.
if printf '%s\n' "$header" | grep -Eq '^(Merge|Revert|fixup!|squash!)'; then
  exit 0
fi

pattern='^(build|chore|ci|docs|feat|fix|perf|refactor|revert|style|test)(\([a-z0-9._/-]+\))?(!)?: .+'

if printf '%s\n' "$header" | grep -Eq "$pattern"; then
  exit 0
fi

cat >&2 <<'EOF'
Invalid commit message header.
Use Conventional Commits:
  <type>(<scope>): <description>
  <type>: <description>

Valid types:
  build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test

Examples:
  feat(auth): add refresh token endpoint
  fix: handle nil pointer on startup
  chore!: drop deprecated env vars
EOF

exit 1
