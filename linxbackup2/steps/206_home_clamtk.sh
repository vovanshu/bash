lshome=$(ls ./home)
if [[ $lshome ]]
then
	for un in $lshome
	do
		if [ -d "./home/$un/.clamtk" ] ; then    
			defbk $n "home/$un/.clamtk" "home.$un.clamtk"
		else
			skipmsg $n "home.$un.clamtk"
		fi
	done
fi
