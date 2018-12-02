#!/bin/sh
#

process_shared_skel_legend="SHARED DOTFILES (/etc/skel/)";

process_shared_skel() {
	local _uname="${1}" _hname="${2}" _tags="${3}" _nflag="${4}" _src="";
	if [ "${_uname}" = "root" ]; then
		msgf "[1mTransfer shared dotfiles into /etc/skel/[0m: [4m%s@%s[0m\n" "${_uname}" "${_hname}";
		_src="$(find assets/dotfiles_shared			\
			-maxdepth 1 -mindepth 1				\
			-name '.*'					\
			-not -name '.git*' -not -name '.*.sw[op]'	\
			-print)"
		rsync_push "${_nflag}" "${_uname}" "${_hname}" "${_src}" "/etc/skel";
	fi;
};

# vim:foldmethod=marker sw=8 ts=8 tw=120
