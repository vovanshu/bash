if [ -d "./usr/lib/paraview" ] ; then
	defbk $n 'usr/lib/paraview' 'usr.lib.paraview'
else
	skipmsg $n 'usr.lib.paraview'
fi
