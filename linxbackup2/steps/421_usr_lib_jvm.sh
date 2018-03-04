if [ -d "./usr/lib/jvm" ] ; then
	defbk $n 'usr/lib/jvm' 'usr.lib.jvm'
else
	skipmsg $n 'usr.lib.jvm'
fi
