if [ -d "./usr/share/doc/qt" ] ; then
	defbk $n 'usr/share/doc/qt' 'usr.share.doc.qt'
else
	skipmsg $n 'usr.share.doc.qt'
fi
