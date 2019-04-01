#!/bin/sh
#

process_shared_skel_legend="SHARED DOTFILES (/etc/skel/)";

process_shared_skel() {
	local _uname="${1}" _hname="${2}" _tags="${3}" _nflag="${4}";
	if [ "${_uname}" = "root" ]; then
		msgf "[1mTransfer shared dotfiles into /etc/skel/[0m: [4m%s@%s[0m\n" "${_uname}" "${_hname}";
		rsync_push "${_nflag}" "${_uname}" "${_hname}"			\
			"assets/dotfiles_shared/" "/etc/skel"			\
			--include-from=assets/dotfiles_shared/.RSYNC_INCLUDE_FROM;
	fi;
};

# vim:foldmethod=marker sw=8 ts=8 tw=120
