#! /bin/bash

path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "${path}/functions" || exit

#-> DECLARE THE ARRAY WHICH WILL CONTAIN THE LIST OF FILES TO PASS TO SHELLCHECK
declare -a files
#-> ADD NON *.sh CORE FILES
files+=(${path}/functions/debug)
files+=(${path}/functions/funcEnd)
files+=(${path}/functions/funcStart)
files+=(${path}/functions/init)
files+=(${path}/functions/loader)
files+=(${path}/functions/printerr)
files+=(${path}/shellcheck.sh)
files+=(${path}/skeleton.sh)

#-> ADD REMAINING FUNCTION FILES ENDING IN .sh
files+=(${path}/functions/*.sh)
files+=(${path}/functions/*/*.sh)
files+=(${path}/functions/*/*/*.sh)
files+=(${path}/functions/*/*/*/*.sh)

shellcheck --color=always --shell=bash --external-sources "${files[@]}" "${@}"
