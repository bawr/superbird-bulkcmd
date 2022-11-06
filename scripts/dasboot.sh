#!/bin/sh
# Upload & boot kernel/ramdisk when U-Boot is in 'USB Burning' mode
set -e
set -u

DIR=$(dirname $(realpath $0))
UPDTOOL=$DIR/../bin/update

KERNEL=$DIR/../images/superbird.kernel.better.img
INITRD=$DIR/../images/superbird.initrd.better.img

KERNEL_SIZE=$(du --bytes $KERNEL | cut -f 1)
INITRD_SIZE=$(du --bytes $INITRD | cut -f 1)

KERNEL_SIZE=$(printf '0x%x' $KERNEL_SIZE)
INITRD_SIZE=$(printf '0x%x' $INITRD_SIZE)

cat $KERNEL $INITRD > dasboot.img
truncate -s 541110272 dasboot.img

KERNEL_ADDR=0x01080000
INITRD_ADDR=0x13000000
ENV=$DIR/env.txt
ENV_ADDR=0x13000000
ENV_SIZE=`printf "0x%x" $(stat -c %s $ENV)`

$UPDTOOL bulkcmd "amlmmc env"
$UPDTOOL write $ENV $ENV_ADDR
echo 'Import env'
$UPDTOOL bulkcmd "env import -t $ENV_ADDR $ENV_SIZE"
sleep 1
$UPDTOOL bulkcmd "amlmmc part 1"
echo 'System load'
#$UPDTOOL mwrite dasboot.img store system_b normal
echo 'Kernel load'
$UPDTOOL bulkcmd "amlmmc read system_b $KERNEL_ADDR 0x0 $KERNEL_SIZE"
sleep 1
echo 'Initrd load'
$UPDTOOL bulkcmd "amlmmc read system_b $INITRD_ADDR $KERNEL_SIZE $INITRD_SIZE"
sleep 1
echo 'Booting...'
$UPDTOOL bulkcmd "booti $KERNEL_ADDR $INITRD_ADDR"
sleep 1
