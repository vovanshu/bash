# if [[ $(ls ./usr/lib/WebKit*) ]]; then
if [ -f "./usr/lib/WebKitWebProcess" ] ; then
	defbk $n 'usr/lib/WebKit*' 'usr.lib.WebKit'
else
  skipmsg $n 'usr.lib.WebKit'
fi
