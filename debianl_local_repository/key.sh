#!/bin/bash

CURPATH=$(dirname $0)
if [[ $1 ]]
then
  PATH_LOCAL_REP=$1
else
  PATH_LOCAL_REP=$CURPATH
fi

cd $PATH_LOCAL_REP

dir=$PATH_LOCAL_REP/dists/xenial

gpg -bao $dir/Release.gpg $dir/Release

exit 0