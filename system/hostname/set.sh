#! /bin/bash

#-> 
#-> 
#-> 
function system_hostname_set() {
	funcStart

	isRoot "exit"

	# $1 - The hostname to define
	HOSTNAME="$1"

	if [ ! -n "$HOSTNAME" ]; then
		echo "Hostname undefined"
		funcEnd "$errcode"
		return 1;
	fi

	if echo "$HOSTNAME" > /etc/hostname ; then
		if ! hostname -F /etc/hostname ; then
			errcode=$?
		fi
	else
		errcode=$?
	fi

	funcEnd "$errcode"
	return $errcode
}
