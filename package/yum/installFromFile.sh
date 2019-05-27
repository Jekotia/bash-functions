#! /bin/bash

#-> INSTALLS RPM FROM URL
#-> TAKES URL AS ARG
#-> RETURNS 0 FOR SUCCESS OR 1 FOR FAILURE
function package_yum_installFromFile {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"

	isRoot "exit"

	URL="${@}"

	rpm -Uvh "${URL}"
	errcode=$?

	debug "END FUNCTION ${FUNCNAME[0]}"
	return $errcode
}
