---
title: "udev"
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

## Remap mouse buttons with udev

udev allows simple key remap. Let's remap mouse back button to middle click.

Check device ID of the mouse to apply the remapping.
`sudo evtest` to list all input devices and pick the one your mouse event is shown.

In example below, the device path is `/dev/input/event2`,
vendor ID is 0x4a5 and product ID is 0x800a.

```text
$ sudo evtest
No device specified, trying to scan all of /dev/input/event*
Available devices:
/dev/input/event2:      BenQ ZOWIE BenQ ZOWIE Gaming Mouse
:
/dev/input/event3:      BenQ ZOWIE BenQ ZOWIE Gaming Mouse
:
Select the device event number [0-26]: 2
Input driver version is 1.0.1
Input device ID: bus 0x3 vendor 0x4a5 product 0x800a version 0x111
Input device name: "BenQ ZOWIE BenQ ZOWIE Gaming Mouse"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 272 (BTN_LEFT)
    Event code 273 (BTN_RIGHT)
    Event code 274 (BTN_MIDDLE)
    Event code 276 (BTN_EXTRA)
  Event type 2 (EV_REL)
    Event code 0 (REL_X)
    Event code 1 (REL_Y)
    Event code 8 (REL_WHEEL)
    Event code 11 (REL_WHEEL_HI_RES)
  Event type 4 (EV_MSC)
    Event code 4 (MSC_SCAN)
Properties:
Testing ... (interrupt to exit)
Event: time 1778497773.008326, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90001
Event: time 1778497773.008326, type 1 (EV_KEY), code 272 (BTN_LEFT), value 1
Event: time 1778497773.008326, -------------- SYN_REPORT ------------
Event: time 1778497773.150356, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90001
Event: time 1778497773.150356, type 1 (EV_KEY), code 272 (BTN_LEFT), value 0
Event: time 1778497773.150356, -------------- SYN_REPORT ------------
Event: time 1778497773.774371, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90002
Event: time 1778497773.774371, type 1 (EV_KEY), code 273 (BTN_RIGHT), value 1
Event: time 1778497773.774371, -------------- SYN_REPORT ------------
Event: time 1778497773.908363, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90002
Event: time 1778497773.908363, type 1 (EV_KEY), code 273 (BTN_RIGHT), value 0
Event: time 1778497773.908363, -------------- SYN_REPORT ------------
Event: time 1778497776.006401, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90003
Event: time 1778497776.006401, type 1 (EV_KEY), code 274 (BTN_MIDDLE), value 1
Event: time 1778497776.006401, -------------- SYN_REPORT ------------
Event: time 1778497776.224402, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90003
Event: time 1778497776.224402, type 1 (EV_KEY), code 274 (BTN_MIDDLE), value 0
Event: time 1778497776.224402, -------------- SYN_REPORT ------------
Event: time 1778497777.604428, type 2 (EV_REL), code 8 (REL_WHEEL), value -1
Event: time 1778497777.604428, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES), value -120
Event: time 1778497777.604428, -------------- SYN_REPORT ------------
Event: time 1778497778.330435, type 2 (EV_REL), code 8 (REL_WHEEL), value 1
Event: time 1778497778.330435, type 2 (EV_REL), code 11 (REL_WHEEL_HI_RES), value 120
Event: time 1778497778.330435, -------------- SYN_REPORT ------------
Event: time 1778497783.102230, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90004
Event: time 1778497783.102230, type 1 (EV_KEY), code 274 (BTN_MIDDLE), value 1
Event: time 1778497783.102230, -------------- SYN_REPORT ------------
Event: time 1778497783.238216, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90004
Event: time 1778497783.238216, type 1 (EV_KEY), code 274 (BTN_MIDDLE), value 0
Event: time 1778497783.238216, -------------- SYN_REPORT ------------
Event: time 1778497789.774687, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90005
Event: time 1778497789.774687, type 1 (EV_KEY), code 276 (BTN_EXTRA), value 1
Event: time 1778497789.774687, -------------- SYN_REPORT ------------
Event: time 1778497789.918678, type 4 (EV_MSC), code 4 (MSC_SCAN), value 90005
Event: time 1778497789.918678, type 1 (EV_KEY), code 276 (BTN_EXTRA), value 0
Event: time 1778497789.918678, -------------- SYN_REPORT ------------
^C
```

Once the vendor ID and product ID are found, add hwdb file and rules file.

Below is applying the same rule for two product IDs.
Note that hwdb file has single space indentation.

```text
$ sudoedit /etc/udev/hwdb.d/71-mouse-local.hwdb
$ cat /etc/udev/hwdb.d/71-mouse-local.hwdb
mouse:usb:v04a5p800a:*
mouse:usb:v04a5p8006:*
 KEYBOARD_KEY_90004=btn_middle
$ sudoedit /etc/udev/rules.d/99-mouse-remap.rules
$ cat /etc/udev/rules.d/99-mouse-remap.rules
SUBSYSTEM=="input", ATTRS{idVendor}=="04a5", ATTRS{idProduct}=="800[a6]", IMPORT{builtin}="keyboard"
```

Update hwdb, reload rules and re-plug devices.

```text
$ sudo systemd-hwdb update
$ sudo udevadm control --reload
$ sudo udevadm trigger /dev/input/event2
```

Check the remapping rule is running.

```text
$ sudo udevadm test /sys/class/input/event2 |& grep "builtin command 'keyboard'"
event2: /etc/udev/rules.d/99-mouse-remap.rules:1 Importing properties from results of builtin command 'keyboard'
```

Now the remapping should be working!


Hwdb examples are at
[hwdb(7)](https://www.man7.org/linux/man-pages/man7/hwdb.7.html) and
[systemd/hwdb.d/70-mouse.hwdb](https://github.com/systemd/systemd/blob/main/hwdb.d/70-mouse.hwdb)

Rules examples are at
[udev(7)](https://www.man7.org/linux/man-pages/man7/udev.7.html) and
[systemd/rules.d/70-mouse.rules](https://github.com/systemd/systemd/blob/main/rules.d/70-mouse.rules)

[udevadm(8)](https://www.man7.org/linux/man-pages/man8/udevadm.8.html)
