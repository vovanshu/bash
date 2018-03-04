if [ -d "./usr/share/inkscape" ] ; then
	defbk $n 'usr/share/inkscape' 'usr.share.inkscape'
else
  skipmsg $n 'usr.share.inkscape'
fi
