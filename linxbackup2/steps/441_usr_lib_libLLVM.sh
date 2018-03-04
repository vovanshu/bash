if [ -f "./usr/lib/libLLVM.so" ] ; then
	defbk $n 'usr/lib/libLLVM*' 'usr.lib.libLLVM'
else
 skipmsg $n 'usr.lib.libLLVM'
fi
