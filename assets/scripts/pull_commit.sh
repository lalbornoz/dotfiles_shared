#!/bin/sh
#

main() {
	local git_pname="${1}" git_msg="${2}" pull_files="";
	shift 2; pull_files="${*}";
	cd "${git_pname}"; git add ${pull_files};
	if [ $(git status --porcelain -- ${pull_files} | wc -l) -gt 0 ]; then
		git commit -m "${git_msg}" ${pull_files};
	else
		git reset -- ${pull_files};
	fi;
};

set -o errexit -o noglob; main "${@}";

# vim:tw=0 wrap
