#! /bin/bash

#-> SKELETON TO CHECK IF A PACKAGE IS INSTALLED
#-> TAKES PACKAGE NAME AS ARG
#-> RETURNS 0 FOR AN INSTALLED PACKAGE OR 1 FOR A NON-INSTALLED PACKAGE
function package_isInstalled() {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"
	if package_getManager ; then
		if [[ "${PACKAGE_MANAGER}" != "" ]] ; then
			package_${PACKAGE_MANAGER}_isInstalled $@
			errcode=$?

			debug "END FUNCTION ${FUNCNAME[0]}"

			return ${errcode}
		fi
		debug "END FUNCTION ${FUNCNAME[0]}"
		return 1
	else
		debug "END FUNCTION ${FUNCNAME[0]}"
		return 1
	fi
}
