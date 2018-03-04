if [ -d "./usr/share/gimp" ] ; then
	defbk $n 'usr/share/gimp' 'usr.share.gimp'
else
  skipmsg $n 'usr.share.gimp'
fi
