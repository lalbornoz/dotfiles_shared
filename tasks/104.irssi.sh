#!/bin/sh
#

process_irssi_legend="IRSSI";

process_irssi() {
	local _uname="${1}" _hname="${2}" _tags="${3}" _nflag="${4}" _src="";
	if [ -e "../dotfiles_private/${_uname}@${_hname}/.irssi" ]; then
		msgf "[1mPull user- and host-local irssi dotdir[0m: [4m%s@%s[0m\n" "${_uname}" "${_hname}";
		rsync_pull "${_nflag}" "${_uname}" "${_hname}"			\
			".irssi/"						\
			"../dotfiles_private/${_uname}@${_hname}/.irssi/"	\
			"--exclude=away.log --exclude=logs";
		if [ "${_nflag:-0}" -eq 0 ]; then
			msgf "[1mCommit to Git repository[0m: [4m%s@%s[0m\n" "${_uname}" "${_hname}";
			(cd "../dotfiles_private/${_uname}@${_hname}"			\
			 && git add .irssi						\
			 && [ $(git status --porcelain .irssi | wc -l) -gt 0 ]		\
			 && git commit							\
				-m "Automatic irssi dotdir pull from ${_uname}@${_hname} to ${USER}@$(hostname -f)." .irssi || exit 0);
		fi;
	fi;
};

# vim:foldmethod=marker sw=8 ts=8 tw=120
