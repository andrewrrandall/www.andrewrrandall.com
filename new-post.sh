#!/usr/bin/env bash
# Usage: ./new-post.sh "My Post Title"
set -euo pipefail

if [ $# -lt 1 ]; then
    echo "Usage: ./new-post.sh \"My Post Title\"" >&2
    exit 1
fi

title="$1"
date="$(date +%Y-%m-%d)"
slug="$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+|-+$//g')"
file="_posts/${date}-${slug}.md"
escaped_title="${title//\\/\\\\}"
escaped_title="${escaped_title//\"/\\\"}"

if [ -e "$file" ]; then
    echo "$file already exists" >&2
    exit 1
fi

cat > "$file" <<EOF
---
layout: post
title: "${escaped_title}"
---

Start writing here. This is **Markdown**.
EOF

echo "Created $file"
