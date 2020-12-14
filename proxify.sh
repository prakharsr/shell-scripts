#!/bin/sh 

if [ $1 ];
then 
	{
		cd ~/Downloads/ProxyMan-master

		(	echo '1'
			sleep 1
			) | sudo bash ./main.sh load proxy

	}
else
	{
		cd ~/Downloads/ProxyMan-master

		(	echo '1'
			) | sudo bash ./main.sh unset

	}
fi

