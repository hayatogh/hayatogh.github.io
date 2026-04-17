---
title: "truncate"
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
# Sparse
truncate -s 2G test.img

# Allocate now
fallocate -l 2G test.img

# dd version
dd if=/dev/zero of=test.img bs=1M count=1 seek=$((2 * 1024 - 1))
dd if=/dev/zero of=test.img bs=1M count=$((2 * 1024))

# Direct I/O
dd if=/dev/zero of=test.img bs=1M count=1024 oflag=direct
# Synchronized I/O
dd if=/dev/zero of=test.img bs=1M count=1024 oflag=sync
```
[truncate(1)](https://www.man7.org/linux/man-pages/man1/truncate.1.html)
[fallocate(1)](https://www.man7.org/linux/man-pages/man1/fallocate.1.html)
[dd(1)](https://www.man7.org/linux/man-pages/man1/dd.1.html)
