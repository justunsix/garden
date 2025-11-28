---
filetags: ":virtual-machine:virtualization:epubnote:"
id: d5050211-fbb7-4051-8ebd-e27d0775f90b
title: Virtualization, Virtual Machines
---

## Using QEMU

QEMU running (either, or):

- [Damn Small Linux](http://www.damnsmalllinux.md/) (embedded version
  for [running inside Windows via
  QEMU](http://www.pendrivelinux.com/run-damn-small-linux-in-windows/))
- Porteus running [QEMU
  Portable](http://lassauge.free.fr/qemu/QEMU_on_Windows.html)
- [Tiny Core](http://tinycorelinux.net/)
- [Ubuntu Core Snappy](https://developer.ubuntu.com/en/snappy/)

Qemu manager:

- OSLauncher Portable - run batch files in C:.com
- Related Levinux USB linux at
  <http://mikelev.in/wp_super_faq/how-can-you-make-a-really-portable-qemu/#>

e.g. command line execution for porteus

``` powershell

@ECHO OFF
REM ##############################################################################
REM (c) Eric Lassauge - December 2015
REM <lassauge {AT} users {DOT} sourceforge {DOT} net >
REM
REM ##############################################################################

REM This program is free software: you can redistribute it and/or modify
REM it under the terms of the GNU General Public License as published by
REM the Free Software Foundation, either version 3 of the License, or
REM (at your option) any later version.
REM
REM This program is distributed in the hope that it will be useful,
REM but WITHOUT ANY WARRANTY; without even the implied warranty of
REM MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
REM GNU General Public License for more details.
REM
REM You should have received a copy of the GNU General Public License
REM along with this program. If not, see <<http://www.gnu.org/licenses/>>

REM ##############################################################################
REM Exemple BAT script for starting qemu-system-ppc.exe on windows host with a
REM virtex-ml507 linux kernel
REM to test QEMU (See <http://wiki.qemu.org/Testing>)
REM Start qemu on windows.
REM QEMU_AUDIO_DRV=dsound or wav or none can be used. See qemu -audio-help.
SET QEMU_AUDIO_DRV=dsound
REM SDL_AUDIODRIVER=waveout or dsound can be used. Only if QEMU_AUDIO_DRV=sdl.
SET SDL_AUDIODRIVER=dsound
REM QEMU_AUDIO_LOG_TO_MONITOR=1 displays log messages in QEMU monitor.
SET QEMU_AUDIO_LOG_TO_MONITOR=1
REM ################################################
REM # Boot kernel:
REM # Use test-ppc/ppc.dtb as a device tree binary (dtb) image and pass it to the kernel on boot
REM # redirect the virtual serial port and the QEMU monitor to the console with the -nographic option
REM # Use <Ctrl-a c> to switch between the serial console and the monitor
REM ################################################

START qemu-system-x86_64.exe -L Bios -m 1024M ^

-hda porteus.img -cdrom Porteus-XFCE-v3.1-x86_64.iso -boot d

```

## See Also

- [Technology](../600-technology) -
  [Technology](id:9092eabf-f6f5-4775-b8aa-6e78e74880c3)

### Resources

- [debezium-tests/localdev.md at main · justunsix/debezium-tests ·
  GitHub](https://github.com/justunsix/debezium-tests/blob/main/localdev.md) -
  Virtual environments for developing with Debezium
