if [ -f "./usr/lib/libQt5Core.so" ] ; then
	defbk $n 'usr/lib/libQt5*' 'usr.lib.libQt5'
else
    skipmsg $n 'usr.lib.libQt5'
fi
