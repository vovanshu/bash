if [ -d "./usr/share/kodi" ] ; then
	defbk $n 'usr/share/kodi' 'usr.share.kodi'
else
  skipmsg $n 'usr.share.kodi'
fi
