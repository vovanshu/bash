if [[ $(ls ./opt) ]]
then
	defbk $n '' 'root' "$CFGPATH/exlude.root.list" "$CFGPATH/exlude.root.opt.list"
else
	defbk $n '' 'root' "$CFGPATH/exlude.root.list"
fi
