#! /bin/bash

#-> 
#-> 
#-> 
function system_ip_getPublic() {
	funcStart

	# returns the primary IP assigned to eth0
	#echo $(ifconfig eth0 | awk -F: '/inet addr:/ {print $2}' | awk '{ print $1 }')
	#curl ipv4.icanhazip.com
	dig @resolver1.opendns.com ANY myip.opendns.com +short -4
	errcode=$?

	funcEnd "$errcode"
	return $errcode
}
