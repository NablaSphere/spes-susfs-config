# spes-susfs-config

BakaSU module for `spes-kernel` (`bakasu-susfs-nmnt`) targeting BakaSU `ksud` and SUSFS v2.4.0.

## Behavior

- **Install (`customize.sh`)**: Writes a spoofed `/proc/cmdline` copy to `/data/adb/susfs_cmdline.txt` (`0600`), adds `avc_log_spoofing`, `hide_sus_mnts_for_non_su_procs`, and `cmdline_or_bootconfig`, and registers existing paths (`/data/adb`, `/data/adb/ksu`, `/data/adb/modules`, `/data/adb/nomount`, `/system/addon.d`) as `sus_path`.
- **Boot (`post-fs-data.sh`)**: Regenerates `/data/adb/susfs_cmdline.txt` from `/proc/cmdline` before boot completion and sets `ro.boot.verifiedbootstate` to `green` via `ksud resetprop -n`.
- **Uninstall (`uninstall.sh`)**: Removes the `cmdline_or_bootconfig` SUSFS config entry and deletes `/data/adb/susfs_cmdline.txt`.

## Packaging

```sh
zip -r spes-susfs-config-v1.0.0.zip module.prop skip_mount customize.sh post-fs-data.sh uninstall.sh
```
