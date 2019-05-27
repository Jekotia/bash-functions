#! /bin/bash

#-> INSTALLS RPM FROM FILE
#-> TAKES FILE PATH AS ARG
#-> RETURNS 0 FOR SUCCESS OR 1 FOR FAILURE
function package_yum_installFromFile {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"

	isRoot "exit"

	local file="${@}"

	rpm -vhi "${file}"
	errcode=$?

	debug "END FUNCTION ${FUNCNAME[0]} with errcode of $errcode"
	return $errcode
}
