---
title: "pmap"
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

Examples
```text
$ pmap -x $$
9672:   -bash
Address           Kbytes     RSS   Dirty Mode  Mapping
000056528ae14000     188     188       0 r---- bash
000056528ae43000     804     804       0 r-x-- bash
000056528af0c000     224     120       0 r---- bash
000056528af44000      16      16      16 r---- bash
000056528af48000      36      36      36 rw--- bash
000056528af51000      44      28      28 rw---   [ anon ]
000056529141d000    2472    2412    2412 rw---   [ anon ]
00007f7d1c825000     360     128       0 r---- LC_CTYPE
:
00007f7d1cbeb000       8       8       0 r-x--   [ anon ]
00007f7d1cbed000       4       4       0 r---- ld-linux-x86-64.so.2
00007f7d1cbee000     160     160       0 r-x-- ld-linux-x86-64.so.2
00007f7d1cc16000      44      44       0 r---- ld-linux-x86-64.so.2
00007f7d1cc21000       8       8       8 r---- ld-linux-x86-64.so.2
00007f7d1cc23000       4       4       4 rw--- ld-linux-x86-64.so.2
00007f7d1cc24000       4       4       4 rw---   [ anon ]
00007ffe1c169000     132     112     112 rw---   [ stack ]
---------------- ------- ------- -------
total kB            8000    6232    2704


$ pmap -d $$
6999:   -bash
Address           Kbytes Mode  Offset           Device    Mapping
0000563bcefd7000     188 r---- 0000000000000000 103:00002 bash
0000563bcf006000     804 r-x-- 000000000002f000 103:00002 bash
0000563bcf0cf000     224 r---- 00000000000f8000 103:00002 bash
0000563bcf107000      16 r---- 0000000000130000 103:00002 bash
0000563bcf10b000      36 rw--- 0000000000134000 103:00002 bash
0000563bcf114000      44 rw--- 0000000000000000 000:00000   [ anon ]
0000563bdc9eb000    2568 rw--- 0000000000000000 000:00000   [ anon ]
00007fa480aad000     360 r---- 0000000000000000 103:00002 LC_CTYPE
:
00007fa480e71000       8 r---- 0000000000000000 000:00000   [ anon ]
00007fa480e73000       8 r-x-- 0000000000000000 000:00000   [ anon ]
00007fa480e75000       4 r---- 0000000000000000 103:00002 ld-linux-x86-64.so.2
00007fa480e76000     160 r-x-- 0000000000001000 103:00002 ld-linux-x86-64.so.2
00007fa480e9e000      44 r---- 0000000000029000 103:00002 ld-linux-x86-64.so.2
00007fa480ea9000       8 r---- 0000000000034000 103:00002 ld-linux-x86-64.so.2
00007fa480eab000       4 rw--- 0000000000036000 103:00002 ld-linux-x86-64.so.2
00007fa480eac000       4 rw--- 0000000000000000 000:00000   [ anon ]
00007ffcccc7e000     132 rw--- 0000000000000000 000:00000   [ stack ]
mapped: 8096K    writeable/private: 2868K    shared: 28K


$ pmap -xp $$
6999:   -bash
Address           Kbytes     RSS   Dirty Mode  Mapping
0000563bcefd7000     188     188       0 r---- /usr/bin/bash
0000563bcf006000     804     804       0 r-x-- /usr/bin/bash
0000563bcf0cf000     224     120       0 r---- /usr/bin/bash
0000563bcf107000      16      16      16 r---- /usr/bin/bash
0000563bcf10b000      36      36      36 rw--- /usr/bin/bash
0000563bcf114000      44      28      28 rw---   [ anon ]
0000563bdc9eb000    2568    2544    2544 rw---   [ anon ]
00007fa480aad000     360     184       0 r---- /usr/lib/locale/C.utf8/LC_CTYPE
:
00007fa480e73000       8       8       0 r-x--   [ anon ]
00007fa480e75000       4       4       0 r---- /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
00007fa480e76000     160     160       0 r-x-- /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
00007fa480e9e000      44      44       0 r---- /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
00007fa480ea9000       8       8       8 r---- /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
00007fa480eab000       4       4       4 rw--- /usr/lib/x86_64-linux-gnu/ld-linux-x86-64.so.2
00007fa480eac000       4       4       4 rw---   [ anon ]
00007ffcccc7e000     132     112     112 rw---   [ stack ]
---------------- ------- ------- -------
total kB            8096    6460    2836
```

[pmap(1)](https://man7.org/linux/man-pages/man1/pmap.1.html)
