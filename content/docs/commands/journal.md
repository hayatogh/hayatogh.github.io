---
title: "Journal"
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
# Show last 1000 logs
journalctl -xe

# Show all logs with explanatory help
journalctl -x
# and jump to the latest (The pager buffers all logs)
journalctl -xenall

# Show "k"ernel logs from previous boot which needs persistent journal
journalctl -kb-1

# Check if persistent journal is configured
grep Storage /etc/systemd/journald.conf; ls -d /var/log/journal
# Storage=auto is persistent if /var/log/journal directory exists
```

[journalctl(1)](https://www.man7.org/linux/man-pages/man1/journalctl.1.html)
[journald.conf(5)](https://www.man7.org/linux/man-pages/man5/journald.conf.5.html)
