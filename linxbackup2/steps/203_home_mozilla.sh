lshome=$(ls ./home)
if [[ $lshome ]]
then
	for un in $lshome
	do
		if [ -d "./home/$un/.mozilla" ] ; then    
			defbk $n "home/$un/.mozilla" "home.$un.mozilla"
        else
			skipmsg $n "home.$un.mozilla"
		fi
	done
fi
