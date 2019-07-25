#!/bin/sh
#

process_appdata_legend="%APPDATA% subdirectories";

process_appdata() {
	local	_uname="${1}" _hname="${2}" _tags="${3}" _nflag="${4}";
	if [ -e "../dotfiles_private/${_uname}_%APPDATA%@${_hname%.}" ]; then
		msgf "[1mPull user-local %%APPDATA%% subdirectories[0m: [4m%s@%s[0m\n" "${_uname}" "${_hname}";
		rsync_pull "${_nflag}" "${_uname}" "${_hname}"				\
			"/cygdrive/c/Users/${_uname}/AppData/Roaming/"			\
			"../dotfiles_private/${_uname}_%APPDATA%@${_hname%.}/"		\
			"--exclude=.RSYNC_FILES_FROM --include-from=../dotfiles_private/${_uname}_%APPDATA%@${_hname%.}/.RSYNC_FILES_FROM";
		if [ "${_nflag:-0}" -eq 0 ]; then
			msgf "[1mCommit to Git repository[0m: [4m%s@%s[0m\n" "${_uname}" "${_hname}";
			(cd "../dotfiles_private/${_uname}_%APPDATA%@${_hname%.}"	\
			 && git add .							\
			 && [ $(git status --porcelain . | wc -l) -gt 0 ]		\
			 && git commit							\
				-m "Automatic %APPDATA% subdirectory pull from ${_uname}@${_hname} to ${USER}@$(hostname -f)." . || exit 0);
		fi;
	fi;
};

# vim:foldmethod=marker sw=8 ts=8 tw=120
