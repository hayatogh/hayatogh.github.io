---
title: "ps"
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

```text
# ww for unlimited width suitable for less and watch
$ ps auxww
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0  24408 15476 ?        Ss   22:01   0:00 /sbin/init
root           2  0.0  0.0      0     0 ?        S    22:01   0:00 [kthreadd]
                 ^CPU time used/Process running time
                      ^RSS/Physical memory
                              ^VSZ in KiB (including code, data and shared libraries)
                                    ^RSS in KiB (shared libraries are counted on each process)
                                                 ^PROCESS STATE CODES
                                                      ^Time or date started
                                                              ^cpu time of user+sys

# m to show as threads
$ ps auxwwm
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  0.0  0.0  24408 15476 ?        -    22:01   0:00 /sbin/init
root           -  0.0    -      -     - -        Ss   22:01   0:00 -

# l for BSD long format
$ ps alxww
F   UID     PID    PPID PRI  NI    VSZ   RSS WCHAN  STAT TTY        TIME COMMAND
4     0       1       0  20   0  24408 15476 -      Ss   ?          0:00 /sbin/init
1     0       2       0  20   0      0     0 -      S    ?          0:00 [kthreadd]
                        ^nice+20, unchanged with CFS
                             ^nice
                                             ^kernel function the process sleeping on

$ ps axo pid,ppid,user,group,lwp,nlwp,start_time,comm,cgroup
    PID    PPID USER     GROUP        LWP NLWP START COMMAND         CGROUP
      1       0 root     root           1    1 22:01 systemd         0::/init.scope
                                      ^Thread ID (Light weight process ID)
                                          ^the Number of LWP

$ ps axo flags,state,uid,pid,ppid,pgid,sid,cls,pri,addr,sz,wchan,stime,tty,time,cmd
F S   UID     PID    PPID    PGID     SID CLS PRI ADDR    SZ WCHAN  STIME TT           TIME CMD
4 R  1000    3569    3489    3569    3489  TS  19    -  2040 -      22:24 pts/2    00:00:00 ps axo flags,sta...
  ^the first char of 'STAT'
                                      ^session ID = the PID of the session leader
                                          ^scheduling class
                                                          ^process image size
                                                                    ^== START
                                                                          ^tty


From man ps: (state codes have been added on later ps command)
PROCESS FLAGS
       The sum of these values is displayed in the "F" column, which is
       provided by the flags output specifier:

               1    forked but didn't exec
               4    used super-user privileges

PROCESS STATE CODES
       Here are the different values that the s, stat and state output
       specifiers (header "STAT" or "S") will display to describe the state of
       a process:

               D    uninterruptible sleep (usually IO)
               I    Idle kernel thread
               R    running or runnable (on run queue)
               S    interruptible sleep (waiting for an event to complete)
               T    stopped by job control signal
               t    stopped by debugger during the tracing
               W    paging (not valid since the 2.6.xx kernel)
               X    dead (should never be seen)
               Z    defunct ("zombie") process, terminated but not reaped by
                    its parent

       For BSD formats and when the stat keyword is used, additional characters
       may be displayed:

               <    high-priority (not nice to other users)
               N    low-priority (nice to other users)
               L    has pages locked into memory (for real-time and custom IO)
               s    is a session leader
               l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads
                    do)
               +    is in the foreground process group
```

[ps(1)](https://man7.org/linux/man-pages/man1/ps.1.html)

[Upstream Git](https://gitlab.com/procps-ng/procps)
