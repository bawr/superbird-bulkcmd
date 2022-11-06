#!/bin/bash
DIR=$(dirname "$(realpath "$0")")
UPDTOOL=$DIR/../bin/update

mkdir -p $DIR/dump
$UPDTOOL bulkcmd "amlmmc part 1"
#UPDTOOL mwrite dump/bootloader.dump store bootloader normal
$UPDTOOL mwrite dump/env.dump store env normal
#UPDTOOL mwrite dump/fip_a.dump store fip_a normal
#UPDTOOL mwrite dump/fip_b.dump store fip_b normal
#UPDTOOL mwrite dump/logo.dump store logo normal
#UPDTOOL mwrite dump/dtbo_a.dump store dtbo_a normal
#UPDTOOL mwrite dump/dtbo_b.dump store dtbo_b normal
#UPDTOOL mwrite dump/vbmeta_a.dump store vbmeta_a normal
#UPDTOOL mwrite dump/vbmeta_b.dump store vbmeta_b normal
#UPDTOOL mwrite dump/boot_a.dump store boot_a normal
#UPDTOOL mwrite dump/boot_b.dump store boot_b normal
#UPDTOOL mwrite dump/misc.dump store misc normal
#UPDTOOL mwrite dump/settings.dump store settings normal
#UPDTOOL mwrite dump/system_a.dump store system_a normal
#UPDTOOL mwrite dump/system_b.dump store system_b normal
#UPDTOOL mwrite dump/data.dump store data normal
