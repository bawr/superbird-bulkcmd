#!/bin/sh
# Save the original uboot env vars.
# Enable burn mode with a USB host.

DIR=$(dirname $(realpath $0))
UPDTOOL=$DIR/../bin/update

$UPDTOOL bulkcmd 'amlmmc env'
$UPDTOOL bulkcmd 'setenv bootcmd run storeboot'
$UPDTOOL bulkcmd 'setenv storeargs ${storeargs_default} run update\;'
$UPDTOOL bulkcmd 'env save'
