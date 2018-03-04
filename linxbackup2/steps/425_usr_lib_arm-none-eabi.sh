if [ -d "./usr/lib/arm-none-eabi" ] ; then
	defbk $n 'usr/lib/arm-none-eabi' 'usr.lib.arm-none-eabi'
else
	skipmsg $n 'usr.lib.arm-none-eabi'
fi
