lshome=$(ls ./home)
if [[ $lshome ]]
then
	for un in $lshome
	do
		if [ -d "./home/$un/.eclipse" ] ; then
			defbk $n "home/$un/.eclipse" "home.$un.eclipse"
		else
			skipmsg $n "home.$un.eclipse"
		fi
	done
fi
