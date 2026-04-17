---
title: "sed"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
# bookIcon: ''
---

```bash

# Pass complex script like including embedded newlines via
# 1. stdin which works in POSIX sh
printf 'script' | sed -f - input
# or 2. Bash process substitution or ANSI C quote
sed -f <(printf 'script') input
sed $'script' input

# Replace /placeholder/ line with the content of content_file,
printf '/placeholder/ { r content_file\n d }' | sed -f - input_file
```
