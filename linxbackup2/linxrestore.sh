#!/bin/bash
# script for extract compressed copy OS by Linux
# Скрипт для розпаковки сжатой копии ОС на Linux
# version 2.2
# Author Volodimir Shumeyko
#

SCRIPT=$(readlink -f "$0")
CURPATH=$(dirname $SCRIPT)

LIBPATH=$CURPATH/lib

libs=$(ls $LIBPATH/*.sh)
for lib in $libs
do
	source $lib
done

paramets $@

echo "$(date +%Y-%m-%d-%H-%M-%S)"

source $CFGPATH/linx.restore.cfg

wmsg info

echo "$(date +%Y-%m-%d-%H-%M-%S) start restore from $SRC" > $FLOGT
echo "$(date +%Y-%m-%d-%H-%M-%S) start restore from $SRC"

restoring

exit 0
