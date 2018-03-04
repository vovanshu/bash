
function randnum(){
  
  if [[ $1 ]] 
	then
		local BEG=$1
	else
		local BEG=1
	fi

  if [[ $2 ]] 
	then
		local END=$2
	else
		local END=10
	fi

  RANDOM=`tr -cd 0-9 </dev/urandom | head -c 4 | sed -e 's/^00*//'`
  
  RANDNUM=$((($RANDOM%$END)+1))
  
}

function logtt(){
	local ctime=$(date +%Y-%m-%d-%H-%M-%S)
	wmsg $1 $ctime "$2" "$3" "$4" "$5" >> $FLOGT
	wmsg $1 $ctime "$2" "$3" "$4" "$5"
}

function wmsg(){
	source $CURPATH/l18n/$curlng/$1.msg
}

function dirempty(){
  if [[ $(ls $1) ]]
  then
    echo 'false'
  else
    echo 'true'
  fi
}

function paramets(){

	while [ -n "$1" ]
	do
		case "$1" in
			-i) SRC="$2"
			shift ;;
			-d) DEST="$2"
			shift ;;
			-c) CFGPATH="$2"
			shift ;;
			-t) THEADS="$2"
			shift ;;
			-a) PARH="$2"
			shift ;;
			*) echo "$1 option not support";;
		esac
		shift
	done
	
	if [[ ! -n "$THEADS" ]] 
	then
		THEADS=2
	fi

	if [[ ! -n "$CFGPATH" ]] 
	then
		CFGPATH=$CURPATH/etc
	fi
	
	source $CFGPATH/curlng.cfg

	if [[ -z "$SRC" || ! -e "$SRC" || -z "$DEST" ]]
	then
		wmsg help
		exit 0
	fi

}

function skipmsg(){
	logtt csckip $1 $2 $3
}

function getfullsize(){
	local IFS="
"
	local sizes=$(cat $LSPATH/sizes.list)
	local gsz=0
	for sz in $sizes
 		do
			csz=$(echo $sz | awk '{print $1}')
			gsz=`expr $gsz + $csz`
	done

	echo $gsz > $LSPATH/fsize.list

}

function chfreefs(){

	local ndfs
	let "ndfs = $1 / minstorage"
	local avfsr=$(df -B1 --output=avail $DEST)
	
	local avfs=$(echo $avfsr | awk '{print $2}')
	
	if [ $avfs -gt $ndfs ]
	then
		echo 1
	else
		echo 0
	fi
	
}
