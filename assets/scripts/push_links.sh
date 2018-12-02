#!/bin/sh
# Executed as: push_links.sh inventory_hostname inventory_hostname_short ansible_ssh_user $(hostname -f) ${USER}
#

main() {
	local tree_type="${1}" tgt_hname="${2}" tgt_uname="${3}"	\
		src_hname="${4}" src_uname="${5}"; shift 5;
	return 0;
};

set -o errexit -o noglob; main "${@}";

# vim:sw=8 ts=8
