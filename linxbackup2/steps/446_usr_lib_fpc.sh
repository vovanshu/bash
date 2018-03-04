if [ -d "./usr/lib/fpc" ] ; then
	defbk $n 'usr/lib/fpc' 'usr.lib.fpc'
else
  skipmsg $n 'usr.lib.fpc'
fi
