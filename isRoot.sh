#! /bin/bash

#-> CHECKS IF THE SCRIPT IS BEING EXECUTED IN A SUPERUSER ENVIRONMENT
#-> TAKES OPTIONAL STRING ARG WITH VALUE "exit". IF PRESENT, THIS WILL IMMEDIATELY TERMINATE EXECUTION IF THE CHECK FAILS
#-> RETURNS 0 IF IN A SU ENV, 1 OTHERWISE
function isRoot() {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"

	if [[ `id -u` == "0" ]] ; then
		errcode=$?
	else
		echo "This script requires root/sudo!"
		if [[ "$1" == "exit" ]] ; then
			exit 99
		else
			errcode=1
		fi
	fi

	debug "END FUNCTION ${FUNCNAME[0]} with errcode of $errcode"
	return $errcode
}
