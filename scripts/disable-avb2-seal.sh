#!/bin/sh

DIR=$(dirname $(realpath $0))
UPDTOOL=$DIR/../bin/update

$UPDTOOL bulkcmd 'amlmmc env'
$UPDTOOL bulkcmd 'setenv bootcmd run storeboot'
$UPDTOOL bulkcmd 'setenv initargs ${initargs_default} ro root=/dev/mmcblk0p14'
$UPDTOOL bulkcmd 'setenv storeargs ${storeargs_default} setenv avb2 0\;'
$UPDTOOL bulkcmd 'env save'
