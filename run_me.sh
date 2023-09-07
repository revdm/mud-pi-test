#!/usr/bin/env bash

mainmenu() {
	echo -ne "
	MAIN MENU
	5) reboot
	4) start webserver
	3) start mush server
	2) heh
	1) kill server
	0) exit the thing
	Chose an option: "
	read -r ans
	case $ans in
	5)
		shutdown -r 1 "System rebooting in 1 minute"
		echo "Set to reboot"
		sleep 90
		mainmenu
		;;
	4)
		echo "starting webserver"
		python web/webserver.py &
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
		echo "*** stopping mush server***"
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