---
title: "procfs, debugfs"
weight: 1
# bookFlatSection: false
# bookToc: true
# bookHidden: false
# bookCollapseSection: false
# bookComments: false
# bookSearchExclude: false
# bookHref: ''
# bookIcon: ''
draft: true
---

## Overview

- /proc/meminfo: meminfo_proc_show() @ fs/proc/meminfo.c
  - MemFree: allocatable memory without reclaim
  - MemAvailable: MemFree + probably reclaimable memory
  - Cached: Page cache
  - Mlocked: Locked via mlock()
  - Slab: slab objects
  - HugePages_Total: Reserved for hugepages

- /proc/vmstat: vmstat_show() @ mm/vmstat.c
  - allocstall_\*: the number of stalls while direct reclaim
  - compact_\*: compaction event counters
  - drop_pagecache: the number of calls of /proc/sys/vm/drop_caches with bit 1 enabled
  - drop_slab: the number of calls of /proc/sys/vm/drop_caches with bit 2 enabled
  - thp_\*: THP event counters

- /proc/zoneinfo: zoneinfo_show() @ mm/vmstat.c
  - min, low, high: per-zone watermarks
  - managed: the number of managed pages
  - cma: Reserved for CMA allocations (Contiguous Memory Allocator)

- /proc/iomem
  - current memory map for all addresses on the system

- /proc/kpagecount: kpagecount_read() @ fs/proc/page.c
  - binary file with u64 array representing physical page map count

- /proc/kpageflags
  - binary file with u64 arracy representing physical page flags

- /proc/pagetypeinfo
  - count of pages of different types in each zone on each numa node

- /proc/slabinfo
  - memory usage by various slab objects

- /proc/vmallocinfo
  - Shows vmalloc'ed areas.  Details are in Documentation/filesystems/proc.rst.

- /sys/kernel/debug/extfrag/extfrag_index
  - current external fragmentation for each zone.
    Look up extfrag_threshold in Documentation/admin-guide/sysctl/vm.rst for
    interpretation of the values.

- /proc/mounts
  - Shows information from (struct super_operations \*)s_op-\>show_options
    such as ext4_show_options and xfs_fs_show_options.


- /proc/buddyinfo
- /proc/cpuinfo


[proc_vmstat(5)](https://www.man7.org/linux/man-pages/man5/proc_vmstat.5.html)

[slabinfo(5)](https://www.man7.org/linux/man-pages/man5/slabinfo.5.html)
is a man page for /proc/slabinfo; proc_slabinfo(5) is a shim to slabinfo(5).

[slabtop(1)](https://www.man7.org/linux/man-pages/man1/slabtop.1.html)
is a top like interactive interface for slab information in realtime.
