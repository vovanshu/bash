lshome=$(ls ./home)
if [[ $lshome ]]
then
	for un in $lshome
	do
		if [ -d "./home/$un/.kodi" ] ; then
			defbk $n "home/$un/.kodi" "home.$un.kodi"
        else
            skipmsg $n "home.$un.kodi"
		fi
	done
fi
