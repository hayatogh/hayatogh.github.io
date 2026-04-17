---
title: "objdump"
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
# Disassemble with source
objdump -S a.out

# Disassemble all
objdump -DS a.out

# ELF section information
readelf -a a.out
```

```bash
gcc -g -O0 -c a.c && objdump -drwCS a.o > od.S
#                             ^disassemble (implied by -S)
#                              ^relocation entries
#                               ^wider than 80 columns
#                                ^demangle for C++
#                                 ^source
```
```c
int callee(int a, int b)
{
	return a;
}

int main(void)
{
	int x;
	int y;
	callee(3, 7);
	return 0;
}
```
```
a.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <callee>:
int callee(int a, int b)
{
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	89 7d fc             	mov    %edi,-0x4(%rbp)
   7:	89 75 f8             	mov    %esi,-0x8(%rbp)
	return a;
   a:	8b 45 fc             	mov    -0x4(%rbp),%eax
}
   d:	5d                   	pop    %rbp
   e:	c3                   	ret

000000000000000f <main>:

int main(void)
{
   f:	55                   	push   %rbp
  10:	48 89 e5             	mov    %rsp,%rbp
	int x;
	int y;
	callee(3, 7);
  13:	be 07 00 00 00       	mov    $0x7,%esi
  18:	bf 03 00 00 00       	mov    $0x3,%edi
  1d:	e8 00 00 00 00       	call   22 <main+0x13>	1e: R_X86_64_PLT32	callee-0x4
	return 0;
  22:	b8 00 00 00 00       	mov    $0x0,%eax
}
  27:	5d                   	pop    %rbp
  28:	c3                   	ret
```
