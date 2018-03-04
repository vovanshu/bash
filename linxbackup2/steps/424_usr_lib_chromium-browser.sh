if [ -d "./usr/lib/chromium-browser" ] ; then
	defbk $n 'usr/lib/chromium-browser' 'usr.lib.chromium-browser'
else
	skipmsg $n 'usr.lib.chromium-browser'
fi
