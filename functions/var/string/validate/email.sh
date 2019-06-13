#! /bin/bash

#-> CHECKS IF THE PROVIDED STRING IS VALID FOR AN EMAIL ADDRESS
#-> TAKES STRING AS ARG
#-> RETURNS 0 FOR VALID OR 1 FOR INVALID
function jlb::var::string::validate::email() {
	jlb::funcStart ; local errcode

	local mail_user

	mail_user="$1" ; shift

	if [[ "${mail_user}" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]] ; then
		errcode=0

		echo "Email address ${mail_user} is valid."
	else
		errcode=1

		jlb::printerr "Email address $mail_user is invalid."
	fi

	jlb::funcEnd "${errcode}" ; return ${errcode}
}
