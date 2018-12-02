#!/bin/sh
rc() {
	local _choice;
	echo "$@"; printf "Run command? (y|N) "; read _choice;
	case "${_choice}" in
	[yY])	"$@"; ;;
	*)	;;
	esac;
};
rc adb root;
rc adb shell pm set-install-location 2;
for __ in $(find . -name \*.apk -printf '%P\n'); do
	rc adb push ${__} /storage/sdcard0;
	rc adb shell pm install -s /storage/sdcard0/${__};
done;
