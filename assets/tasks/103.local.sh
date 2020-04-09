#!/bin/sh
#

process_local_legend="LOCAL DOTFILES";

process_local() {
	local _uname="${1}" _hname="${2}" _tags="${3}" _nflag="${4}" _src="";
	if [ -e "../dotfiles_private/${_uname}@${_hname%.}" ]; then
		if [ "${_hname%.}" = "$(hostname)" ]; then
			msgf "(ignoring attempted transfer from local to local host)\n";
			return 0;
		fi;
		msgf "[1mTransfer user- and host-local dotfiles[0m: [4m%s@%s[0m\n" "${_uname}" "${_hname}";
		_src="$(find "../dotfiles_private/${_uname}@${_hname%.}"	\
			-maxdepth 1 -mindepth 1					\
			-name '.*' -not -name '.*.sw[op]'			\
			-printf '%p ')"
		rsync_push "${_nflag}" "${_uname}" "${_hname}"			\
			"${_src}" ""						\
			"--exclude=.directory_mode --exclude=.irssi --exclude=.ssh/private --exclude=.ssh/known_hosts";
		mode_push "${_nflag}" "${_uname}" "${_hname}";
	fi;
};

# vim:foldmethod=marker sw=8 ts=8 tw=120
