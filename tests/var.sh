#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# shellcheck disable=SC1090
source "${DIR}/common.sh"

#---

testFiles+=( "/functions/var/string/validate/email.sh" )
# Test jlb::var::string::validate::email
test_jlb_var_string_validate_email-validEmails() {
	while read -r email; do
		if [[ "${email}" =~ ^[^#].+ ]] ; then
			jlb::var::string::validate::email "$email" "RFC5322" > /dev/null
			assertEquals "Test jlb::var::string::validate::email with address $email." "0" "$?"
		fi
	done <"${JLB_TESTS_TMP}/valid_emails.txt"
}
test_jlb_var_string_validate_email-invalidEmails() {
	while read -r email; do
		if [[ "${email}" =~ ^[^#].+ ]] ; then
			jlb::var::string::validate::email "$email" "RFC5322" 2> /dev/null
			assertEquals "Test jlb::var::string::validate::email with address $email." "1" "$?"
		fi
	done <"${JLB_TESTS_TMP}/invalid_emails.txt"
}
#	echo $?
#	jlb::var::string::validate::email "test@example,com"
#	echo $?
#	assertEquals "Test jlb::var::string::validate::email." "0" "jlb::var::string::validate::email 'test@example.com'"

#	grep "$(cat ${JLB_TESTS_TMP}/id_testkey.pub)" "${JLB_TESTS_TMP}/home/.ssh/authorized_keys" > /dev/null
#	assertEquals "Test jlb::user::ssh::add_public_key." "0" "$?"
#}

# ---

# Load shUnit2.
# shellcheck disable=SC1090
# shellcheck disable=SC2046
source "$(dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd ))/shunit2/shunit2"
