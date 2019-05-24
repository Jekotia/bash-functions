#! /bin/bash

#-> INSTALLS PACKAGES USING YUM
#-> TAKES THE FOLLOWING OPTIONAL ARGS, WHICH ARE CONVERTED TO THE CORRECT YUM ARGS
#->   --unattended
#->   --verbose
#-> RETURNS THE EXIT CODE OF THE YUM COMMAND
function package_yum_install() {
	debug "BEGIN FUNCTION ${FUNCNAME[0]}"
	#-> CHECK IF ARGUMENTS FOR THE PACKAGE MANAGER HAVE
	#-> BEEN PASSED, AND SET THEIR YUM EQUIVALENTS IF SO.
	while :; do
		case $1 in
			--unattended)
				args="${args} -y"
				debug "Package manager is now unattended"
			;;
			--verbose)
				args="${args} --verbose"
				debug "Package manager is now verbose"
			;;
			*)
				break
			;;
		esac
		shift
	done

	packages=${@}
	debug "packages=${packages}"

	${PACKAGE_MANAGER_CMD} install ${args} ${packages}
	errcode=$?

	debug "END FUNCTION ${FUNCNAME[0]}"

	return ${errcode}
}
