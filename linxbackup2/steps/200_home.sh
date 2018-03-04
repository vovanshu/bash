# homebk $n

lshome=$(ls ./home)
if [[ $lshome ]]
then
	for un in $lshome
	do
		defbk $n "home/$un" "home.$un" "$CFGPATH/exlude.home.list"		
		echo $un >> "$LSPATH/homeusers.list"
	done
	defbk $n "home" "home" "$LSPATH/homeusers.list"
else 
	defbk $n "home" "home"
fi
