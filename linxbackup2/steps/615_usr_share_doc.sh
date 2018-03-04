if [ -d "./usr/share/doc" ] ; then
	defbk $n 'usr/share/doc' 'usr.share.doc' "$CFGPATH/exlude.usr.share.doc.list"
else
	skipmsg $n 'usr.share.doc'
fi
