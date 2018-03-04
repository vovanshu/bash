# if [[ $(ls ./usr/lib/libamdocl64*) ]]; then
if [ -f "./usr/lib/libamdocl64*" ] ; then
	defbk $n 'usr/lib/libamdocl64*' 'usr.lib.libamdocl64'
else
    skipmsg $n 'usr.lib.libamdocl64'
fi
