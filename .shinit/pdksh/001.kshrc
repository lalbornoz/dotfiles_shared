# $Id$
# Korn shell specific commands
#

set -o emacs;				# Prefer emacs line editing

#
# The particular flavour of Ksh distributed with NetBSD does not understand
# the prompt string meta-characters unlike its OpenBSD equivalent, hence
# PS1 shall be left intact given NetBSD.
_sname "OpenBSD" && PS1="\u@\h:(\w)> \$ ";

# vim:ts=8 sw=8 tw=80 noexpandtab filetype=sh
