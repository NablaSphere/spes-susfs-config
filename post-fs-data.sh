#!/system/bin/sh
CMDLINE=/data/adb/susfs_cmdline.txt

sed -e 's/androidboot\.verifiedbootstate=orange/androidboot.verifiedbootstate=green/g' \
    -e 's/androidboot\.vbmeta\.device_state=unlocked/androidboot.vbmeta.device_state=locked/g' \
    -e 's/androidboot\.flash\.locked=0/androidboot.flash.locked=1/g' \
    /proc/cmdline > "$CMDLINE"
chmod 600 "$CMDLINE"

/data/adb/ksud resetprop -n ro.boot.verifiedbootstate green
