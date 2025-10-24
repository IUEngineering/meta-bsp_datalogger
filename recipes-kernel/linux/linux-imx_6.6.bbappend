inherit kernel-devicetree
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://git/0001-Datalogger-changes.patch \  
            file://git/arch/arm/boot/configs/imx_v7_datalogger_defconfig \
            file://git/arch/arm/boot/dts/nxp/imx/imx6ull-datalogger.dts \
            file://git/arch/arm/boot/dts/nxp/imx/imx6ull-datalogger.dtsi \
           "

KERNEL_IMAGETYPE = "zImage"
IMX_KERNEL_CONFIG_AARCH32 = "imx_v7_datalogger_defconfig"

KERNEL_DEVICETREE += "nxp/imx/imx6ull-datalogger.dtb"

DTB_TO_DEPLOY = "imx6ull-datalogger.dtb"

do_deploy:append() {
    for dtb in ${DTB_TO_DEPLOY}; do
        # Defensive check – warn if the source file is missing
        if [ ! -f ${DEPLOYDIR}/${dtb} ]; then
            bberror "Expected ${dtb} in ${DEPLOYDIR} but it is not there."
            continue
        fi

        cp ${B}/arch/arm/boot/dts/nxp/imx/imx6ull-datalogger.dtb ${DEPLOYDIR}/imx6ull-datalogger.dtb
    done
}