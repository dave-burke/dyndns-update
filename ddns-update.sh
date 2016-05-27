#!/bin/bash

set -e

file=${HOME}/.pub_ip

[ -f "${file}" ] || touch "${file}"

old_ip="$(cat ${file})"
new_ip="$(dig +short myip.opendns.com @resolver1.opendns.com)"

if [ "${old_ip}" = "${new_ip}" ]; then
	echo "IP ${old_ip} has not changed"
else
	echo "IP changed: ${old_ip} -> ${new_ip}. Saving to ${file}"
	echo "${new_ip}" > "${file}"
fi

