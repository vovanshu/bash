
function getpkglist(){

  echo "$(date +%Y-%m-%d-%H-%M-%S)  get full list allow and installed packeges"
  chroot $SRC apt list > $LSPATH/apt.list
  
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get full list installed packeges"
  chroot $SRC apt list --installed > $LSPATH/apt.installed.list
  
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get list installed packeges for --set-selections"
  chroot $SRC dpkg --get-selections | grep -v deinstall > $LSPATH/dpkg.deinstall.list
  
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get list policy packeges in repositores"
  chroot $SRC apt-cache policy > $LSPATH/apt.policy.list
  
}

function getsizefs(){

#   echo "$(date +%Y-%m-%d-%H-%M-%S)  calculate size" >> $FLOGT
  wmsg calcsizefs $(date +%Y-%m-%d-%H-%M-%S)
#   du --exclude-from=$CFGPATH/du.exlude.list -d 3 -b ./ > $LSPATH/size.fs
  local sfs=$(du --exclude-from=$CFGPATH/du.exlude.list -s -b ./)
  sizefs=$(echo $sfs | awk '{print $1}')
	
}

function preparebackuping(){
	
	if [ ! -d "$BACKUPFILE" ] ; then
		mkdir -p $BACKUPFILE
	fi
	if [ ! -d "$LOGPATH" ] ; then
		mkdir -p $LOGPATH
	fi
	if [ ! -d "$TMPPATH" ] ; then
		mkdir -p $TMPPATH
	fi
	if [ ! -d "$LSPATH" ] ; then
		mkdir -p $LSPATH
	fi

	echo "$(date +%Y-%m-%d-%H-%M-%S)  created backup path"
	echo "$(date +%Y-%m-%d-%H-%M-%S)  created backup path" > $FLOGT

# 	echo ""
}
