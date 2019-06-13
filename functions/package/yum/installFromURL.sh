#! /bin/bash

#-> INSTALLS RPM FROM URL
#-> TAKES URL AS ARG
#-> RETURNS 0 FOR SUCCESS OR 1 FOR FAILURE
function package_yum_installFromURL() {
	funcStart

	isRoot "exit"

	URL="${*}"

	rpm -Uvh "${URL}"
	errcode=$?

	funcEnd "$errcode"
	return $errcode
}
