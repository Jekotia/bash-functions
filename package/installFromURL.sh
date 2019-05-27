#! /bin/bash

#-> 
#-> 
#-> 
function package_installFromURL() {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"
	if package_getManager ; then
		package_${PACKAGE_MANAGER}_installFromURL "$@"
		errcode=$?
	else
		errcode=$?
	fi

	debug "END FUNCTION ${FUNCNAME[0]} with errcode of $errcode"
	return ${errcode}
}
