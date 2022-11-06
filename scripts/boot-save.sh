#!/bin/sh
# Save the original uboot env vars.
# Enable burn mode with a USB host.

DIR=$(dirname $(realpath $0))
UPDTOOL=$DIR/../bin/update

$UPDTOOL bulkcmd 'amlmmc env'
$UPDTOOL bulkcmd 'setenv initargs_default ${initargs}'
$UPDTOOL bulkcmd 'setenv storeargs_default ${storeargs}'
$UPDTOOL bulkcmd 'env save'
