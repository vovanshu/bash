if [ -d "./var/lib/mysql" ] ; then
	defbk $n 'var/lib/mysql' 'var.lib.mysql'
else
  skipmsg $n 'usr.share.mysql'
fi
