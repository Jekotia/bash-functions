#! /bin/bash

#-> 
#-> 
#-> 
function package_installFromURL() {
	funcStart

	if package_getManager ; then
		package_${PACKAGE_MANAGER}_installFromURL "$@"
		errcode=$?
	else
		errcode=$?
	fi

	funcEnd "$errcode"
	return ${errcode}
}
