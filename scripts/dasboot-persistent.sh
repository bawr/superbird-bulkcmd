#!/bin/sh
DIR=$(dirname $(realpath $0))
UPDTOOL=$DIR/../bin/update

$UPDTOOL bulkcmd 'amlmmc env'
$UPDTOOL bulkcmd 'setenv bootcmd boot_cooling'
$UPDTOOL bulkcmd 'setenv bootcmd ${bootcmd}\; run storeargs'
$UPDTOOL bulkcmd 'setenv bootcmd ${bootcmd}\; setenv avb2 0'
$UPDTOOL bulkcmd 'setenv bootcmd ${bootcmd}\; amlmmc part 1'
$UPDTOOL bulkcmd 'setenv bootcmd ${bootcmd}\; amlmmc read system_b 0x01080000 0x0000000 0x1087200'
$UPDTOOL bulkcmd 'setenv bootcmd ${bootcmd}\; amlmmc read system_b 0x13000000 0x1087200 0x02A8C6F'
$UPDTOOL bulkcmd 'setenv bootcmd ${bootcmd}\; booti 0x01080000 0x13000000'
$UPDTOOL bulkcmd 'setenv initargs ${initargs_default} ro root=/dev/mmcblk0p14 androidboot.slot_suffix=_a'
$UPDTOOL bulkcmd 'env save'
