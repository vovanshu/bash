
function defextr(){

	echo "$(date +%Y-%m-%d-%H-%M-%S) $3/$2 extract $1 to $DEST" >> $FLOGT
  echo "$(date +%Y-%m-%d-%H-%M-%S) $3/$2 extract $1 to $DEST"
  pv $SRC/$1 | tar --same-owner -xvvjp -C $DEST >> $FLOG 2>> $FLOGE
  
}

function prepdestrestoring(){
	if [[ $3 ]]; then
		if [ $3 == 1 ]; then
			echo "$(date +%Y-%m-%d-%H-%M-%S) start clearing $WORK" >> $FLOGC
			echo "$(date +%Y-%m-%d-%H-%M-%S) start clearing $WORK"
			rm -Rv $WORK/* >> $FLOGC 2>> $FLOGCE
			echo "$(date +%Y-%m-%d-%H-%M-%S) end clearing $WORK"
			echo "$(date +%Y-%m-%d-%H-%M-%S) end clearing $WORK" >> $FLOGC
		fi
	fi
}

function restoring(){

	stepsls=$( ls $SRC | grep $EXTS )

	index=1
	for st in $stepsls
			do
			if [ -f $SRC/$st ] ; then
				steps[index++]=$SRC/$st
			fi
	done
	
	csteps=${#steps[*]}

	echo "$(date +%Y-%m-%d-%H-%M-%S) start extract" >> $FLOGT
	echo "$(date +%Y-%m-%d-%H-%M-%S) start extract"
	
	nst=1
	
	for stf in $stepsls
	do
		defextr $stf $csteps $nst
		nst=`expr $nst + 1`
	done
	echo "$(date +%Y-%m-%d-%H-%M-%S) end extract"

	echo "$(date +%Y-%m-%d-%H-%M-%S) end restore"
	echo "$(date +%Y-%m-%d-%H-%M-%S) end restore" >> $FLOGT

}
