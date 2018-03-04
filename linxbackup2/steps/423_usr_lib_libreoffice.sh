if [ -d "./usr/lib/libreoffice" ] ; then
	defbk $n 'usr/lib/libreoffice' 'usr.lib.libreoffice'
else
	skipmsg $n 'usr.lib.libreoffice'
fi
