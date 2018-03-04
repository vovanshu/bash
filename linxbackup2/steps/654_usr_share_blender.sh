if [ -d "./usr/share/blender" ] ; then
	defbk $n 'usr/share/blender' 'usr.share.blender'
else
  skipmsg $n 'usr.share.blender'
fi
