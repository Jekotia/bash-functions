#! /bin/bash

#-> CHECKS IF THE PROVIDED STRING IS VALID FOR AN EMAIL ADDRESS
#-> TAKES STRING AS ARG
#-> RETURNS 0 FOR VALID OR 1 FOR INVALID
function var_string_validate_email() {
	funcStart ; local errcode
	local mail_user
	mail_user="$1"

	if [[ "${mail_user}" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]] ; then
		echo "Email address ${mail_user} is valid."

		funcEnd "$errcode"
		return 0
	else
		errcho "Email address $mail_user is invalid."

		funcEnd "$errcode"
		return 1
	fi
}
