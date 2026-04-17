---
title: "csplit"
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
# Inputfile is not modified

# Split with pattern and repeat ('{*}') into new files, xx0000, xx0001, ..
csplit -zn4 Inputfile /header_basicregex/ '{*}'
# -z supresses empty output
# Without -z, when input starts with pattern, xx00 becomes empty

# Supressing matched line, making pattern act as a separator to be removed
csplit -zn4 --suppress-matched Inputfile /separator_basicregex/ '{*}'

# Match +1 line, making pattern as EOF marker
csplit -zn4 Inputfile /eof_marker/1 '{*}'

# Reading from stdin with quoted pattern
cat Inputfile | csplit -n4 -z - '/regex need quoted/' '{*}'

# With default -n2, split into xx00, .., xx99, xx100 ..
# To fix that
rename xx xx0 xx??
# If you are not sure about how many patterns in the file beforehand
grep -c 'pattern' Inputfile
```

[csplit(1)](https://www.man7.org/linux/man-pages/man1/csplit.1.html)
