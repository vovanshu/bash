#!/bin/bash

PARENT=$1
WORK=$2
EXT=.tar.bz
FLOG=$PARENT/restore.log
FLOGE=$PARENT/error.restore.log
FLOGC=$PARENT/clear.log
FLOGCE=$PARENT/error.clear.log

echo "$(date +%Y-%m-%d-%H-%M-%S) start restore from $PARENT" > $FLOG
echo "$(date +%Y-%m-%d-%H-%M-%S) start restore from $PARENT"

if [[ $3 ]]; then
  if [ $3 == 1 ]; then
    echo "$(date +%Y-%m-%d-%H-%M-%S) start clearing $WORK" >> $FLOGC
    echo "$(date +%Y-%m-%d-%H-%M-%S) start clearing $WORK"
    rm -Rv $WORK/* >> $FLOGC 2>> $FLOGCE
    echo "$(date +%Y-%m-%d-%H-%M-%S) end clearing $WORK"
    echo "$(date +%Y-%m-%d-%H-%M-%S) end clearing $WORK" >> $FLOGC
  fi
fi

arr=$( ls $PARENT | grep $EXT )

echo "$(date +%Y-%m-%d-%H-%M-%S) start extract" >> $FLOG
echo "$(date +%Y-%m-%d-%H-%M-%S) start extract"

for i in $arr
do
  echo "$(date +%Y-%m-%d-%H-%M-%S) extract $i to $WORK"
  tar --same-owner -xvpf $PARENT/$i -C $WORK >> $FLOG 2>> $FLOGE
done
echo "$(date +%Y-%m-%d-%H-%M-%S) end extract"

echo "$(date +%Y-%m-%d-%H-%M-%S) end restore"
echo "$(date +%Y-%m-%d-%H-%M-%S) end restore" >> $FLOG

exit 0
