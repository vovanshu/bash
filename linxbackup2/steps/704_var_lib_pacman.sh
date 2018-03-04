if [ -d "./var/lib/pacman" ] ; then
	defbk $n 'var/lib/pacman' 'var.lib.pacman' "$CFGPATH/exlude.var.lib.pacman.list"
else
  skipmsg $n 'usr.share.pacman'
fi
