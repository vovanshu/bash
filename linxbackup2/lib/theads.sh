
function initheads(){
	if [[ $(ls $TMPPATH | grep .lck) ]]; then
		rm 	$TMPPATH/*.lck
	fi
	for ((nst=1; $nst <= $csteps; nst++)); do
		if [ $THEADS -ge $csteps ]; then
			theads ${steps[nst]} $nst $csteps $THEADS &	waitlock
		else
			for ((nth=1; $nth <= $THEADS; nth++)); do
				if [[ "${steps[nst]}" ]]; then
					theads ${steps[nst]} $nst $csteps $nth & waitlock
				fi
				if [[ $nth < $THEADS ]]; then
					nst=`expr $nst + 1`
				fi
			done
		fi
	done
	waitend
}

function theads(){
	echo "$1" > $TMPPATH/$2.lck
	echo "$2/$3($4) | $1" >> $LOGPATH/theads.log
  n="$2/$3($4)"
  srcproc=$1
  source $1
  rm $TMPPATH/$2.lck
  echo "$1" >> $TMPPATH/proc.log
}

function locksls(){
	local locksls=$(ls $TMPPATH/ | grep .lck)
	local index=0
	for lock in $locksls
		do
			local locks[index++]=$lock
	done
	local clocks=${#locks[*]}
	echo $clocks
}

function waitlock(){
	local clocks=$(locksls)
	while [[ "$clocks" -ge "$THEADS" ]]
	do
		local clocks=$(locksls)
	done
}

function waitend(){
	local clocks=$(locksls)
	while [[ "$clocks" -ge "1" ]]
	do
		local clocks=$(locksls)
	done
}

function proclog(){
	echo "test"
}
