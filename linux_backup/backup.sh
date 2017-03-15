#!/bin/bash

CURPATH=$(dirname $0)
fileexclude=$CURPATH/exlude.list
PARENT=$CURPATH
BACKUPFILE=$PARENT/$(date +%Y-%m-%d-%H-%M-%S)
WORK=$1

mkdir -p $BACKUPFILE

cd $WORK

fdisk -l > $BACKUPFILE/fdisk.list

blkid > $BACKUPFILE/blkid.list

tar --exclude='etc' --exclude='home' --exclude='usr' --exclude='var' --exclude-from=$fileexclude -cvzpf $BACKUPFILE/root.tar.gz ./
tar --exclude-from=$fileexclude -cvzpf $BACKUPFILE/etc.tar.gz ./etc
tar --exclude-from=$fileexclude -cvzpf $BACKUPFILE/home.tar.gz ./home
tar --exclude-from=$fileexclude -cvzpf $BACKUPFILE/var.tar.gz ./var
tar --exclude='usr/lib' --exclude='usr/share' --exclude-from=$fileexclude -cvzpf $BACKUPFILE/usr.tar.gz ./usr
tar --exclude-from=$fileexclude -cvzpf $BACKUPFILE/usr.lib.tar.gz ./usr/lib
tar --exclude-from=$fileexclude -cvzpf $BACKUPFILE/usr.share.tar.gz ./usr/share

exit 0