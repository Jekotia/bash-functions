#! /bin/bash

#-> 
#-> 
#-> 
function package_updateCache() {
	funcStart

	if package_getManager ; then
		package_"${PACKAGE_MANAGER}"_updateCache "$@"
		errcode=$?
	else
		errcode=$?
	fi

	funcEnd "$errcode"
	return ${errcode}
}
