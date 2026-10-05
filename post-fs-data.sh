#!/system/bin/sh
# M51 -> S22 identity spoof (for UN1CA). Runs early (post-fs-data) so
# system_server / apps see the spoofed build identity from the start.

POLICY_MODEL="SM-S901E"
FINGERPRINT="samsung/r0qxxx/r0q:16/BP2A.250605.031.A3/S901EXXSEGZH4:user/release-keys"
BUILD_ID="BP2A.250605.031.A3"
INCREMENTAL="S901EXXSEGZH4"
BUILD_DATE="Tue Aug 18 21:27:13 KST 2026"
BUILD_DATE_UTC="1787056033"

# ---- build / ROM identity ----
resetprop -n ro.build.flavor r0qxxx-user
resetprop -n ro.bootloader S901EXXSEGZH4
resetprop -n ro.quick_start.device_id SM-S901

resetprop -n ro.vendor.build.fingerprint "$FINGERPRINT"
resetprop -n ro.vendor.build.id "$BUILD_ID"
resetprop -n ro.vendor.build.version.incremental "$INCREMENTAL"
resetprop -n ro.vendor.build.version.release 16
resetprop -n ro.vendor.build.version.release_or_codename 16
resetprop -n ro.vendor.build.version.sdk 36
resetprop -n ro.vendor.build.date "$BUILD_DATE"
resetprop -n ro.vendor.build.date.utc "$BUILD_DATE_UTC"

resetprop -n ro.odm.build.fingerprint "$FINGERPRINT"
resetprop -n ro.odm.build.id "$BUILD_ID"
resetprop -n ro.odm.build.version.incremental "$INCREMENTAL"
resetprop -n ro.odm.build.version.release 16
resetprop -n ro.odm.build.version.release_or_codename 16
resetprop -n ro.odm.build.version.sdk 36
resetprop -n ro.odm.build.date "$BUILD_DATE"
resetprop -n ro.odm.build.date.utc "$BUILD_DATE_UTC"

resetprop -n ro.bootimage.build.fingerprint "$FINGERPRINT"
resetprop -n ro.bootimage.build.date "$BUILD_DATE"
resetprop -n ro.bootimage.build.date.utc "$BUILD_DATE_UTC"

# ---- product partition identity ----
resetprop -n ro.product.vendor.device r0q
resetprop -n ro.product.vendor.model "$POLICY_MODEL"
resetprop -n ro.product.vendor.name r0qxxx
resetprop -n ro.product.odm.device r0q
resetprop -n ro.product.odm.model "$POLICY_MODEL"
resetprop -n ro.product.odm.name r0qxxx
resetprop -n ro.product.product.name r0qxxx

# ---- bootloader-origin props ----
resetprop -n ro.boot.em.model "$POLICY_MODEL"
resetprop -n ro.boot.product.model "$POLICY_MODEL"
resetprop -n ro.boot.bootloader "$INCREMENTAL"

# ---- selinux ----
resetprop -n selinux.policy_version SEPF_SM-S901E_16_0001

# ---- remove UN1CA / custom-ROM signature props (tolerant: may not exist) ----
for p in ro.unica.codename ro.unica.device ro.unica.fingerprint ro.unica.timestamp ro.unica.version persist.sys.unica.bootsound persist.sys.unica.vulkan; do
	resetprop --delete "$p" || true
done

exit 0
