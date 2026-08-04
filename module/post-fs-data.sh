#!/bin/sh
# post-fs-data.sh
# No warranty.
# No rights reserved.
# This is free software; you can redistribute it and/or modify it under the terms of The Unlicense.
PATH=/data/adb/ksu/bin:$PATH
MODDIR="/data/adb/modules/ksu_toolkit"
KSUDIR="/data/adb/ksu"

# boot-time uname change in post-fs-data to avoid inconsistency between uname and zygote 
# java os.version kernel name probing.
# https://github.com/eltavine/Duck-Detector-Refactoring/issues/72
if [ -f "$KSUDIR/.uname" ] && grep -qE "RELEASE=|VERSION=" "$KSUDIR/.uname"; then
	. "$KSUDIR/.uname"
	"$MODDIR/toolkit" --fkuname "$RELEASE" "$VERSION" > /dev/null 2>&1
fi

# EOF
