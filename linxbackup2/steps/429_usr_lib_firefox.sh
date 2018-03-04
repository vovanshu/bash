if [ -d "./usr/lib/firefox" ] ; then
	defbk $n 'usr/lib/firefox' 'usr.lib.firefox'
else
	skipmsg $n 'usr.lib.firefox'
fi
