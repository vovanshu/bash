function defbk1(){
	if [[ -n "$PARH"  ]]; then
		if [[ $(grep "$srcproc" $TMPPATH/proc.log) ]]; then
			logtt earh $1 $3
		else
			defarh $1 "$2" $3 $4 $5 $5 $6 $7
		fi
	else
		defarh $1 "$2" $3 $4 $5 $5 $6 $7
	fi
}

function defbk(){ 
# 	if [[ $HASHLIST ]] ; then
#     defhashfile $1 $2 $3.list >> $FLOGT
#   fi
#   randnum
  local stdtime=$(date +%Y-%m-%d-%H-%M-%S)

	logtt csta $1 $3
	local MSGPV="$stdtime  $1  $3"

#   sleep $RANDNUM

	local app="tar"
	local excl="--exclude-from=$fileexclude"
	
	if [[ $4 ]]; then
		excl+=" --exclude-from=$4"
  fi
  if [[ $5 ]]; then
		excl+=" --exclude-from=$5"
  fi
	if [[ $6 ]]; then
		excl+=" --exclude-from=$6"
  fi
	if [[ $7 ]]; then
		excl+=" --exclude-from=$7"
  fi

	local sdu=$(du -sb $excl --exclude-from=$CFGPATH/du.exlude.list ./$2)
	echo $sdu >> $LSPATH/sizes.list
	local dsize=$(echo $sdu | awk '{print $1}')

	if [ -e $BACKUPFILE/$3$EXTS ] ; then
		rm $BACKUPFILE/$3$EXTS
	fi
	
	case "$progress" in
		pv)	
			$app $excl -cvvjpf - ./$2 2>> $FLOG 3>> $FLOGE | (pv -l -cN "$MSGPV" -p --timer --rate --bytes > $BACKUPFILE/$3$EXTS)
		;;
		pv2)
			$app $excl -cvvpf - ./$2 2>> $FLOG 3>> $FLOGE | pv -cN "$MSGPV" -s $dsize -w 100 | bzip2 -9 > $BACKUPFILE/$3$EXTS
				tar -cvvjpf - ./$2 2>> $FLOG 3>> $FLOGE | pv -cN "$MSGPV" -s $dsize > $BACKUPFILE/$3$EXTS
		;;
		*)
			$app $excl -cvvjpf $BACKUPFILE/$3$EXTS ./$2 >> $FLOG 2>> $FLOG
		;;
	esac

	logtt cend $1 $3
#   if [[ $HASHSELF ]] ; then
#     simplhashfile $1 $BACKUPFILE/$3$EXTS $3$EXTS >> $FLOGT
#   fi
  
}
