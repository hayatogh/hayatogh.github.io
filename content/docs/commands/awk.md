---
title: "awk"
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
# BEGINFILE and ENDFILE are gawk extensions
gawk '
BEGIN {
	printf "%8s %8s\n", "key", "value"
	variable = "string"
	sum = 0
}

BEGINFILE {
	print "file", FILENAME
}

/print_as-is_if_matched/

$0 ~ "^" variable {
	print "matched with variable"
}

/match/ {
	print FILENAME " at line " FNR
	print "the number of fields is: " NF
	print "the last field is: " $NF
}

/accumulate_first/ {
	sum += $1
}

ENDFILE {
}

END {
	print sum
}
' $(ls file_* | sort -V)
```

[gawk(1)](https://www.man7.org/linux/man-pages/man1/gawk.1.html)

[mawk(1)](https://invisible-island.net/mawk/manpage/mawk.html)
is the pre-installed version on Debian

[The GNU Awk User’s Guide](https://www.gnu.org/software/gawk/manual/gawk.html)
