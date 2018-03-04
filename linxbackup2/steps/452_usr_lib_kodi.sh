if [ -d "./usr/lib/kodi" ] ; then
	defbk $n 'usr/lib/kodi' 'usr.lib.kodi'
else
  skipmsg $n 'usr.lib.kodi'
fi
