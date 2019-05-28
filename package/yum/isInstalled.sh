#! /bin/bash

#-> CHECKS IF THE NAMED PACKAGE IS INSTALLED
#-> TAKES PACKAGE NAME (STRING) AS INPUT
#-> RETURNS EXIT CODE OF YUM
function package_yum_isInstalled() {
	funcStart

	yum list installed "$@" >/dev/null 2>&1
	errcode=$?

	funcEnd "$errcode"
	return ${errcode}
}
