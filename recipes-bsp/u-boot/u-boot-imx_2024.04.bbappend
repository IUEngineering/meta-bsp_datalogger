FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
# DEPENDS += "python3-setuptools-native"

# COMPATIBLE_MACHINE:append = "|imx6ull-datalogger"

# UBOOT_CONFIG = "sd"
# UBOOT_CONFIG[sd] = "imx6ull-datalogger_defconfig"

# SRC_URI += " \
#     file://git/configs/imx6ull-datalogger_defconfig \
#     file://git/0001-Add-all-datalogger-changes.patch \
# "

SRC_URI += "file://git/0001-beun_fix.patch"