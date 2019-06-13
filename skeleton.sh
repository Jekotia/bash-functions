#! /bin/bash
# The version of the function file in format "x.y.z".
export SKELETON_VERSION=1.0.0

# Public: BRIEF summary of function
#
# May or may not make a skeleton rattle
#
# $1 - Argument 1.
# $2 - Argument 2. etc
#
# Examples
#
#   skeleton "rattle"
#   skeleton "silent"
#   skeleton "random"
#
# Returns 1 if the skeleton remained silent, 0 if it rattled.
function skeleton() {
	funcStart ; local errcode

	### FUNCTION CODE HERE ###

	funcEnd "$errcode" ; return "$errcode"
}
