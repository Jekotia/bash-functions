#! /bin/bash

#-> CHECK WHICH PACKAGE MANAGER IS PRESENT
#-> TAKES NO ARGS
#-> RETURNS 0 IF IT FINDS A SUPPORTED MANAGER, 1 IF IT DOES NOT
function package_getManager() {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"
	#-> ATTEMPT TO GET PATH TO YUM
	YUM_CMD=$(which yum 2>/dev/null)
	#-> ATTEMPT TO GET PATH TO APT-GET
	APT_GET_CMD=$(which apt-get 2>/dev/null )

	if [[ ! -z $YUM_CMD ]]; then
		PACKAGE_MANAGER=yum
		PACKAGE_MANAGER_CMD=${YUM_CMD}
	elif [[ ! -z $APT_GET_CMD ]]; then
		PACKAGE_MANAGER=aptget
		PACKAGE_MANAGER_CMD=${APT_GET_CMD}
	else
		errcho "Unable to detect a supported package manager."
		debug "END FUNCTION ${FUNCNAME[0]}"
		return 1
	fi

	debug "PACKAGE_MANAGER=${PACKAGE_MANAGER}"
	debug "PACKAGE_MANAGER_CMD=${PACKAGE_MANAGER_CMD}"

	debug "END FUNCTION ${FUNCNAME[0]}"
	return 0
}
