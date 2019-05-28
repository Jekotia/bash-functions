#! /bin/bash

#-> INSTALLS RPM FROM FILE
#-> TAKES FILE PATH AS ARG
#-> RETURNS 0 FOR SUCCESS OR 1 FOR FAILURE
function package_yum_installFromFile {
	funcStart

	isRoot "exit"

	local file="${@}"

	rpm -vhi "${file}"
	errcode=$?

	funcEnd "$errcode"
	return $errcode
}
