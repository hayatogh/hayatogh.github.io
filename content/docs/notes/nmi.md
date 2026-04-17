---
title: "NMI"
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

- NMI (Non-Maskable Interrupt) trigger sources:
  - Physical NMI button press
  - BMC (Baseboard Management Controller) signals
  - Hardware failure detection
  - IPMI (Intelligent Platform Management Interface) signals from facing clusters

- IPMI is the standard for out-of-band management, with the BMC as the main controller.
- NMIs are held pending during firmware execution when EFI calls transition the execution context.
- MCE (machine check exception) is another type of signal when hardware failure occurs.
- Clustering environments require disabling watchdogs to ensure proper fencing via NMI.

[Non Maskable Interrupt - OSDev Wiki](https://wiki.osdev.org/Non_Maskable_Interrupt)

[Intelligent Platform Management Interface - Wikipedia](https://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface)

[The Linux IPMI Driver — The Linux Kernel documentation](https://www.kernel.org/doc/html/latest/driver-api/ipmi.html)

[Machine-check exception - Wikipedia](https://en.wikipedia.org/wiki/Machine-check_exception)

[30.6. Configurable sysfs parameters for the x86-64 machine check code — The Linux Kernel documentation](https://www.kernel.org/doc/html/latest/arch/x86/x86_64/machinecheck.html)
