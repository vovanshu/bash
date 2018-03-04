
echo $sizefs > $LSPATH/size.fs

logtt getinfo fdisk
fdisk -l > $LSPATH/fdisk.list

logtt getinfo blkid
blkid > $LSPATH/blkid.list

logtt getinfo "cp fstab"
cp $SRC/etc/fstab $LSPATH/fstab.list
