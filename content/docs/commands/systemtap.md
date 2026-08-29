---
title: "Systemtap"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
# bookIcon: ''
draft: 1
---

```text
# limit to specific process name
if (execname() != "java") {
	printf("Different execname\n")
	next
}
```

Listing probe points:
```bash
stap -L 'process("/usr/lib64/libdl.so.2").statement("*@*:*")'
stap -L 'process("/usr/lib64/libc-2.28.so").statement("*@*:*")'
stap -v -L 'module("xfs").function("*")'
```

Let stap show similar functions to identify exact function names.
```text
# stap -v -e 'probe kernel.function("__x86_sys_ioctl") { print("") }'
Pass 1: parsed user script and 486 library scripts using 358716virt/105844res/14104shr/91044data kb, in 180usr/430sys/607real ms.
semantic error: while resolving probe point: identifier 'kernel' at <input>:1:7
        source: probe kernel.function("__x86_sys_ioctl") { print("") }
                      ^

semantic error: no match (similar functions: __x64_sys_ioctl, __do_sys_ioctl, __se_sys_ioctl, __ia32_sys_ioctl, __x64_sys_iopl)

Pass 2: analyzed script: 0 probes, 0 functions, 0 embeds, 0 globals using 470076virt/219152res/15988shr/202404data kb, in 1820usr/580sys/2407real ms.
Pass 2: analysis failed.  [man error::pass2]
```

Samples
```text
$ grep -r xfs /usr/share/systemtap/tapset/
```

Call graph sample
```text
# ls /usr/share/systemtap/examples/general/para-callgraph.stp
# stap -v para-callgraph.stp 'module("xfs").function("*")' 'kernel.function("__x64_sys_ioctl")'
# stap -v -g --suppress-time-limits para-callgraph.stp
```

If stopped by ^C^C, probes may be left and will need reboot.

@1 argument as string
