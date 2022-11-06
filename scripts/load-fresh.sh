#!/bin/bash
DIR=$(dirname "$(realpath "$0")")
UPDTOOL=$DIR/../bin/update
DUMP=dump-fresh
cd $DIR

[[ -d $DUMP ]] || exit 1

$UPDTOOL bulkcmd "amlmmc part 1"
$UPDTOOL mwrite $DUMP/bootloader.dump store bootloader normal
$UPDTOOL mwrite $DUMP/env.dump store env normal
$UPDTOOL mwrite $DUMP/fip_a.dump store fip_a normal
$UPDTOOL mwrite $DUMP/fip_b.dump store fip_b normal
$UPDTOOL mwrite $DUMP/logo.dump store logo normal
$UPDTOOL mwrite $DUMP/dtbo_a.dump store dtbo_a normal
$UPDTOOL mwrite $DUMP/dtbo_b.dump store dtbo_b normal
$UPDTOOL mwrite $DUMP/vbmeta_a.dump store vbmeta_a normal
$UPDTOOL mwrite $DUMP/vbmeta_b.dump store vbmeta_b normal
$UPDTOOL mwrite $DUMP/boot_a.dump store boot_a normal
$UPDTOOL mwrite $DUMP/boot_b.dump store boot_b normal
$UPDTOOL mwrite $DUMP/misc.dump store misc normal
$UPDTOOL mwrite $DUMP/settings.dump store settings normal
$UPDTOOL mwrite $DUMP/system_a.dump store system_a normal
$UPDTOOL mwrite $DUMP/system_b.dump store system_b normal
$UPDTOOL mwrite $DUMP/data.dump store data normal
