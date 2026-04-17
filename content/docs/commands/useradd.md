---
title: "useradd"
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
# Add NEWUSER
useradd -m NEWUSER
passwd NEWUSER

# Add USER to a GROUP
usermod -aG GROUP USER
gpasswd -a USER GROUP

# Delete USER from a GROUP
gpasswd -d USER GROUP

# Delete USER
userdel -r USER

# Make password shadow entry to use in automated installs
mkpasswd
mkpasswd -m yescrypt

# Re-generate shadow entry from algorithm and password with crypt(3)
mkpasswd -S '$y$j9T$SALT$'
# Or
read -rsp'Password: ' PLAIN
printf $PLAIN | perl -le 'print crypt(<STDIN>, "\$y\$j9T\$SALT\$")'
```

[passwd(5)](https://www.man7.org/linux/man-pages/man5/passwd.5@@shadow-utils.html)
[shadow(5)](https://www.man7.org/linux/man-pages/man5/shadow.5.html)
from shadow-utils

[passwd(5)](https://www.man7.org/linux/man-pages/man5/passwd.5.html) from the man-pages project

[crypt(5)](https://manpages.debian.org/unstable/libcrypt-dev/crypt.5.en.html)
[crypt(3)](https://manpages.debian.org/unstable/libcrypt-dev/crypt.3.en.html)
from [libxcrypt](https://github.com/besser82/libxcrypt)\
You should be using libxcrypt since glibc libcrypt is [deprecated](https://sourceware.org/legacy-ml/libc-alpha/2017-08/msg01257.html).

[mkpasswd(1)](https://manpages.debian.org/unstable/whois/mkpasswd.1.en.html) from [whois](https://github.com/rfc1036/whois)
