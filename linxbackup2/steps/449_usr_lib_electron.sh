if [ -d "./usr/lib/electron" ] ; then
	defbk $n 'usr/lib/electron' 'usr.lib.electron'
else
  skipmsg $n 'usr.lib.electron'
fi
