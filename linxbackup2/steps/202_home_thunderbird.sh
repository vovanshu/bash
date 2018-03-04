lshome=$(ls ./home)
if [[ $lshome ]]
then
	for un in $lshome
	do
		if [ -d "./home/$un/.thunderbird" ] ; then    
			defbk $n "home/$un/.thunderbird" "home.$un.thunderbird"
        else
			skipmsg $n "home.$un.thunderbird"
		fi
	done
fi
