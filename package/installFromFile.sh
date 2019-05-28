#! /bin/bash

#-> 
#-> 
#-> 
function package_installFromFile() {
	funcStart

	if package_getManager ; then
		package_${PACKAGE_MANAGER}_installFromFile "$@"
		errcode=$?
	else
		errcode=$?
	fi

	funcEnd
	return $errcode
}
