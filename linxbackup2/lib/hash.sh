
function simplhashfile(){
  thead=$1
  fn=$2
  dfn=$3
  if [ -d $fn ] ; then
#     echo "$(date +%Y-%m-%d-%H-%M-%S)  $1  create md5: $3" >> $FLOGT
    echo "$(date +%Y-%m-%d-%H-%M-%S)  $1  create md5: $3"
    set -- $(md5sum $fn 2>> $FLOGE);
    echo $1 $dfn > $BACKUPFILE/$dfn.md5sum
  fi
}
    
function defhashfile(){
  if [[ $HASHING ]] ; then
#     echo "$(date +%Y-%m-%d-%H-%M-%S)  $1  create md5: $2" >> $FLOGT
    echo "$(date +%Y-%m-%d-%H-%M-%S)  $1  create md5: $2"
    rm $BACKUPFILE/$3.md5sum
    if [ -d "$2" ] ; then
      createhashpf $2 $3
    elif [ -f "$2" ]; then
      md5sum $2 >> $BACKUPFILE/$3.md5sum 2>> $FLOGE
    else
      echo "error create hash for $2" >> $FLOGE
    fi
  fi
}

function createhashpf(){
  if [[ $HASHING ]] ; then
    lsfiles=$(ls -d $1/* 2>> $FLOGE)
    if [[ $lsfiles ]]
    then
      for fn in $lsfiles
      do
        if [ -d $fn ] ; then
          createhashpf $fn $2
        elif [ -f $fn ]; then
          md5sum $fn >> $BACKUPFILE/$2.md5sum 2>> $FLOGE
        else
          echo "error create hash for $1" >> $FLOGE
        fi
      done
    fi
  fi
}
