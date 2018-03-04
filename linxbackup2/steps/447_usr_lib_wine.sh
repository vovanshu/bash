if [ -d "./usr/lib/wine" ] ; then
	defbk $n 'usr/lib/wine' 'usr.lib.wine'
else
  skipmsg $n 'usr.lib.wine'
fi
