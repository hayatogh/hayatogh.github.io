---
title: "gdb"
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

```text
# Locate shared libraries from target environment
#   $ dpkg-deb -x libc6_*.deb sysroot
#   $ rpm2cpio glibc*.rpm | cpio -D sysroot -idmu
set sysroot ./sysroot

# Tell other user-defined libraries location
set solib-search-path ./user_libs

# .debug or build-id based symbol files path, probably unnecessary because
# GDB looks here by default
# set debug-file-directory ./sysroot/usr/lib/debug

# Map source code path
# set substitute-path /buildtime/src ./src

file ./executable
core ./coredump

# Show status of loaded shared objects
info sharedlibrary
```
```bash
gdb -x gdbinit
```

[Files (Debugging with GDB)](https://sourceware.org/gdb/current/onlinedocs/gdb.html/Files.html)
