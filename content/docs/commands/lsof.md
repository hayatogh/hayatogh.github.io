---
title: "lsof"
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
lsof +M -n -l
#    ^Show local TCP, UDP and UDPLITE ports
#        ^Don't translate IP to hostname
#           ^Don't translate UID to login name
# Because +M needs '+' prefix and others don't care,
# prefix grouping can be applied as below
lsof +Mnl

lsof -b +M -n -l
#     ^Don't use blocking syscalls
#       ^Show local TCP, UDP and UDPLITE ports
#           ^Don't translate IP to hostname
#              ^Don't translate UID to login name
lsof +bMnl
```
