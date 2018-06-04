#!/bin/sh
#

lsearch() {
	local _list="${1}" _litem="${2}";
	set -- ${_list};
	while [ ${#} -gt 0 ]; do
		if [ "${1}" = "${_litem}" ]; then
			return 0;
		else
			shift;
		fi;
	done; return 1;
};

rsync_pull() {
	local _uname="${1}" _hname="${2}" _src="${3}" _dest="${4:-}";
	rsync	-aHiPve ssh		\
		--delete		\
		--exclude=away.log	\
		--exclude=logs		\
		--no-group		\
		--no-owner		\
		"${_uname}@${_hname}:${_src}" "${_dest}";
};

rsync_push() {
	local _uname="${1}" _hname="${2}" _src="${3}" _dest="${4:-}";
	[ -z "${_src}" ] && { echo "error: melp?"; exit 1; };
	rsync	-aHiPve ssh		\
		--delete		\
		--exclude=.irssi	\
		--no-group		\
		--no-owner		\
		${_src} "${_uname}@${_hname}:${_dest}";
};

main() {
	local	_Hflag="" _lflag="" _nflag=0 _tflag="" _xflag=0		\
		_fun="" _funs="" _hname="" _hosts_line="" _opt=""	\
		_script_fname="" _uname="";
	while getopts hH:lnt:x _opt; do
	case "${_opt}" in
	H) _Hflag="$(echo "${OPTARG}" | sed 's/,/ /g')"; ;;
	l) _lflag=1; ;;
	n) _nflag=1; ;;
	t) _tflag="${OPTARG}"; ;;
	x) _xflag=1; set -o xtrace; ;;
	*) echo "usage: ${0} [-h] [-H host..] [-n] [-t tag..] [-x]" >&2;
	   echo "       -h.......: show this screen" >&2;
	   echo "       -H host..: limit by hostname" >&2;
	   echo "       -n.......: perform dry run" >&2;
	   echo "       -t tag...: limit by tag" >&2;
	   echo "       -x.......: enable xtrace debugging" >&2;
	   exit 0; ;;
	esac; done;
	for _script_fname in $(set +o noglob; echo tasks/*.sh); do
		. "${_script_fname}";
		_fun="${_script_fname##*/}";
		_fun="${_fun#*.}"; _fun="process_${_fun%%.sh}";
		_funs="${_funs:+${_funs} }${_fun}";
	done;
	for _fun in ${_funs}; do
		if [ -n "${_tflag}" ]					\
		&& ! lsearch "${_tflag}" "${_fun#process_}"; then
			continue;
		else
			eval echo "\${${_fun}_legend}";
		fi;
		while read _hosts_line; do
			if [ -z "${_hosts_line}" ]			\
			|| [ "${_hosts_line#\#}" != "${_hosts_line}" ]; then
				continue;
			fi;
			_uname="${_hosts_line%%@*}"; _hname="${_hosts_line##*@}";
			if [ -n "${_uname}" ]				\
			&& [ -n "${_hname}" ]; then
				if [ -n "${_Hflag}" ]			\
				&& ! lsearch "${_Hflag}" "${_hname}"; then
					continue;
				elif [ "${_nflag}" -eq 1 ]; then
					echo "${_fun}" "${_uname}" "${_hname}" "${_tflag}";
				else
					"${_fun}" "${_uname}" "${_hname}" "${_tflag}";
				fi;
			fi;
		done < "./hosts";
	done;
};

set -o errexit -o noglob;
main "${@}";

# vim:foldmethod=marker sw=8 ts=8 tw=120
