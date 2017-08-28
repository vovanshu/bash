#!/bin/bash
# script for create compress copy OS by Linux
# Скрипт для создания сжатой копии ОС на Linux
# version 2.2
# Author Volodimir Shumeyko
#

MAXPARAMS=2

if [ $# -lt "$MAXPARAMS" ];
then
echo
echo "Использование: `basename $0` папка-источник папка-назначение (папка с настройками, не обязательно)"
echo
exit 0
fi

if [ $# -gt "$MAXPARAMS" ];
then
echo
echo "Для этого скрипта нужно только $MAXPARAMS аргументов командной строки!"
echo
exit 0
fi

CURPATH=$(dirname $0)
if [[ $3 ]] 
then
  CFGPATH=$3
else
  CFGPATH=$CURPATH/cfg
fi
PARENT=$2
fileexclude=$CFGPATH/exlude.list
BACKUPFILE=$PARENT/$(date +%Y-%m-%d-%H-%M-%S)
FLOG=$BACKUPFILE/backup.log
FLOGT=$BACKUPFILE/timer.log
FLOGE=$BACKUPFILE/error.backup.log
EXTS=.tar.bz
WORK=$1
HASHING=1
# HASHLIST=1
HASHSELF=1

function preparebackuping(){
  mkdir -p $BACKUPFILE
  echo "$(date +%Y-%m-%d-%H-%M-%S)  make backup path"
  echo "$(date +%Y-%m-%d-%H-%M-%S)  make backup path" > $FLOGT
  echo "$(date +%Y-%m-%d-%H-%M-%S)  goin to destine" >> $FLOGT
  echo "$(date +%Y-%m-%d-%H-%M-%S)  goin to destine"
  cd $WORK
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get fdisk info" >> $FLOGT
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get fdisk info"
  fdisk -l > $BACKUPFILE/fdisk.list
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get blkid info" >> $FLOGT
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get blkid info"
  blkid > $BACKUPFILE/blkid.list
  echo "$(date +%Y-%m-%d-%H-%M-%S)  calculate size" >> $FLOGT
  echo "$(date +%Y-%m-%d-%H-%M-%S)  calculate size"
  du --exclude-from=$CFGPATH/du.exlude.list -d 2 -b ./ > $BACKUPFILE/sizes.list
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get full list allow and installed packeges"
  chroot $WORK apt list > $BACKUPFILE/apt.list
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get full list installed packeges"
  chroot $WORK apt list --installed > $BACKUPFILE/apt.installed.list
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get list installed packeges for --set-selections"
  chroot $WORK dpkg --get-selections | grep -v deinstall > $BACKUPFILE/dpkg.deinstall.list
  echo "$(date +%Y-%m-%d-%H-%M-%S)  get list policy packeges in repositores"
  chroot $WORK apt-cache policy > $BACKUPFILE/apt.policy.list
}

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

function defbk(){
  if [[ $HASHLIST ]] ; then
    defhashfile $1 $2 $3.list >> $FLOGT
  fi
  echo "$(date +%Y-%m-%d-%H-%M-%S)  $1  compress beg $3" >> $FLOGT
  echo "$(date +%Y-%m-%d-%H-%M-%S)  $1  compress beg $3"
  if [[ $6 ]]
  then
    tar --exclude-from=$6 --exclude-from=$5 --exclude-from=$4 --exclude-from=$fileexclude -cvjpf $BACKUPFILE/$3$EXTS ./$2 >> $FLOG 2>> $FLOGE
  elif [[ $5 ]]
  then
    tar --exclude-from=$5 --exclude-from=$4 --exclude-from=$fileexclude -cvjpf $BACKUPFILE/$3$EXTS ./$2 >> $FLOG 2>> $FLOGE
  elif [[ $4 ]]
  then
    tar --exclude-from=$4 --exclude-from=$fileexclude -cvjpf $BACKUPFILE/$3$EXTS ./$2 >> $FLOG 2>> $FLOGE
  else
    tar --exclude-from=$fileexclude -cvjpf $BACKUPFILE/$3$EXTS ./$2 >> $FLOG 2>> $FLOGE
  fi
  echo "$(date +%Y-%m-%d-%H-%M-%S)  $1  compress end $3"
  echo "$(date +%Y-%m-%d-%H-%M-%S)  $1  compress end $3" >> $FLOGT
  if [[ $HASHSELF ]] ; then
    simplhashfile $1 $BACKUPFILE/$3$EXTS $3$EXTS >> $FLOGT
  fi
}

function homebk(){
  lshome=$(ls ./home)
  if [[ $lshome ]]
  then
    for un in $lshome
    do
    
      defbk $1 "home/$un" "home.$un" "$CFGPATH/parts.home.exlude.list" "$CFGPATH/exlude.home.list"
      if [ -d "./home/$un/.kodi" ] ; then
        defbk $1 "home/$un/.kodi" "home.$un.kodi"
      fi
      if [ -d "./home/$un/.thunderbird" ] ; then    
        defbk $1 "home/$un/.thunderbird" "home.$un.thunderbird"
      fi
      if [ -d "./home/$un/.eclipse" ] ; then
        defbk $1 "home/$un/.eclipse" "home.$un.eclipse"
      fi
      
      echo $un >> "$BACKUPFILE/homeusers.list"
    done
    defbk $1 "home" "home" "$BACKUPFILE/homeusers.list"
  else 
    defbk $1 "home" "home"
  fi
  
}

function thead_1(){
  #10-11
  n=1
  
  if [[ $(ls ./opt) ]]
  then
    defbk $n '' 'root' "$CFGPATH/parts.rootopt.exlude.list"
    defbk $n 'opt' 'opt'
  else
    defbk $n '' 'root' "$CFGPATH/parts.root.exlude.list"
  fi

  if [ -d "./usr/lib/x86_64-linux-gnu" ] ; then
    defbk $n 'usr/lib/x86_64-linux-gnu' 'usr.lib.x86_64-linux-gnu'
  fi
  if [ -d "./usr/lib/libreoffice" ] ; then
    defbk $n 'usr/lib/libreoffice' 'usr.lib.libreoffice'
  fi
  if [ -d "./usr/lib/chromium-browser" ] ; then
    defbk $n 'usr/lib/chromium-browser' 'usr.lib.chromium-browser'
  fi
  if [ -d "./usr/lib/gcc" ] ; then
    defbk $n 'usr/lib/gcc' 'usr.lib.gcc'
  fi
  if [ -d "./usr/lib/arm-none-eabi" ] ; then
    defbk $n 'usr/lib/arm-none-eabi' 'usr.lib.arm-none-eabi'
  fi
  if [ -d "./usr/lib/python2.7" ] ; then
    defbk $n 'usr/lib/python2.7' 'usr.lib.python2.7'
  fi
  if [ -d "./usr/lib/llvm-3.8" ] ; then
    defbk $n 'usr/lib/llvm-3.8' 'usr.lib.llvm-3.8'
  fi
  if [ -d "./usr/lib/i386-linux-gnu" ] ; then
    defbk $n 'usr/lib/i386-linux-gnu' 'usr.lib.i386-linux-gnu'
  fi

  defbk $n 'usr' 'usr' "$CFGPATH/parts.usr.exlude.list"
}

function thead_2(){
  #12-
  n=2

  defbk $n 'boot' 'boot'
  defbk $n 'etc' 'etc'
  
  homebk $n

  if [ -d "./usr/share/locale" ] ; then
    defbk $n 'usr/share/locale' 'usr.share.locale'
  fi
  if [ -d "./usr/share/fonts" ] ; then
    defbk $n 'usr/share/fonts' 'usr.share.fonts'
  fi
  if [ -d "./usr/share/doc" ] ; then
    defbk $n 'usr/share/doc' 'usr.share.doc'
  fi
  if [ -d "./usr/share/icons" ] ; then
    defbk $n 'usr/share/icons' 'usr.share.icons'
  fi
  if [ -d "./usr/share/eclipse" ] ; then
    defbk $n 'usr/share/eclipse' 'usr.share.eclipse'
  fi
  if [ -d "./usr/share/skypeforlinux" ] ; then
    defbk $n 'usr/share/skypeforlinux' 'usr.share.skypeforlinux'
  fi
  if [ -d "./usr/share/qt4" ] ; then
    defbk $n 'usr/share/qt4' 'usr.share.qt4'
  fi
  if [ -d "./usr/share/qt5" ] ; then
    defbk $n 'usr/share/qt5' 'usr.share.qt5'
  fi

  defbk $n 'var' 'var'
  
}

function thead_3(){
  #10
  n=3
  
  if [ -d "./usr/lib/paraview" ] ; then
    defbk $n 'usr/lib/paraview' 'usr.lib.paraview'
  fi
  if [ -d "./usr/lib/jvm" ] ; then
    defbk $n 'usr/lib/jvm' 'usr.lib.jvm'
  fi
  if [ -d "./usr/lib/virtualbox" ] ; then
    defbk $n 'usr/lib/virtualbox' 'usr.lib.virtualbox'
  fi
  if [ -d "./usr/lib/firefox" ] ; then
    defbk $n 'usr/lib/firefox' 'usr.lib.firefox'
  fi
  if [ -d "./usr/lib/thunderbird" ] ; then
    defbk $n 'usr/lib/thunderbird' 'usr.lib.thunderbird'
  fi
  if [ -d "./usr/lib/eclipse" ] ; then
    defbk $n 'usr/lib/eclipse' 'usr.lib.eclipse'
  fi

  defbk $n 'usr/share' 'usr.share' "$CFGPATH/parts.usr.share.exlude.list"
  defbk $n 'usr/lib' 'usr.lib' "$CFGPATH/parts.usr.lib.exlude.list"
  defbk $n 'usr/bin' 'usr.bin'
  defbk $n 'usr/src' 'usr.src'

}

function dirempty(){
  if [[ $(ls $1) ]]
  then
    echo 'false'
  else
    echo 'true'
  fi
}

preparebackuping

echo "$(date +%Y-%m-%d-%H-%M-%S)  backup start" 
echo "$(date +%Y-%m-%d-%H-%M-%S)  backup start" >> $FLOGT

thead_1 & thead_2 & thead_3 & wait
 
echo "$(date +%Y-%m-%d-%H-%M-%S)  backup end"
echo "$(date +%Y-%m-%d-%H-%M-%S)  backup end" >> $FLOGT

exit 0
