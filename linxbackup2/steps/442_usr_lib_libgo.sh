# if [[ $(ls ./usr/lib/libgo*) ]]; then
if [ -f "./usr/lib/libgo.so" ] ; then
	defbk $n 'usr/lib/libgo*' 'usr.lib.libgo'
else
    skipmsg $n 'usr.lib.libgo'
fi
