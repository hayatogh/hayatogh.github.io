---
title: "rpmbuild"
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

Workflow example
```bash
# Install under HOME
rpm -i kernel-*.src.rpm

# Untar and apply patch
cd ~/rpmbuild
rpmbuild -bp SPECS/kernel.spec

# Save original tree
cd ~/rpmbuild/BUILD/kernel-*
cp -ax --reflink linux-* orig

# Edit and create patch
vi linux-*/file/to/modify
diff -Nurp orig linux-* >~/rpmbuild/SOURCES/linux-kernel-test.patch

# Edit build id
cd ~/rpmbuild
vi SPECS/kernel.spec
# =>
# %define buildid .local

# Build binary
rpmbuild -bb --target x86_64 --with baseonly --without debuginfo SPECS/kernel.spec
# Or build all
rpmbuild -ba --target x86_64 --with baseonly SPECS/kernel.spec

# Check generated RPM files
ls ~/rpmbuild/{RPMS,SRPMS}
```

~/.rpmmacros
```
# Use ramdisk instead of ~/rpmbuild
%_topdir	/mnt/ramdisk
```
