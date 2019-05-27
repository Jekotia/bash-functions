#! /bin/bash

#-> 
#-> 
#-> 
function system_hostname_set {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"

	isRoot "exit"

	# $1 - The hostname to define
	HOSTNAME="$1"

	if [ ! -n "$HOSTNAME" ]; then
		echo "Hostname undefined"
		debug "END FUNCTION ${FUNCNAME[0]}"
		return 1;
	fi

	if echo "$HOSTNAME" > /etc/hostname ; then
		if ! hostname -F /etc/hostname ; then
			errcode=$?
		fi
	else
		errcode=$?
	fi

	debug "END FUNCTION ${FUNCNAME[0]}"
	return $errcode
}
