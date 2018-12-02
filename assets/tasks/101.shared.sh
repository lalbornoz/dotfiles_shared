#!/bin/sh
#

process_shared_legend="SHARED DOTFILES";

process_shared() {
	local _uname="${1}" _hname="${2}" _tags="${3}" _nflag="${4}" _src="";
	msgf "[1mTransfer shared dotfiles[0m: [4m%s@%s[0m" "${_uname}" "${_hname}";
	_src="$(find assets/dotfiles_shared			\
		-maxdepth 1 -mindepth 1				\
		-name '.*'					\
		-not -name '.git*' -not -name '.*.sw[op]'	\
		-print)"
	rsync_push "${_nflag}" "${_uname}" "${_hname}"		\
		"${_src}" ""					\
		"--exclude=.irssi --exclude=.ssh/agent --exclude=.ssh/known_hosts";
};

# vim:foldmethod=marker sw=8 ts=8 tw=120
