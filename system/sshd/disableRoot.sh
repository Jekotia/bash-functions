#! /bin/bash

#-> DISABLES ROOT ACCESS VIA SSH
#-> NO ARGS
#-> 
function system_sshd_disableRoot() {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"

	isRoot "exit"

    if sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config ; then
	    touch /tmp/restart-ssh
		errcode=$?
	else
		errcode=$?
	fi

	debug "BEGIN FUNCTION ${FUNCNAME[0]}"
	return $errcode
}
