#! /bin/bash

#-> CHECKS IF THE SCRIPT IS BEING EXECUTED IN A SUPERUSER ENVIRONMENT
#-> TAKES OPTIONAL STRING ARG WITH VALUE "exit". IF PRESENT, THIS WILL IMMEDIATELY TERMINATE EXECUTION IF THE CHECK FAILS
#-> RETURNS 0 IF IN A SU ENV, 1 OTHERWISE
function isRoot {
	if [[ `id -u` == "0" ]] ; then
		return
	else
		echo "This script requires root/sudo!"
                if [[ "$1" == "exit" ]] ; then
                        exit 99
                else
                        return 1
                fi
	fi
}