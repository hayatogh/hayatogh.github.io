---
title: "errno"
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

Errno is a thread-local variable.
Pthread functions return error number on failure instead of setting errno.

Error handling C macros and functions
```c
#include <err.h>
#include <errno.h>
#define errc(eval, code, fmt, ...) do {		\
	errno = code;				\
	err(eval, fmt, ##__VA_ARGS__);		\
} while (0)
err(EXIT_FAILURE, msg);
errc(EXIT_FAILURE, en, msg)

/*
 * errc is a BSD utility function.  If you don't define like above,
 * you may have to install libbsd-dev and
 * $ cc main.c $(pkg-config --cflags --libs libbsd-overlay)
 * or include as <bsd/err.h>.
 */
#include <err.h>
err(EXIT_FAILURE, msg);
errc(EXIT_FAILURE, en, msg)

/*
 * handle_error and handle_error_en are obtained from Linux man-pages project.
 * Commit 0e7a39804a3c replaced them with err and errc respectively.
 */
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#define handle_error(msg) \
	do { perror(msg); exit(EXIT_FAILURE); } while (0)
#define handle_error_en(en, msg) \
	do { errno = en; perror(msg); exit(EXIT_FAILURE); } while (0)

/* dlerror handling */
#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>
#define handle_dlerror() \
	do { fprintf(stderr, "%s\n", dlerror()); exit(EXIT_FAILURE); } while (0)
```

Commands to see errno names and descriptions
```bash
# search
errno ESRCH
errno 3

# list
errno -l
echo '#include <errno.h>' | cc -E -dM -xc - | grep 'define\sE'
# list except ENOTSUP
less /usr/include/asm-generic/errno-base.h
less /usr/include/asm-generic/errno.h
grep -h 'define\sE' /usr/include/asm-generic/errno{-base,}.h
```
