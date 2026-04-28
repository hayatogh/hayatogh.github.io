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

```bash
# Set the maximum size of core files unlimited
ulimit -c unlimited

# To generate a core from a running process
sudo gcore $PID

# When an app crashes, systemd-coredump enabled systems save coredumps as
/var/lib/systemd/coredump/core.appname.boot_id

coredumpctl info
coredumpctl info $PID
coredumpctl gdb $PID
coredumpctl -o core.$PID dump $PID
```

[Files (Debugging with GDB)](https://sourceware.org/gdb/current/onlinedocs/gdb.html/Files.html)

[gcore(1)](https://www.man7.org/linux/man-pages/man1/gcore.1.html)

[coredumpctl(1)](https://www.man7.org/linux/man-pages/man1/coredumpctl.1.html)
[systemd-coredump(8)](https://www.man7.org/linux/man-pages/man8/systemd-coredump.8.html)
[coredump.conf(5)](https://www.man7.org/linux/man-pages/man5/coredump.conf.5.html)

[core(5)](https://man7.org/linux/man-pages/man5/core.5.html)\
systemd-coredump utilizes /proc/sys/kernel/core\_pattern to process coredumps
