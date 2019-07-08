#! /bin/bash

declare -a testFiles

# Initialise the test environment
oneTimeSetUp() {
	export JLB_TESTS=true
	export JLB_TESTS_DIR="${DIR}"
	export JLB_TESTS_TMP="${JLB_TESTS_DIR}/tmp"
	export JLB_TESTS_FILES="${JLB_TESTS_DIR}/files"
	JLB_ROOT="$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))/functions"
	source "$JLB_ROOT/init" "$@" || exit 1

	mkdir -p "${JLB_TESTS_TMP}"
	cp -ar ${JLB_TESTS_FILES}/* "${JLB_TESTS_TMP}"

	echo
	echo "Testing files:"
	for file in ${testFiles[@]} ; do
		echo $file
	done
	echo

	jlb::init "${JLB_ROOT}"
}

oneTimeTearDown() {
	rm -rf "${JLB_TESTS_TMP}"
}

# Unset variables between tests
#tearDown() {
#	unset JLB_DEBUG
#	unset JLB_DEBUG_DEPTH
#	unset JLB_TEST
#}
