if [ -d "./var/lib/apt" ] ; then
	defbk $n 'var/lib/apt' 'var.lib.apt' "$CFGPATH/exlude.var.lib.apt.list"
else
  skipmsg $n 'usr.share.apt'
fi
