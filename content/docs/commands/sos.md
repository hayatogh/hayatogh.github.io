---
title: "sos"
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

## How to generate sos repot

```bash
# Basic usage
sudo sos report --batch

# Single threaded, with less performance impact
sudo sos report --batch --threads=1

# Collect all possible logs, increasing the size much more
sudo sos report --batch --all-logs
```

By default, the sos report is saved to
```
/var/tmp/sosreport-HOSTNAME-YYYY-MM-DD-xxxxxxx.tar.xz
```
and if configured like below,
```
$ grep tmp-dir /etc/sos/sos.conf
tmp-dir = /tmp
```
it will be saved to
```
/tmp/sosreport-HOSTNAME-YYYY-MM-DD-xxxxxxx.tar.xz
```

## Getting basic system information from sos report

- Machine model

  `cat sys/devices/virtual/dmi/id/product_name`

- CPU model

  `grep -m1 'model name' proc/cpuinfo`

- Memory size

  `cat sos_commands/memory/free_-m`


## Tips

- `rg` and `fd` to locate command results if you are not sure whether what you want is
  collected in the sos report.  Some commands are executed a few times with different arguments.

- Sos reports contain 0400 directories like sysfs, which prevent you from deleting them with
  `rm -rf`.

  `chmod -R 700 sosreport-XX` to fix that.

- Check real disks when the sos report was taken if you are referencing other resources, because
  `sdX` is assigned as recognized and they may vary from other sos reports or vmcores.

  `less sos_commands/block/lsblk`

- Beware that sos reports contain cyclic symlinks, again in sysfs.
  Your tools might run into an infinite loop traversing directories.


## Links


[sos(1)](https://manpages.debian.org/unstable/sos/sos.1.en.html)
[sos-report(1)](https://manpages.debian.org/unstable/sos/sos-report.1.en.html)
[sos.conf(5)](https://manpages.debian.org/unstable/sos/sos.conf.5.en.html)

[sos - GitHub](https://github.com/sosreport/sos)
