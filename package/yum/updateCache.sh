#! /bin/bash

#-> 
#-> 
#-> 
function package_yum_updateCache() {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"

	debug "Skipping package_yum_updateCache because cache updates are implied by relevant commands"
	errcode=0

	debug "END FUNCTION ${FUNCNAME[0]} with errcode of $errcode"
	return $errcode
}
