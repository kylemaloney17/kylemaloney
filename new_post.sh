#!/bin/bash

# Get the post title from the user
echo "Enter the title of your blog post:"
read title

# Generate the filename
date=$(date +"%Y-%m-%d")
filename="_posts/$date-${title// /-}.md"

# Generate the front matter
cat > "$filename" <<EOF
---
layout: post
title: "$title"
date: $(date +"%Y-%m-%d %H:%M:%S %z")
categories: personal
---

EOF

# Open the file in the default text editor
if [[ "$OSTYPE" == "darwin"* ]]; then
    open -t "$filename"
else
    xdg-open "$filename"
fi

echo "New post created: $filename"
echo "The file has been opened in your default text editor. Add your content there."
