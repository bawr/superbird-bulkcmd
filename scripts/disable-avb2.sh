#!/bin/sh
# Disable AVB2 & dm-verity
# Define system_a (/dev/mmcblk0p14) as root partition (change to /dev/mmcblk0p15 for system_b).
# WARNING: This disables A/B boot mechanism.
# WARNING: This requires original uboot env vars saved by the boot-mode.sh script.
# Order of operations:
# 1. Enable burn mode.
# 2. Enable boot mode.
# 3. Ruin this script.
# 4. Reconnect device.
# 5. Upload the temporary kernel and get an adb the shell.
# 6. Push and execute enable-adb.sh.client over the shell.
# 7. Reconnect device.
# 8. Run disable-avb2-seal.sh to disable booting in burn mode.

DIR=$(dirname $(realpath $0))
UPDTOOL=$DIR/../bin/update

$UPDTOOL bulkcmd 'amlmmc env'
$UPDTOOL bulkcmd 'setenv bootcmd run storeboot'
$UPDTOOL bulkcmd 'setenv initargs ${initargs_default} ro root=/dev/mmcblk0p14'
$UPDTOOL bulkcmd 'setenv storeargs ${storeargs} setenv avb2 0\;'
$UPDTOOL bulkcmd 'env save'
