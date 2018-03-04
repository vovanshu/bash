if [ -d "./usr/share/tessdata" ] ; then
	defbk $n 'usr/share/tessdata' 'usr.share.tessdata'
else
  skipmsg $n 'usr.share.tessdata'
fi
