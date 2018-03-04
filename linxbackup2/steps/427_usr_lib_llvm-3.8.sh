if [ -d "./usr/lib/llvm-3.8" ] ; then
	defbk $n 'usr/lib/llvm-3.8' 'usr.lib.llvm-3.8'
else
	skipmsg $n 'usr.lib.llvm-3.8'
fi
