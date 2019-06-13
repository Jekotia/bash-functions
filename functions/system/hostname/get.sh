#! /bin/bash

#-> 
#-> 
#-> 
function system_hostname_get() {
	funcStart ; local errcode

	local hostname
	hostname=$(hostname)
	errcode=$?

	echo "${hostname}"

	funcEnd "$errcode"
	return $errcode
}
