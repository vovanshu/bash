lshome=$(ls ./home)
if [[ $lshome ]]
then
	for un in $lshome
	do
		if [ -d "./home/$un/.ViberPC" ] ; then    
			defbk $n "home/$un/.ViberPC" "home.$un.ViberPC"
		else
			skipmsg $n "home.$un.ViberPC"
		fi
	done
fi
