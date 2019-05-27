#! /bin/bash
#-> Adds the users public key to authorized_keys for the specified user. Make sure you wrap your input variables in double quotes, or the key may not load properly.
#-> $1 - Required - USER
#-> $2 - Required - public key
function user_ssh_addPublicKey {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"

	local USER="$1"
	local KEY_PATH="$2"

	if [ -z "${USER}" ] || [ -z "${KEY_PATH}" ]; then
		errcho "Must provide a username and the location of a pubkey"

		debug "END FUNCTION ${FUNCNAME[0]}"
		return 1
	elif [ ! -f "${KEY_PATH}" ] ; then
		errcho "Provided public key file path does not exist."

		debug "END FUNCTION ${FUNCNAME[0]}"
		return 1
	fi

	if [ "$USER" == "root" ]; then
		local HOME_PATH=/root
	else
		local HOME_PATH=/home/${USER}
	fi

	if mkdir -p ${HOME_PATH}/.ssh ; then
		if touch ${HOME_PATH}/.ssh/authorized_keys ; then
			if echo "${KEY_PATH}" >> ${HOME_PATH}/.ssh/authorized_keys ; then
				if chown -R "$USER":"$USER" ${HOME_PATH}/.ssh ; then
					errcode=$?
				else
					errcode=$?
				fi
			else
				errcode=$?
			fi
		else
			errcode=$?
		fi
	else
		errcode=$?
	fi

	debug "END FUNCTION ${FUNCNAME[0]}"
	return $errcode
}
