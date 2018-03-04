if [ -d "./usr/share/wine" ] ; then
	defbk $n 'usr/share/wine' 'usr.share.wine'
else
  skipmsg $n 'usr.share.wine'
fi
