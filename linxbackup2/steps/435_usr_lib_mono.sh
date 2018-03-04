if [ -d "./usr/lib/mono" ] ; then
	defbk $n 'usr/lib/mono' 'usr.lib.mono'
else
	skipmsg $n 'usr.lib.mono'
fi
