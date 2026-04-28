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

## Rule examples

```bash
key=localrule$EPOCHSECONDS
file=/etc/audit/rules.d/local.rules

# Define rules
# kill syscall family with signal 9; the second argument for kill, the third one for tgkill
echo "-a always,exit -F arch=b64 -S kill,tkill -F a1=9 -F key=$key" | tee $file
echo "-a always,exit -F arch=b64 -S tgkill -F a2=9 -F key=$key" | tee -a $file
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

Increase below numbers if your rules create log too fast and "audit: backlog limit exceeded"
message is shown.
```bash
# Increase back log limit. Possibly more, 65536, 131072, ...
echo '-b 32768' | tee -a $file
# Increase netlink socket receive buffer. This affects the whole system.
sysctl -w net.core.rmem_max=16777216
sysctl -w net.core.rmem_default=16777216
```

## Restart auditd

Audit must record who initiated an restart. Because `systemctl` hides that,
`service` or manual stopping by auditctl is required.\
https://github.com/linux-audit/audit-userspace/issues/260#issuecomment-1118496339\
https://github.com/linux-audit/audit-userspace/blob/master/init.d/auditd.restart
```bash
service auditd restart
# OR
auditctl --signal stop
sleep 1
systemctl start auditd.service
```

[auditctl(8)](https://www.man7.org/linux/man-pages/man8/auditctl.8.html)
[audit.rules(7)](https://www.man7.org/linux/man-pages/man7/audit.rules.7.html)
have rule examples
