---
title: "sar"
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
# Save all data to file OUTPUT in binary format
sar -o OUTPUT INTERVAL_SEC [COUNT or infinite if omitted]

# View information from binary format saXX
sar -A -f saXX

# -t: show local time of the file creator
LC_TIME=POSIX sar -A -t -f saXX

# Show average information from system boot
sar 0

-A # All of below
-B # Paging statistics
-b # I/O
-d # Block devices
-F # Mounted filesystems
-H # Hugepages
-I # Interrupts statistics
-n # Network
-P # Processor statistics
-r # Memory
-S # Swap
-u # CPU utilization
-v # Inodes and dentries
-W # Swap in/out
```

[sar(1)](https://man7.org/linux/man-pages/man1/sar.1.html)
[sa1(8)](https://man7.org/linux/man-pages/man8/sa1.8.html)
[sa2(8)](https://man7.org/linux/man-pages/man8/sa2.8.html)
[sadf(1)](https://man7.org/linux/man-pages/man1/sadf.1.html)

[pidstat(1)](https://man7.org/linux/man-pages/man1/pidstat.1.html)
[mpstat(1)](https://man7.org/linux/man-pages/man1/mpstat.1.html)
[iostat(1)](https://man7.org/linux/man-pages/man1/iostat.1.html)
