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

msgf() {
	local _fmt="${1}"; shift;
	printf "%s >>> ${_fmt}\n" "$(date +"%d-%^b-%Y %H:%M:%S")" "${@}";
};

rsync_pull() {
	local _nflag="${1:-}" _uname="${2}" _hname="${3}" _src="${4}" _dest="${5:-}" _rsync_args_extra="${6:-}";
	rsync	-aHiPve ssh		\
		--delete		\
		--no-group		\
		--no-owner		\
		${_rsync_args_extra}	\
		${_nflag:+-n}		\
		"${_uname}@${_hname}:${_src}" "${_dest}";
};

rsync_push() {
	local _nflag="${1:-}" _uname="${2}" _hname="${3}" _src="${4}" _dest="${5:-}" _rsync_args_extra="${6:-}";
	[ -z "${_src}" ] && { echo "error: melp?"; exit 1; };
	rsync	-aHiPve ssh		\
		--delete		\
		--no-group		\
		--no-owner		\
		${_rsync_args_extra}	\
		${_nflag:+-n}		\
		${_src} "${_uname}@${_hname}:${_dest}";
};

list_all() {
	local _hname="" _hosts_line="" _script_fname="" _tag="" _uname="":

	printf "[1mHosts:[0m\n";
	while read _hosts_line; do
		if [ -z "${_hosts_line}" ]	\
		|| [ "${_hosts_line#\#}" != "${_hosts_line}" ]; then
			continue;
		fi;
		_uname="${_hosts_line%%@*}"; _hname="${_hosts_line##*@}";
		printf "${_uname}@[4m${_hname}[0m\n";
	done < "./hosts" | sort -t@ -k2; printf "\n";

	printf "[1mTags:[0m";
	for _script_fname in $(set +o noglob; echo tasks/*.sh); do
		_tag="${_script_fname##*/}";
		_tag="${_tag#*.}"; _tag="${_tag%%.sh}";
		printf " ${_tag}";
	done; printf "\n";
};

usage() {
	echo "usage: ${0} [-h] [-c] [-F host..] [-H host..] [-l] [-n] [-t tag..] [-x]" >&2;
	echo "       -h.......: show this screen" >&2;
	echo "       -c.......: continue on soft failure" >&2;
	echo "       -F host..: filter by hostname (processed after -H)" >&2;
	echo "       -H host..: limit by hostname" >&2;
	echo "       -l.......: list hosts & tags and exit" >&2;
	echo "       -n.......: perform dry run" >&2;
	echo "       -t tag...: limit by tag" >&2;
	echo "       -x.......: enable xtrace debugging" >&2;
};

main() {
	local	_cflag="" _Fflag="" _Hflag="" _nflag="" _tflag="" _xflag=0	\
		_fun="" _funs="" _hname="" _hosts_line="" _opt="" _rc=""	\
		_script_fname="" _uname="";
	while getopts chF:H:lnt:x _opt; do
	case "${_opt}" in
	c) _cflag=1; ;;
	F) _Fflag="$(echo "${OPTARG}" | sed 's/,/ /g')"; ;;
	h) usage; exit 0; ;;
	H) _Hflag="$(echo "${OPTARG}" | sed 's/,/ /g')"; ;;
	l) list_all; exit 0; ;;
	n) _nflag=1; ;;
	t) _tflag="$(echo "${OPTARG}" | sed 's/,/ /g')"; ;;
	x) _xflag=1; set -o xtrace; ;;
	*) usage; exit 1; ;;
	esac; done;
	for _script_fname in $(set +o noglob; echo tasks/*.sh); do
		. "${_script_fname}";
		_fun="${_script_fname##*/}";
		_fun="${_fun#*.}"; _fun="process_${_fun%%.sh}";
		_funs="${_funs:+${_funs} }${_fun}";
	done; shift $((${OPTIND}-1));
	for _fun in ${_funs}; do
		if [ -n "${_tflag}" ]						\
		&& ! lsearch "${_tflag}" "${_fun#process_}"; then
			continue;
		else
			msgf "[35;4m--- %s ---[0m" "$(eval echo "\${${_fun}_legend}")";
		fi;
		while read _hosts_line; do
			if [ -z "${_hosts_line}" ]				\
			|| [ "${_hosts_line#\#}" != "${_hosts_line}" ]; then
				continue;
			fi;
			_uname="${_hosts_line%%@*}"; _hname="${_hosts_line##*@}";
			if [ -n "${_uname}" ]					\
			&& [ -n "${_hname}" ]; then
				if [ -n "${_Hflag}" ]				\
				&& ! lsearch "${_Hflag}" "${_hname}"; then
					continue;
				fi;
				if [ -n "${_Fflag}" ]				\
				&& lsearch "${_Fflag}" "${_hname}"; then
					continue;
				fi;
				set +o errexit;
				(set -o errexit;
				 "${_fun}" "${_uname}" "${_hname}" "${_tflag}" "${_nflag}"); _rc="${?}";
				set -o errexit;
				if [ "${_rc:-1}" -ne 0 ]; then
					if [ "${_cflag:-0}" -eq 0 ]; then
						exit "${_rc}";
					else
						msgf "[31m(ignoring soft failure due to -c)[0m";
					fi;
				fi;
			fi;
		done < "./hosts";
	done;
};

set -o errexit -o noglob;
main "${@}";

# vim:foldmethod=marker sw=8 ts=8 tw=120
