inherit kernel-devicetree
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://git/0001-Datalogger-changes.patch \  
            file://git/arch/arm/boot/configs/imx_v7_datalogger_defconfig \
            file://git/arch/arm/configs/imx_v7_datalogger_defconfig \
            file://git/files/imx_v7_datalogger_defconfig \
           "

S = "${WORKDIR}/git"
            
KERNEL_IMAGETYPE = "zImage"
IMX_KERNEL_CONFIG_AARCH32 = "imx_v7_datalogger_defconfig"

DTB_TO_DEPLOY = "imx6ull-datalogger.dtb"

KERNEL_DEVICETREE += "nxp/imx/imx6ull-datalogger.dtb"

SRC_URI += "file://git/arch/arm/boot/dts/nxp/imx/imx6ull-datalogger.dts \
            file://git/arch/arm/boot/dts/nxp/imx/imx6ull-datalogger.dtsi \
           "

C_DTS = "nxp/imx/imx6ull-datalogger.dts"
C_DTSI = "nxp/imx/imx6ull-datalogger.dtsi"

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