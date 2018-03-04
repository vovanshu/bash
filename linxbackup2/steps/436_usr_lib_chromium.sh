if [ -d "./usr/lib/chromium" ] ; then
	defbk $n 'usr/lib/chromium' 'usr.lib.chromium'
else
    skipmsg $n 'usr.lib.chromium'
fi
