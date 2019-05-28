#! /bin/bash

#-> 
#-> 
#-> 
function package_update() {
	funcStart

	if package_getManager ; then
		package_${PACKAGE_MANAGER}_update "$@"
		errcode=$?
	else
		errcode=$?
	fi

	funcEnd "$errcode"
	return ${errcode}
}
