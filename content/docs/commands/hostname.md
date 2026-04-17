---
title: "hostname"
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
# Change static hostname
hostnamectl hostname NAME
vi /etc/hostname

# Set transient hostname
hostname NAME
hostnamectl hostname --transient NAME
```

[hostnamectl(1)](https://www.man7.org/linux/man-pages/man1/hostnamectl.1.html)
[hostname(5)](https://www.man7.org/linux/man-pages/man5/hostname.5.html)
[hostname(1) from net-tools](https://www.man7.org/linux/man-pages/man1/hostname.1.html)
