if [ -d "./usr/lib32" ] ; then
	defbk $n 'usr/lib32' 'usr.lib32' "$CFGPATH/exlude.usr.lib32.list"
else
 skipmsg $n 'usr.lib32'
fi


