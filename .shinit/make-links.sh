#!/bin/sh
#
# Creates the symbolic links necessary for each recognised shell
# (currently: bash, ksh, pdksh, sh, zsh) to utilise the initialisation
# scripts in ${HOME}/.shinit/ during its startup sequence.
#

if ! [ -x "${HOME}/.shinit" ]; then
	printf "${HOME}/.shinit non-existent, exiting\n" >&2; exit 2;
else
	if [ -n "${2-}" ]; then
		cd "${2}";
	else
		cd "${HOME}";
	fi;
	case "${1:-}" in
	bash)
		ln -fs ".shinit/login"		".bash_login";
		ln -fs ".shinit/logout"		".bash_logout";
		ln -fs ".shinit/bash/profile"	".bash_profile";
		ln -fs ".shinit/profile"	".bashrc";
		;;

	sh)
		ln -fs ".shinit/profile"	".profile";
		;;

	ksh|pdksh)
		;;

	zsh)
		ln -fs ".shinit/login"		".zlogin";
		ln -fs ".shinit/logout"		".zlogout";
		ln -fs ".shinit/zsh/env"	".zshenv";
		ln -fs ".shinit/profile"	".zshrc";
		;;

	*)
		printf "unknown or invalid shell \`%s'\n" "${1:-}" >&2;
		printf "usage: %s bash|ksh|pdksh|sh|zsh" "${0}" >&2;
		exit 3;
		;;
	esac;
fi;

# vim:filetype=sh foldmethod=marker noexpandtab sw=8 ts=8
