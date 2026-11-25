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

## Inspecting subcommands

```bash
# Blame with detecting moved lines between files
git blame -C /path/to/file
# Blame again with just before the revision REV
git blame -C REV^ /path/to/file

# Show commit the number of occurrences of a string changed
git log -S 'interesting_function'
# Or with a regex
git log -S 'interesting_(function|struct)' --pickaxe-regex

# Show commit a regex matches to the added/deleted lines
git log -G 'modified_(function|struct)'

# Show branch containing a commit
git branch -a --contains <commit>
```

# Miscellaneous subcommands

```bash
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
