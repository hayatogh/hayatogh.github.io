---
title: "Calling Convention"
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

x86\_64

    Integer registers:
      rdi, rsi, rdx, rcx, r8, r9: First six argument values
      rax: Return value up to 64 bits
      rdx: Higher 64 bits of return value of 128 bits
           rdi will be a pointer to the return value storage if it exceeds 128 bits

    Floating-Point registers:
      xmm0-xmm7: Argument and return values

    rbx, rsp, rbp, r12-r15: callee saved registers
    rax, rdi, rsi, rdx, rcx, r8-r11: caller saved registers

[Calling Conventions - OSDev Wiki](https://wiki.osdev.org/Calling_Conventions)\
[x86 calling conventions - Wikipedia](https://en.wikipedia.org/wiki/X86_calling_conventions#x86-64_calling_conventions)


AArch64

    General-purpose (integer) registers:
      x0-x7: Argument and result values
      x9-x15: Caller saved registers
      x19-x28: Callee saved registers

    Floating-Point registers:
      v0-v7: Argument and result values
      v8-v15: Callee saved registers, but only for the bottom 64 bits
      v16-v31: Caller saved registers

[6   The Base Procedure Call Standard - Procedure Call Standard for the Arm® 64-bit Architecture (AArch64)](https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst#the-base-procedure-call-standard)\
[Calling convention - Wikipedia](https://en.wikipedia.org/wiki/Calling_convention#ARM_(A64))
