#!/bin/sh
#

process_irssi_legend="[35;4m--- IRSSI                        ---[0m";

process_irssi() {
	local _uname="${1}" _hname="${2}" _tags="${3}" _src="";
	if [ -e "../dotfiles_private/${_uname}@${_hname}/.irssi" ]; then
		printf "[1mPull user- and host-local irssi dotdir[0m: [4m${_uname}@${_hname}[0m\n";
		rsync_pull "${_uname}" "${_hname}" ".irssi/" "../dotfiles_private/${_uname}@${_hname}/.irssi/";
  		printf "[1mCommit to Git repository[0m: [4m${_uname}@${_hname}[0m\n";
		(cd "../dotfiles_private/${_uname}@${_hname}"		\
		 && git add .irssi					\
		 && [ $(git status --porcelain .irssi | wc -l) -gt 0 ]	\
		 && git commit						\
			-m "Automatic irssi dotdir pull from ${_uname}@${_hname} to ${USER}@$(hostname -f)." .irssi || exit 0);
	fi;
};

# vim:foldmethod=marker sw=8 ts=8 tw=120
