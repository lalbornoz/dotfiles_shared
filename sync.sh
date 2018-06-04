#!/bin/sh
#

lsearch() {
	local _list="${1}" _litem="${2}";
	set -- "${_list}";
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
	local	_hflag="" _lflag="" _nflag=0 _xflag=0 _tags="${@}"	\
		_fun="" _funs="" _hname="" _hosts_line="" _script_fname="" _uname="";
	for _script_fname in $(set +o noglob; echo tasks/*.sh); do
		. "${_script_fname}";
		_fun="${_script_fname##*/}";
		_fun="${_fun#*.}"; _fun="process_${_fun%%.sh}";
		_funs="${_funs:+${_funs} }${_fun}";
	done;
	for _fun in ${_funs}; do
		if [ -n "${_tags}" ]					\
		&& ! lsearch "${_tags}" "${_fun#process_}"; then
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
				"${_fun}" "${_uname}" "${_hname}" "${_tags}";
			fi;
		done < "./hosts";
	done;
};

set -o errexit -o noglob;
main "${@}";

# vim:foldmethod=marker sw=8 ts=8 tw=120
