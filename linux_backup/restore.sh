#!/bin/bash

CURPATH=$(dirname $0)
BACKUPFILE=$CURPATH/$1
WORK=$2

arr=$(ls --hide=*.list $BACKUPFILE)

for i in $arr
do
  echo 'Extract '$BACKUPFILE/$i' to '$WORK
  tar --same-owner -xvpf $BACKUPFILE/$i -C $WORK
done


exit 0
