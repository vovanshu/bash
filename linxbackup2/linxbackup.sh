#!/bin/bash
# script for create compress copy OS by Linux
# Скрипт для создания сжатой копии ОС на Linux
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

if [[ -n "$PARH"  ]]; then
	BACKUPFILE=$DEST/$PARH
else
	BACKUPFILE=$DEST/$(date +%Y-%m-%d-%H-%M-%S)
fi

source $CFGPATH/linx.backup.cfg

wmsg info
wmsg patharh

cd $SRC

getsizefs
# sizefs=1

if [[ -n "$PARH"  ]]; then
	esizefs=$(cat $LSPATH/size.fs)
# 	if [[ -z $(grep $sizefs $LSPATH/size.fs) ]] ; then
	if [[ "$sizefs" -ne "$esizefs" ]] ; then
		wmsg noeqsizefs
		exit 1
	fi
fi

if [ $(chfreefs $sizefs) -eq 1 ]; then

	stepsls=$(ls $STPATH/*.sh)

	index=1
	for st in $stepsls
			do
			if [ -f $st ] ; then
				steps[index++]=$st
			fi
	done

	csteps=${#steps[*]}

	if [[ -z "$PARH"  ]]; then
		preparebackuping
		logtt bsta
	else
		logtt bresm
	fi
	
	initheads
	logtt bend
else
	wmsg destnofreespmsg
fi

if [ -d "$TMPPATH" ] ; then
	rm -R $TMPPATH
fi

exit 0
