if [ -d "./usr/share/java" ] ; then
	defbk $n 'usr/share/java' 'usr.share.java'
else
	skipmsg $n 'usr.share.java'
fi
