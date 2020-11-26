#!/bin/sh

IN="./linux-firmware-20200619"
OUT="./linux-firmware_NEW"

grep amd*17h $IN > $OUT
grep tu106 $IN >> $OUT
grep rtl8168h-2 $IN >> $OUT

