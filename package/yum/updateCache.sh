#! /bin/bash

#-> 
#-> 
#-> 
function package_yum_updateCache() {
	funcStart

	debug "Skipping package_yum_updateCache because cache updates are implied by relevant commands"
	errcode=0

	funcEnd "$errcode"
	return $errcode
}
