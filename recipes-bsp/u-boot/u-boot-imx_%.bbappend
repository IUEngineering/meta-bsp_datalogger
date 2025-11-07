UBOOT_CONFIG = "imx6ull-datalogger"
UBOOT_CONFIG[datalogger] = "datalogger_defconfig"

SRC_URI += "file://datalogger_defconfig"
SRC_URI += "file://0001-datalogger-add-support-for-cleanmobility-datalogger.patch"
