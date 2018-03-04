if [ -d "./usr/lib/x86_64-linux-gnu" ] ; then
	defbk $n 'usr/lib/x86_64-linux-gnu' 'usr.lib.x86_64-linux-gnu'
else
	skipmsg $n 'usr.lib.x86_64-linux-gnu'
fi
