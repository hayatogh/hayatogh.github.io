---
title: "sh"
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

Debugging Bash script
```bash
# Save call stack in Bash
echo "${FUNCNAME[@]}" >>/path/to/log
```

Writing
```bash
# Safe guards
set -euxo pipefail
shopt -s inherit_errexit

# The pitfall of '-e'
set -e
f()
{
	false
	echo reached
}
f && echo end
# Output:
# reached
# end

# POSIX echo (e.g. Dash builtin echo) takes only '-n' option
# and always interprets escaped sequences.
# If you want a consistent behavior, use printf instead.
sh -c 'echo \\n'

# Trim preceding and trailing white spaces
t=${t#${t%%[![:space:]]*}}
t=${t%${t##*[![:space:]]}}
```
