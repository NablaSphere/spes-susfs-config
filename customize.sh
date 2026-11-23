KSUD=/data/adb/ksud
CMDLINE=/data/adb/susfs_cmdline.txt

sed -e 's/androidboot\.verifiedbootstate=orange/androidboot.verifiedbootstate=green/g' \
    -e 's/androidboot\.vbmeta\.device_state=unlocked/androidboot.vbmeta.device_state=locked/g' \
    -e 's/androidboot\.flash\.locked=0/androidboot.flash.locked=1/g' \
    /proc/cmdline > "$CMDLINE"
chmod 600 "$CMDLINE"

"$KSUD" susfs config avc_log_spoofing add
"$KSUD" susfs config hide_sus_mnts_for_non_su_procs add
"$KSUD" susfs config cmdline_or_bootconfig add "$CMDLINE"

for p in /data/adb /data/adb/ksu /data/adb/modules /data/adb/nomount /system/addon.d; do
    [ -e "$p" ] && "$KSUD" susfs config sus_path add "$p"
done
