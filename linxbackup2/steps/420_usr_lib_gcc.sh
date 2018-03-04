if [ -d "./usr/lib/gcc" ] ; then
	defbk $n 'usr/lib/gcc' 'usr.lib.gcc'
else
	skipmsg $n 'usr.lib.gcc'
fi
