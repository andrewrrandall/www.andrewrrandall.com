#!/usr/bin/env bash
# Usage: ./new-post.sh "My Post Title"
# Creates a draft in _drafts/. Drafts aren't published until you run ./publish-post.sh.
set -euo pipefail
cd "$(dirname "$0")"

if [ $# -lt 1 ]; then
    echo "Usage: ./new-post.sh \"My Post Title\"" >&2
    exit 1
fi

title="$1"
slug="$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')"
file="_drafts/${slug}.md"
escaped_title="${title//\\/\\\\}"
escaped_title="${escaped_title//\"/\\\"}"

if [ -e "$file" ] || ls _posts/*-"${slug}".md >/dev/null 2>&1; then
    echo "A post with slug '${slug}' already exists" >&2
    exit 1
fi

mkdir -p _drafts
cat > "$file" <<EOT
---
layout: post
title: "${escaped_title}"
# description: "Optional one-line summary for link previews"
---

Start writing here. This is **Markdown**.
EOT

echo "Created draft $file"
echo "Publish it with: ./publish-post.sh $file"
