---
title: "ltrace"
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
ltrace -tttTS -o OUTPUT COMMAND
#       ^^^Show micro seconds
#          ^Show time spent inside each call
#           ^Show syscalls

# Attach to the process PID
ltrace -tttTS -o OUTPUT -p PID

# It's OK to execute COMMAND and attach to multiple processes
ltrace -tttTS -o OUTPUT -p PID1 -p PID2 COMMAND

# Trace libc functions
ltrace -e '@libc.*' COMMAND
```

[ltrace(1)](https://www.man7.org/linux/man-pages/man1/ltrace.1.html)\
FILTER EXPRESSIONS
