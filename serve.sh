#!/usr/bin/env bash
# Local preview at http://localhost:4000 (rebuilds + reloads on save).
set -euo pipefail
cd "$(dirname "$0")"

RUBY_BIN="$(brew --prefix ruby@3.3 2>/dev/null)/bin"
if [ ! -x "$RUBY_BIN/ruby" ]; then
    echo "Ruby 3.3 not found. Install it with: brew install ruby@3.3" >&2
    exit 1
fi
export PATH="$RUBY_BIN:$PATH"
export BUNDLE_PATH=vendor/bundle

bundle check >/dev/null 2>&1 || bundle install
exec bundle exec jekyll serve --livereload --drafts "$@"
