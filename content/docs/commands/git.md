---
title: "git"
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
# Inspecting commands
# Blame with detecting moved lines between files
git blame -C /path/to/file
# Blame again with just before the revision REV
git blame -C REV^ /path/to/file

# Show branch containing a commit
git branch -a --contains <commit>

# Miscellaneous commands
# Re-create commit with auto-staging modified or deleted files
git commit -a --amend

# Clean
git clean -fdx
#           ^Recurse into untracked directories
#            ^Remove all untracked or ignored files
git clean -fX
#           ^Remove only ignored files
```

```bash
# Separate Git dir
# Init
git init --separate-git-dir /path/to/git-dir

# Convert existing repo
mv .git /path/to/new-git-dir
cat <<EOF >.git
gitdir: /path/to/new-git-dir
EOF
```
