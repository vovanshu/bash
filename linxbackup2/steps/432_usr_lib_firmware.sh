if [ -d "./usr/lib/firmware" ] ; then
	defbk $n 'usr/lib/firmware' 'usr.lib.firmware'
else
	skipmsg $n 'usr.lib.firmware'
fi
