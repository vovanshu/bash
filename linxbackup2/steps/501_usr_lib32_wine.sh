if [ -d "./usr/lib32/wine" ] ; then
	defbk $n 'usr/lib32/wine' 'usr.lib32.wine'
else
 skipmsg $n 'usr.lib32.wine'
fi
