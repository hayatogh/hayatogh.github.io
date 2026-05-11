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

## Debugging Bash script

```bash
# Save call stack in Bash
echo "${FUNCNAME[@]}" >>/path/to/log
```

## Writing

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
# The result of below varies.
sh -c 'echo \\n'

# Trim preceding and trailing white spaces
t=${t#${t%%[![:space:]]*}}
t=${t%${t##*[![:space:]]}}
```

## Bash Invocation

When one does
```bash
ssh host 'CMD OPT'
```
, basically invokes `$SHELL -c 'CMD OPT'` on remote host.\
Relevant code is in do_child @ [openssh-portable/session.c](https://github.com/openssh/openssh-portable/blob/master/session.c),
(use search term "shell0").

However, if Bash has been built with SSH_SOURCE_BASHRC defined,
Bash tries to detect being run by sshd and if so, it sources below:
1. system-wide .bashrc if it was defined (SYS_BASHRC in source, /etc/bash.bashrc for exmaple) and
2. ~/.bashrc

[Debian Bash package](https://tracker.debian.org/pkg/bash) enables this behavior
with [patch deb-bash-config.diff](https://salsa.debian.org/debian/bash/-/blob/debian/master/debian/patches/deb-bash-config.diff).

Relevant Bash-side code is in [shell.c](https://salsa.debian.org/debian/bash/-/blob/debian/master/shell.c).
