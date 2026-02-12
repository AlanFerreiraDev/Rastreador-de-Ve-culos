#!/usr/bin/env sh
set -eu

repo_root="$(git rev-parse --show-toplevel)"
git config core.hooksPath "$repo_root/.githooks"
git config alias.cc '!sh scripts/commit.sh'

echo "Git hooks path configured to: $repo_root/.githooks"
echo "Git alias configured: git cc"
