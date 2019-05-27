#! /bin/bash

#-> 
#-> 
#-> 
function package_installFromFile() {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"
	if package_getManager ; then
		package_${PACKAGE_MANAGER}_installFromFile "$@"
		errcode=$?
	else
		errcode=$?
	fi

	debug "END FUNCTION ${FUNCNAME[0]} with errcode of $errcode"
	return $errcode
}
