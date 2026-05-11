---
title: "cron"
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

- Jobs starts at +1 sec.
- Cares must be taken for SHELL and PATH.
- No reloading is needed after editing crontabs with ISC cron and cronie.

[cron(8)](https://www.man7.org/linux/man-pages/man8/cron.8.html) daemon man page.

[crontab(1)](https://www.man7.org/linux/man-pages/man1/crontab.1.html)
defines and stores user crontab in /var/spool/cron.

[crontab(5)](https://www.man7.org/linux/man-pages/man5/crontab.5.html)
[anacrontab(5)](https://www.man7.org/linux/man-pages/man5/anacrontab.5.html)
file format manuals.

- Debian uses [Vixie cron](https://salsa.debian.org/debian/cron) and [anacron](https://salsa.debian.org/debian/anacron) in separate repositories.\
  Detailed Debian cron state is described in [Time-based job scheduling in Debian (cron and friends)](https://wiki.debian.org/cron/).
- Fedora uses [cronie](https://github.com/cronie-crond/cronie) for both.
- There is also systemd-cron; it utilizes systemd but is not in the official repository,
  which may be worth noting given its name.  The semantics may differ.
