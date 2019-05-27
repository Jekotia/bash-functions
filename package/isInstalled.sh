#! /bin/bash

#-> SKELETON TO CHECK IF A PACKAGE IS INSTALLED
#-> TAKES PACKAGE NAME AS ARG
#-> RETURNS 0 FOR AN INSTALLED PACKAGE OR 1 FOR A NON-INSTALLED PACKAGE
function package_isInstalled() {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"
	if package_getManager ; then
		package_${PACKAGE_MANAGER}_isInstalled $@
		errcode=$?
	else
		errcode=$?
	fi

	debug "END FUNCTION ${FUNCNAME[0]} with errcode of $errcode"
	return ${errcode}
}
