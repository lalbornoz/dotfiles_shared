#!/bin/sh
# $Id$
# Creates the symbolic links necessary for each recognized
# shell (currently: sh ksh zsh bash) to refer to the initialization
# scripts in ${HOME}/.shinit during its startup sequence.
#

usage() { echo "usage: $0 sh|ksh|zsh|bash"; };
[ -n $1 ] || { usage; exit 1; };
[    $2 ] && { HOME="$2"; };
[ -x "${HOME}/.shinit" ] || {
	echo ".shinit non-existent, exiting"; exit 2; };

cd "${HOME}"
 case "$1" in
	sh)
		ln -fs ".shinit/profile" ".profile"
		;;

	ksh)
		;;

	zsh)
		ln -fs ".shinit/zsh/env" ".zshenv"
		ln -fs ".shinit/profile" ".zshrc"
		ln -fs ".shinit/login" ".zlogin"
		ln -fs ".shinit/logout" ".zlogout"
		;;

	bash)
		ln -fs ".shinit/bash/profile" ".bash_profile"
		ln -fs ".shinit/profile" ".bashrc"
		ln -fs ".shinit/login" ".bash_login"
		ln -fs ".shinit/logout" ".bash_logout"
		;;

	*)
		echo "unknown shell"; usage;
		exit 3;
		;;
 esac
cd - >/dev/null

# vim:ts=8 sw=8 noexpandtab
