#! /bin/bash

#-> SKELETON TO CHECK IF A PACKAGE IS INSTALLED
#-> TAKES PACKAGE NAME AS ARG
#-> RETURNS 0 FOR AN INSTALLED PACKAGE OR 1 FOR A NON-INSTALLED PACKAGE
function package_isInstalled() {
	funcStart

	if package_getManager ; then
		package_"${PACKAGE_MANAGER}"_isInstalled "$@"
		errcode=$?
	else
		errcode=$?
	fi

	funcEnd "$errcode"
	return ${errcode}
}
