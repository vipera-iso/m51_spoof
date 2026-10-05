#!/system/bin/sh
# M51 -> S22 RIL / baseband identity spoof: late safety net.
# Re-applies after boot in case modem/RIL re-set these props during boot.

resetprop -n gsm.version.baseband "S901EXXSEGZH4,S901EXXSEGZH4"
resetprop -n ril.sw_ver S901EXXSEGZH4
resetprop -n ril.official_cscver S901EOXMEGZH4
resetprop -n ril.product_code SM-S901EZKDXXV
resetprop -n vendor.ril.product_code SM-S901EZKDXXV
resetprop -n mdc.omc.config_version "SAOMC_SM-S901E_OXM_XXV_16_0003"

exit 0
