---
title: "apt"
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

```bash
# Install kernel debug package
sudo apt install linux-image-amd64-dbg

# Install specific kernel debug package
sudo apt install linux-image-$(uname -r)-dbg
# Remove kernel debug package except for current running one's
dpkg-query -W -f '${Package}\n' linux-image-*-dbg | grep -v $(uname -r)
```
