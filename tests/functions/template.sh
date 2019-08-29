#! /bin/bash
#shellcheck disable=SC1090
source "$(git rev-parse --show-toplevel)/tests/common.sh"

testFiles+=( "" )
test_() {
	jlb::<function> "arg1" "arg2"
	assertEquals "Test jlb::<function>." "0" "$?"
}

#shellcheck disable=SC2154
source "$shunit2Path"
