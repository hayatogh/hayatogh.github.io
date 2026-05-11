---
title: "find"
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

## find example

```bash
# find and resolve symlinks and paths to full path
find . -regextype egrep -regex '...' -exec realpath {} \;
# find and show symlink objects and paths
find . -regextype egrep -regex '...' \( -type l -printf '%l\n' -o -print \)
```

## -L option

If `-L` is specified, `find` uses information of the object of the symlinks.
For exmaple, `%y`, file's type, shows `f`, `d`, etc., and never `l`.
However, `%p` shows the path of the symlink.
