#! /bin/bash

#-> CHECK WHICH PACKAGE MANAGER IS PRESENT
#-> TAKES NO ARGS
#-> RETURNS 0 IF IT FINDS A SUPPORTED MANAGER, 1 IF IT DOES NOT
function package_getManager() {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"
	#-> CHECK IF $PACKAGE_MANAGER HAS BEEN PREVIOUSLY SET, TO AVOID UNNECESSARY PROCESSING
	if [[ -z "${PACKAGE_MANAGER}" ]] ; then
		#-> ATTEMPT TO GET PATH TO YUM
		YUM_CMD=$(which yum 2>/dev/null)
		#-> ATTEMPT TO GET PATH TO APT-GET
		APTGET_CMD=$(which apt-get 2>/dev/null )

		if [[ ! -z "$YUM_CMD" ]]; then
			errcode=$?
			PACKAGE_MANAGER=yum
			#PACKAGE_MANAGER_CMD="${YUM_CMD}"
		elif [[ ! -z "$APTGET_CMD" ]]; then
			errcode=$?
			PACKAGE_MANAGER=aptget
			#PACKAGE_MANAGER_CMD="${APTGET_CMD}"
		else
			errcode=$?

			errcho "Unable to detect a supported package manager."
		fi

		debug "PACKAGE_MANAGER=${PACKAGE_MANAGER}"
		debug "PACKAGE_MANAGER_CMD=${PACKAGE_MANAGER_CMD}"
	else
		errcode=0
		debug "\$PACKAGE_MANAGER ALREADY SET."
	fi

	debug "END FUNCTION ${FUNCNAME[0]} with errcode of $errcode"
	return $errcode
}
