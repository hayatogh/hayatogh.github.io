---
title: "Audit"
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
key=localrule$EPOCHSECONDS
file=/etc/audit/rules.d/local.rules

# Define rules
# kill syscall with second argument 9
echo "-a always,exit -F arch=b64 -S kill -F a1=9 -F key=$key" | tee $file
# writes to /etc/shadow with syscall automatically set by perm
echo "-a always,exit -F arch=b64 -F path=/etc/shadow -F perm=wa -F key=$key" | tee $file
# writes to /etc recursively. "/" is also valid dir
echo "-a always,exit -F arch=b64 -F dir=/etc -F perm=wa -F key=$key" | tee $file
augenrules --load && auditctl -l

# Remove rules
rm -f $file && augenrules --load && auditctl -l

# Search
ausearch -k $key
# with UID and clock converted
ausearch -i -k $key
```

[auditctl(8)](https://www.man7.org/linux/man-pages/man8/auditctl.8.html)
[audit.rules(7)](https://www.man7.org/linux/man-pages/man7/audit.rules.7.html)
have rule examples
