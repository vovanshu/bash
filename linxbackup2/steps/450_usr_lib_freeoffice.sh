if [ -d "./usr/lib/freeoffice" ] ; then
	defbk $n 'usr/lib/freeoffice' 'usr.lib.freeoffice'
else
  skipmsg $n 'usr.lib.freeoffice'
fi
