#!/bin/sh
#

process_shared_legend="[35;4m--- SHARED DOTFILES              ---[0m";

process_shared() {
	local _uname="${1}" _hname="${2}" _tags="${3}" _src="";
	printf "[1mTransfer shared dotfiles[0m: [4m${_uname}@${_hname}[0m\n";
	_src="$(find .						\
		-maxdepth 1 -mindepth 1				\
		-name '.*'					\
		-not -name '.git*' -not -name '.*.sw[op]'	\
		-printf '%P ')"
	rsync_push "${_uname}" "${_hname}" "${_src}";
};

# vim:foldmethod=marker sw=8 ts=8 tw=120
