#!/usr/bin/env bash

mainmenu() {
	echo -ne "
	MAIN MENU
	4) start webserver
	3) start mush server
	2) heh
	1) kill server
	0) exit the thing
	Chose an option: "
	read -r ans
	case $ans in
	4)
		echo "starting webserver"
		cd web
		python webserver.py &
		echo "did it"
		sleep 3
		mainmenu
		;;
	3)
		echo "starting mush server"
		python simplemud.py &
		echo "did it"
		sleep 3
		mainmenu
		;;
	2)
		echo "heh"
		sleep 5
		mainmenu
		;;
	1)
		echo "*** stopping my test server***"
		killall python
		echo "done" 
		sleep 2
		mainmenu
		;;
	0)
		echo "bye bye"
		exit 0
		;;
		
	*)
		echo "wrong option bitch"
		mainmenu
		;;
		
	
	esac
}

mainmenu	