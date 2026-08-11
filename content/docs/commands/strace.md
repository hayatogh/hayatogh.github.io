---
title: "strace"
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

## For quick copy

```bash
strace -fittTvxyyYs8192 -o out
```

```bash
/usr/bin/strace -fittTvxyyYs8192 -o out
```


## Usage

```bash
# Get as much as information in one go
strace -fittTvxyyYs8192 [-o OUTPUT] {COMMAND | -p PID}
#       ^trace child processes
#        ^show instruction pointer
#         ^^show timestamp in microseconds
#           ^show time spent in syscalls in microseconds
#            ^no abbreviate env, common structs etc.
#             ^print strings containing non-ASCII all in hex
#              ^^decode file descriptors to paths with device information
#                ^decode PIDs to command names
#                 ^set max string length (default: 32)

# Avoid -x to view ASCII in binary such as '\177ELF', with -x which is '\x7f\x45\x4c\x46'
strace -fittTvyyYs8192 [-o OUTPUT] {COMMAND | -p PID}

# Stop tracing at execve
strace -fittTvyyYs8192 -b execve -o OUTPUT COMMAND
#                       ^detach at execve (-b only supports execve)

# More concise output
strace -fyyY -o OUTPUT COMMAND
strace -fyyYs64 -o OUTPUT COMMAND
strace -fxyyYs64 -o OUTPUT COMMAND

# Limit events to trace
strace -fxyyY -e trace=open,close COMMAND
strace -fxyyY -e open,close COMMAND

# Diff friendly (need word or char diff)
strace -yyY -o OUTPUT COMMAND
strace -fyyY -b execve -o OUTPUT COMMAND
```

Some options needs later versions.\
-yy: RHEL7.4 and later, RHEL8.0 and later\
-Y: RHEL8.7 and later, RHEL9.1 and later

-r (--relative-timestamps) and -t -tt -ttt (--absolute-timestamps --timestamps) are
timestamps; not for performance but for inspecting by comparing with other timing information.

There is syscall fault injection functionality.


## Example

```text
$ strace -fittTvxyyYs8192 -o output pwd
$ fold -w95 output | less
:
107306<pwd> 12:14:34.052997 [00007f3e04b59c37] access("/etc/ld.so.preload", R_OK) = -1 ENOENT (
No such file or directory) <0.000010>
107306<pwd> 12:14:34.053033 [00007f3e04b59e8a] openat(AT_FDCWD</home/user>, "/etc/ld.so.cache",
 O_RDONLY|O_CLOEXEC) = 3</etc/ld.so.cache> <0.000012>

# PID<Comm> timestamp [IP] syscall(arguments) = return_value errno (strerror) <time_spent>
```
