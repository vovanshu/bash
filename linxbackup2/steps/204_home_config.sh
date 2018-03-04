lshome=$(ls ./home)
if [[ $lshome ]]
then
	for un in $lshome
	do
		if [ -d "./home/$un/.config" ] ; then    
			defbk $n "home/$un/.config" "home.$un.config"
		else
			skipmsg $n "home.$un.config"
		fi
	done
fi
