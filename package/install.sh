#! /bin/bash

#-> SKELETON FOR PACKAGE INSTALLATION. CALLS FUNCTION TO DISCOVER PACKAGE MANAGER AND THEN CALLS THE INSTALL FUNCTION FOR THAT MANAGER.
#-> TAKES THE FOLLOWING OPTIONAL ARGS AS INPUT, WHICH WILL BE CONVERTED INTO THE APPROPRIATE ARGS FOR THE LOCAL PACKAGE MANAGER
#->  --unattended
#->  --verbose
#-> TAKES A LIST OF PACKAGES AS THE FINAL ARGUMENT
#-> RETURNS THE EXIT STATUS OF THE package_${PACKAGE_MANAGER}_install FUNCTION, OR 1 IF IT FAILS TO FIND A SUPPORTED PACKAGE MANAGER.
function package_install() {
	funcStart

	if package_getManager ; then
		package_${PACKAGE_MANAGER}_install "$@"
		errcode=$?
	else
		errcode=$?
	fi

	funcEnd "$errcode"
	return $errcode
}
