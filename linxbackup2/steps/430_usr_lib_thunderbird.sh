if [ -d "./usr/lib/thunderbird" ] ; then
	defbk $n 'usr/lib/thunderbird' 'usr.lib.thunderbird'
else
	skipmsg $n 'usr.lib.thunderbird'
fi
