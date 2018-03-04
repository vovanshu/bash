lshome=$(ls ./home)
if [[ $lshome ]]
then
	for un in $lshome
	do
		if [ -d "./home/$un/.local" ] ; then    
			defbk $n "home/$un/.local" "home.$un.local"
		else
			skipmsg $n "home.$un.local"
		fi
	done
fi
