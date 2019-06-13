#! /bin/bash

#-> DISABLES ROOT ACCESS VIA SSH
#-> NO ARGS
#-> 
function jlb::system::sshd::disable_root() {
	jlb::funcStart ; local errcode

	jlb::is_root "exit"

    if sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config ; then
	    touch /tmp/restart-ssh
		errcode=$?
	else
		errcode=$?
	fi

	jlb::funcEnd "${errcode}" ; return ${errcode}
}
