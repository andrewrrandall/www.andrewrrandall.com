#!/usr/bin/env bash
# Usage: ./publish-post.sh _drafts/my-post.md
# Moves a draft into _posts/ with today's date so it goes live on the next push.
set -euo pipefail
cd "$(dirname "$0")"

if [ $# -lt 1 ]; then
    echo "Usage: ./publish-post.sh _drafts/my-post.md" >&2
    echo "Drafts:" >&2
    ls _drafts/*.md 2>/dev/null | sed 's/^/  /' >&2 || echo "  (none)" >&2
    exit 1
fi

draft="$1"
[ -f "$draft" ] || draft="_drafts/${1%.md}.md"
if [ ! -f "$draft" ]; then
    echo "Draft not found: $1" >&2
    exit 1
fi

target="_posts/$(date +%Y-%m-%d)-$(basename "$draft")"
if [ -e "$target" ]; then
    echo "$target already exists" >&2
    exit 1
fi

if git ls-files --error-unmatch "$draft" >/dev/null 2>&1; then
    git mv "$draft" "$target"
else
    mv "$draft" "$target"
fi

echo "Published $target"
echo "Commit and push to make it live."
