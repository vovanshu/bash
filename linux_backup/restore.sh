#!/bin/bash

CURPATH=$(dirname $0)

/arh/backup/linx/linxrestore.sh $CURPATH/$1 /linx 1

exit 0
