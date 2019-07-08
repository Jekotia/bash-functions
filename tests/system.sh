#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${DIR}/common.sh"

#---

testFiles+=( "/functions/system/hostname/get.sh" )
# Test jlb::system::hostname::get
test_system_hostname_get() {
	assertEquals "Test jlb::system::hostname::get." "$(hostname -s)" "$(jlb::system::hostname::get)"
}

testFiles+=( "/functions/system/hostname/set.sh" )
# Test jlb::system::hostname::set
test_system_hostname_set() {
	jlb::system::hostname::set "$(jlb::system::hostname::get)"
	assertEquals "Test jlb::system::hostname::set" "$?" "0"
}

#---

testFiles+=( "/functions/system/ip/get_public.sh" )
# Test jlb::system::ip::get_public
test_system_ip_get_public() {
	jlb::system::ip::get_public "$(jlb::system::ip::get_public)" > /dev/null
	assertEquals "Test jlb::system::ip::get_public" "$?" "0"
}

#---

testFiles+=( "/functions/system/sshd/disable_root.sh" )
# Test jlb::system::sshd::disable_root
test_system_sshd_disable_root() {
	jlb::system::sshd::disable_root
	assertEquals "Test jlb::system::sshd::disable_root" "0" "$?"

	grep -e "^PermitRootLogin no" "${JLB_TESTS_TMP}/sshd_config" > /dev/null 2>&1
	assertEquals "Verify that the edit produced the expected result." "0" "$?"

	assertTrue "Test for temporary file creation" "[ -r ${JLB_TESTS_TMP}/restart-ssh ]"
}

# Load shUnit2.
source "$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))/shunit2/shunit2"
