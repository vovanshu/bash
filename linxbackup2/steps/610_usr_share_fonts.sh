if [ -d "./usr/share/fonts" ] ; then
	defbk $n 'usr/share/fonts' 'usr.share.fonts'
else
	skipmsg $n 'usr.share.fonts'
fi
