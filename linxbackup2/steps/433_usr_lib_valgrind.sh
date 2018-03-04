if [ -d "./usr/lib/valgrind" ] ; then
	defbk $n 'usr/lib/valgrind' 'usr.lib.valgrind'
else
    skipmsg $n 'usr.lib.valgrind'
fi
