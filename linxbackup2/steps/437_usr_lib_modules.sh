if [ -d "./usr/lib/modules" ] ; then
	defbk $n 'usr/lib/modules' 'usr.lib.modules'
else
	skipmsg $n 'usr.lib.modules'
fi
