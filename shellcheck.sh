#! /bin/bash

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# VARIABLE CONTAINING STARTING PATH
looppath="${path}/functions" #-> VARIABLE CONTAINING STARTING PATH

# Ensure that $path is an accessible directory
cd "${path}/functions" || exit

#-> DECLARE THE ARRAY WHICH WILL CONTAIN THE LIST OF FILES TO PASS TO SHELLCHECK
declare -a files
#-> ADD NON *.sh CORE FILES
files+=(${path}/functions/debug)
files+=(${path}/functions/formatting)
files+=(${path}/functions/funcEnd)
files+=(${path}/functions/funcStart)
files+=(${path}/functions/init)
files+=(${path}/functions/loader)
files+=(${path}/functions/printerr)
files+=(${path}/shellcheck.sh)
files+=(${path}/skeleton.sh)
files+=(${path}/tests/common.sh)
files+=(${path}/tests/main.sh)
files+=(${path}/tests/system.sh)

# Track the number of failures
errors=0

shellcheck --color=always --shell=bash --external-sources "${files[@]}" || ((errors++))


# Setup for the looping side

# VARIABLE CONTAINING MAXIMUM DEPTH
max_depth=

# VARIABLE FOR TRACKING CURRENT DEPTH
depth=0

# VARIABLE FOR BUILDING DEPTH-BASED PATH TO SOURCE FROM
depth_str=""

# DETERMINE MAXIMUM DEPTH OF $path DIRECTORY TREE
max_depth=$(find "${looppath}" \( ! -regex '.*/\..*' \) -type d -printf '%d\n' | sort -rn | head -1)
# INCREMENT MAX DEPTH BY ONE, SINCE IT COMES UP SHORT FOR OUR PURPOSES
((max_depth++))

#-> EXECUTION
#-> WHILE CURRENT DEPTH IS BELOW MAX DEPTH, DO STUFF
while [[ ${depth} -lt "${max_depth}" ]] ; do
	((depth++))
	target="${looppath}/${depth_str}*.sh"
#	echo "Working at depth ${depth} in directory ${looppath}/${depth_str}"

	#-> LOOP FOR EACH FILE AT THE PATH EXPRESSED BY $SOURCE_PATH
	for f in ${target} ; do
		#-> VERIFY THAT THERE ARE .sh FILES AT THIS LEVEL TO AVOID ERRORS
		#-> IF THERE ARE, CONTINUE SOURCING. IF NOT, CONTINUE BUT DO NOTHING
		loopfiles=$(shopt -s nullglob dotglob; echo "${target}")
		if (( ${#loopfiles} )) ; then
			# shellcheck disable=1090
			shellcheck --color=always --shell=bash --external-sources "$f"
			status=$?
			if [ ${status} -eq 0 ] ; then
				printf "\xE2\x9C\x94 %s\n" "$f"
			else
				((errors++))
			fi
		else
			echo "empty (or does not exist, or is not a .sh file)"
		fi
	done

	#-> INCREASE THE DEPTH EXPRESSED
	depth_str="${depth_str}*/"
done

if [[ ${errors} -gt 0 ]] ; then
	exit 1
else
	exit 0
fi
