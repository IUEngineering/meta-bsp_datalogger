
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
KBUILD_DEFCONFIG:imx6ull-datalogger = "imx_v7_datalogger_defconfig"
KERNEL_DEVICETREE += "nxp/imx/imx6ull-datalogger.dtb"

SRC_URI += "file://nxp/imx/imx6ull-datalogger.dts \
            file://nxp/imx/makefile-add-datalogger-dts.patch \
            file://nxp/imx/imx6ull-datalogger.dtsi \
           "

SRC_URI += "file://imx_v7_datalogger_defconfig"

C_DTS = "nxp/imx/imx6ull-datalogger.dts"
C_DTSI = "nxp/imx/imx6ull-datalogger.dtsi"

# Install custom .dts into the kernel source tree and place patch in correct folder.
do_configure:append() {
    cp ${WORKDIR}/${C_DTS} ${S}/arch/arm/boot/dts/nxp/imx
    cp ${WORKDIR}/${C_DTSI} ${S}/arch/arm/boot/dts/nxp/imx

    install -m 0644 ${WORKDIR}/nxp/imx/imx6ull-datalogger.dts \
        ${S}/arch/arm/boot/dts/nxp/imx/

    install -m 0644 ${WORKDIR}/nxp/imx/imx6ull-datalogger.dtsi \
        ${S}/arch/arm/boot/dts/nxp/imx/

    install -m 0644 ${WORKDIR}/nxp/imx/makefile-add-datalogger-dts.patch \
        ${S}/arch/arm/boot/dts/nxp/imx/

    install -m 0644 ${WORKDIR}/imx_v7_datalogger_defconfig ${S}/arch/arm/configs/
}

DTB_TO_DEPLOY = "imx6ull-datalogger.dtb"

do_deploy:append() {
    for dtb in ${DTB_TO_DEPLOY}; do
        # Defensive check – warn if the source file is missing
        if [ ! -f ${DEPLOYDIR}/${dtb} ]; then
            bberror "Expected ${dtb} in ${DEPLOYDIR} but it is not there."
            continue
        fi

        # Copy (or rename) to the destination you prefer.
        # Here we keep the original name, but you could rename:
        #   cp ${DEPLOYDIR}/${dtb} ${DEPLOYDIR}/dtbs/custom-${dtb}
        cp ${B}/arch/arm/boot/dts/nxp/imx/imx6ull-datalogger.dtb ${DEPLOYDIR}/imx6ull-datalogger.dtb
    done
}