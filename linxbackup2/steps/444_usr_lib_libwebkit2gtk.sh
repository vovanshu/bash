# if [[ $(ls ./usr/lib/libwebkit2gtk*) ]]; then
if [ -f "./usr/lib/libwebkit2gtk-4.0.so" ] ; then
	defbk $n 'usr/lib/libwebkit2gtk-4.0*' 'usr.lib.libwebkit2gtk-4.0'
else
	skipmsg $n 'usr.lib.libwebkit2gtk-4.0'
fi
