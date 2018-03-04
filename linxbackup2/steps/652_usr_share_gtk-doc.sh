if [ -d "./usr/share/gtk-doc" ] ; then
	defbk $n 'usr/share/gtk-doc' 'usr.share.gtk-doc'
else
  skipmsg $n 'usr.share.gtk-doc'
fi
