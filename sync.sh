#!/bin/sh

#
# Tunables
#
: ${SYNC_DEFAULT_ITEMS:=""};
: ${SYNC_DEFAULT_TAGS:="dotfiles irssi"};
: ${SYNC_DOTFILES_EXCLUDES:="
	***/__pycache__/
	***/*.sw[op]
	***/.*.sw[op]
	***/.directory_mode
	***/.directory_optional
	***/.shared_directory
	.git/
	.gitignore
	.gitmodules
	.irssi*/
	.mutt/certificates
	.ssh/known_hosts
	.ssh/private/"};
: ${SYNC_DOTFILES_LEGEND:="SHARED AND {HOST,USER}-LOCAL DOTFILES"};
: ${SYNC_IRSSI_LEGEND:="Irssi directories"};
: ${SYNC_LOG_FNAME:=""};

# {{{ msgf([--], [$_attrs], [$_fmt], [...])
msgf() {
	[ "x${1}" = "x--" ] && { local _cflag=1; shift; } || local _cflag=0;
	local	_attrs="${1:-}" _fmt="${2:-}" _attr_reset="[0m" _msg=""	\
		_ts="$(date +"%d-%^b-%Y %H:%M:%S")"; shift $(((2>$#)?$?:2));
	[ "${#_attrs}" -gt 0 ] && _attrs="[${_attrs}m";

	case "${_cflag}" in
	0)	printf "%s${_fmt}[0m" "${_attrs:+${_attr_reset}${_attrs}}" "${@}" >/dev/tty;
		[ -n "${SYNC_LOG_FNAME}" ] && printf "${_fmt}" "${@}" >>"${SYNC_LOG_FNAME}"; ;;
	1)	printf "%s%s >>> ${_fmt}[0m" "${_attrs:+${_attr_reset}${_attrs}}" "${_ts}" "${@}" >/dev/tty;
		[ -n "${SYNC_LOG_FNAME}" ] && printf "%s >>> ${_fmt}" "${_ts}" "${@}" >>"${SYNC_LOG_FNAME}"; ;;
	esac;
};
# }}}
# {{{ msgf_log_fname($_fname)
msgf_log_fname() {
	local _fname="${1}";

	SYNC_LOG_FNAME="${_fname}"; printf "" > "${SYNC_LOG_FNAME}";
};
# }}}

# {{{ build_excludes()
build_excludes() {
	local _pname="" _IFS0="";
	_IFS0="${IFS}"; IFS="
";	for _pname in "${@}"; do
		printf -- "- %s\n" "${_pname}";
	done; IFS="${_IFS0}";
};
# }}}
# {{{ build_finish()
build_finish() {
	printf -- "- *\n";
};
# }}}
# {{{ build_includes($_dname_top, $_dname, [$_optionalfl=0], [$_relfl=1], [$_topfl=1])
build_includes() {
	local	_dname_top="${1}" _dname="${2:-}" _optionalfl="${3:-0}" _relfl="${4:-1}"	\
		_topfl="${5:-1}" _dname_abs="${1}${2:+/${2}}" _dname_rel="" _dname_sub=""	\
		_find_namefl="" _fname="" _IFS0="";
	[ "${_topfl:-0}" -eq 0 ] && _find_namefl="-or -name *";
	[ "${_relfl:-0}" -eq 0 ] && _dname_rel="${_dname_top%%/}${_dname:+/${_dname%%/}}/" || _dname_rel="${_dname:+${_dname%%/}/}";
	[ -n "${_dname_rel}" ] && printf -- "+ %s\n" "${_dname_rel}";
	_IFS0="${IFS}"; IFS="
";	for _dname_sub in $(IFS=" "; cd "${_dname_abs}" && find					\
			-maxdepth 1 -mindepth 1							\
			-name '.*' ${_find_namefl} -type d -printf '%P\n'); do
		if [ -e "${_dname_abs}/${_dname_sub}/.directory_optional" ]\
		&& [ "${_optionalfl}" -ne 1 ]; then
			continue;
		fi;
		if ! [ -e "${_dname_abs}/${_dname_sub}/.shared_directory" ]; then
			printf -- "+ %s%s/***\n" "${_dname_rel}" "${_dname_sub}";
			printf -- "+ %s%s/\n" "${_dname_rel}" "${_dname_sub}";
		else
			IFS="${_IFS0}" build_includes "${_dname_top}"				\
				"${_dname:+${_dname}/}${_dname_sub}"				\
				"${_optionalfl}" "${_relfl}" 0;
		fi;
	done;
	for _fname in $(IFS=" "; cd "${_dname_abs}" && find					\
			-maxdepth 1 -mindepth 1							\
			\( -name '.*' ${_find_namefl} \)					\
			-not -type d -printf '%P\n'); do
		printf -- "+ %s%s\n" "${_dname_rel}" "${_fname}";
	done; IFS="${_IFS0}";
};
# }}}
# {{{ mode_push($_nflag, $_uname, $_hname)
mode_push() {
	local _nflag="${1}" _uname="${2}" _hname="${3}" _mode="";
	if [ -e "../dotfiles_private/${_uname}@${_hname%.}/.directory_mode" ]\
	&& _mode="$(cat "../dotfiles_private/${_uname}@${_hname%.}/.directory_mode")"\
	&& [ -n "${_mode}" ]; then
		msgf -- "90" "Setting remote directory mode to %s.\n" "${_mode}";
		if [ "${_nflag}" -eq 0 ]; then
			ssh -l "${_uname}" "${_hname}" "chmod ${_mode} .";
		else
			echo ssh -l "${_uname}" "${_hname}" "chmod ${_mode} .";
		fi;
	fi;
};
# }}}
# {{{ rsync_pull($_nflag, $_uname, $_hname, $_dest, $_include_fname, $_rsync_args_extra, $_src)
rsync_pull() {
	local	_nflag="${1}" _uname="${2}" _hname="${3}" _dest="${4}"			\
		_include_fname="${5}" _rsync_args_extra="${6}" _src="${7}";

	[ "${_nflag}" -eq 0 ] && _nflag="";
	if [ "${#}" -eq 0 ]; then
		echo "error: melp?"; exit 1;
	else
		if [ "${#SYNC_LOG_FNAME}" -eq 0 ]; then
			rsync	-aHiPve ssh						\
				--delete						\
				${_include_fname:+--include-from="${_include_fname}"}	\
				--no-group						\
				--no-owner						\
				${_rsync_args_extra}					\
				${_nflag:+-n}						\
				"${_uname}@${_hname}:${_src}"				\
				"${_dest}";
		else
			rsync	-aHiPve ssh						\
				--delete						\
				${_include_fname:+--include-from="${_include_fname}"}	\
				--no-group						\
				--no-owner						\
				${_rsync_args_extra}					\
				${_nflag:+-n}						\
				"${_uname}@${_hname}:${_src}"				\
				"${_dest}"						\
				| tee -a "${SYNC_LOG_FNAME}";
		fi;
	fi;
};
# }}}
# {{{ rsync_push($_nflag, $_uname, $_hname, $_destdir, $_include_fname, $_rsync_args_extra)
rsync_push() {
	local	_nflag="${1}" _uname="${2}" _hname="${3}" _dest="${4}"			\
		_include_fname="${5}" _rsync_args_extra="${6}" _src=""; shift 6;
	[ "${_nflag}" -eq 0 ] && _nflag="";
	if [ "${#}" -eq 0 ]; then
		echo "error: melp?"; exit 1;
	else
		if [ "${#SYNC_LOG_FNAME}" -eq 0 ]; then
			rsync	-aHiPve ssh						\
				--delete						\
				"${_include_fname:+--include-from=${_include_fname}}"	\
				--no-group						\
				--no-owner						\
				${_rsync_args_extra}					\
				${_nflag:+-n}						\
				"${@}"							\
				"${_uname}@${_hname}:${_dest}";
		else
			rsync	-aHiPve ssh						\
				--delete						\
				"${_include_fname:+--include-from=${_include_fname}}"	\
				--no-group						\
				--no-owner						\
				${_rsync_args_extra}					\
				${_nflag:+-n}						\
				"${@}"							\
				"${_uname}@${_hname}:${_dest}"				\
				| tee -a "${SYNC_LOG_FNAME}";
		fi;
	fi;
};
# }}}

# {{{ process_dotfiles($_nflag, $_domain, $_hname, $_uname)
process_dotfiles() {
	local	_nflag="${1}" _domain="${2}" _hname="${3}" _uname="${4}"		\
		_private_dname="../dotfiles_private/${4}@${3%.}" _shared_dname=".";

	if [ "${_hname}" = "$(hostname -f | sed -ne '/^[^\.]\+$/s/$/.local/')" ]\
	&& [ "${_uname}" = "$(id -nu)" ]; then
		msgf -- "36" "(ignoring attempted transfer from local to local host)\n";
		return 0;
	elif [ -e "${_shared_dname}" ]\
	||   [ -e "${_private_dname}" ]; then
		case "${_uname}" in
		[rR][oO][oO][tT])
			msgf -- "36" "Transfer shared dotfiles into /etc/skel/: "
			msgf "1" "%s@%s\n" "${_uname}" "${_hname}";
			process_dotfiles_						\
				"${_nflag}" "/etc/skel" "${_domain}" "${_hname}"	\
				"" "${_shared_dname}" "${_uname}"; ;;
		esac;
		msgf -- "36" "Transfer shared and {user,host}-local dotfiles: ";
		msgf "1" "%s@%s\n" "${_uname}" "${_hname}";
		process_dotfiles_							\
			"${_nflag}" "" "${_domain}" "${_hname}"				\
			"${_private_dname}" "${_shared_dname}" "${_uname}";
	fi;
};
# }}}
# {{{ process_dotfiles_($_nflag, $_dst, $_domain, $_hname, $_private_dname, $shared_dname, $_uname)
process_dotfiles_() {
	local	_nflag="${1}" _dst="${2}" _domain="${3}" _hname="${4}" _private_dname="${5}"	\
		_shared_dname="${6}" _uname="${7}" _dname="" _fname="" _include_fname="";

	if _include_fname="$(mktemp -t "${0##*/}.XXXXXX")"; then
		trap "rm -f \"${_include_fname}\" 2>/dev/null" EXIT HUP INT TERM USR1 USR2;
		build_excludes ${SYNC_DOTFILES_EXCLUDES} >>"${_include_fname}";
		build_includes "${_shared_dname}" >>"${_include_fname}";
		for _fname in $(cd "${_shared_dname}" && find					\
				-mindepth 2 -maxdepth 2						\
				-type f -name ".directory_optional"); do
			_dname="${_fname#./}"; _dname="${_dname%.directory_optional}";
			if ! [ -e "${_private_dname}/${_dname}" ]; then
				build_excludes "${_dname}" >>"${_include_fname}";
			fi;
		done;

		if [ -e "${_private_dname}" ]; then
			build_includes "${_private_dname}" "" 1 >>"${_include_fname}";
			build_finish >>"${_include_fname}";
			rsync_push "${_nflag}" "${_uname}" "${_hname}" "${_dst}"		\
				"${_include_fname}" ""						\
				"${_private_dname}/" "${_shared_dname}/";
		else
			build_finish >>"${_include_fname}";
			rsync_push "${_nflag}" "${_uname}" "${_hname}" "${_dst}"		\
				"${_include_fname}" ""						\
				"${_shared_dname}/";
		fi;
		mode_push "${_nflag}" "${_uname}" "${_hname}";

		rm -f "${_include_fname}" 2>/dev/null;
		trap - EXIT HUP INT TERM USR1 USR2;
	fi;
};
# }}}
# {{{ process_irssi($_nflag, $_domain, $_hname, $_uname)
process_irssi() {
	local	_nflag="${1}" _domain="${2}" _hname="${3}" _uname="${4}"	\
		_private_dname="../dotfiles_private/${4}@${3%.}";

	if [ "$(find "${_private_dname}" -maxdepth 1 -mindepth 1 -type d -name .irssi\* 2>/dev/null | wc -l)" -gt 0 ]; then
		msgf -- "36" "Pull user- and host-local irssi dotdir: ";
		msgf "1" "%s@%s\n" "${_uname}" "${_hname}";
		rsync_pull "${_nflag}" "${_uname}" "${_hname}"			\
			"${_private_dname%/}/"					\
			"" "--exclude=away.log --exclude=logs"			\
			".irssi*";
		if [ "${_nflag}" -eq 0 ]; then
			msgf -- "36" "Commit to Git repository: ";
			msgf "1" "%s@%s\n" "${_uname}" "${_hname}";
			(set +o noglob;						\
			 cd "${_private_dname}"					\
			 && git add .irssi*					\
			 && [ $(git status --porcelain .irssi* | wc -l) -gt 0 ]\
			 && git commit						\
				-m "Automatic irssi dotdir pull from ${_uname}@${_hname} to ${USER}@$(hostname -f)." .irssi* || exit 0);
		fi;
	fi;
};
# }}}

sync() {
	local _hname="" _item="" _nflag=0 _opt="" _rc=0 _tag="" _tags="" _uname="";

	while getopts hl:nt:x _opt; do
	case "${_opt}" in
	l)	msgf_log_fname "${OPTARG}"; ;;
	n)	_nflag=1; ;;
	t)	_tags="${OPTARG}"; ;;
	x)	set -o xtrace; ;;
	h|*)	printf "usage: %s [-h] [-l <fname>] [-n] [-t <tag>[ <tag>..]] [-x] [--] [uname@hname [uname@hname..]]\n" "${0}" >&2; return 2; ;;
	esac;
	done; shift $((${OPTIND}-1));

	if [ "${#}" -eq 0 ]\
	&& [ -e "${HOME}/.sync.hosts" ]; then
		set -- $(cat "${HOME}/.sync.hosts");
	fi;
	if [ "${#}" -eq 0 ]; then
		set -- ${SYNC_DEFAULT_ITEMS};
	fi;
	if [ "${#_tags}" -eq 0 ]; then
		_tags="${SYNC_DEFAULT_TAGS}";
	fi;

	while [ "${#}" -gt 0 ]; do
		_uname="${1%@*}"; _hname="${1##*@}"; _hname="${_hname%.}."; shift;
		for _tag in ${_tags}; do
			"process_${_tag}" "${_nflag}" "dotfiles" "${_hname%.}." "${_uname}";
			_rc=$((${?} ? ${?} : ${_rc}));
		done;
	done;
	return "${_rc}";
};

set +o errexit -o noglob -o nounset; export LANG=C LC_ALL=C; sync "${@}";
