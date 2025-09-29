FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://nxp/imx/imx6ull-datalogger.dts \
            file://nxp/imx/makefile-add-datalogger-dts.patch \
            file://nxp/imx/imx6ull-datalogger.dtsi \
           "

# Install custom .dts into the kernel source tree and place patch in correct folder.
do_configure:append() {
    install -m 0644 ${WORKDIR}/nxp/imx/imx6ull-datalogger.dts \
        ${S}/arch/arm/boot/dts/nxp/imx/

    install -m 0644 ${WORKDIR}/nxp/imx/imx6ull-datalogger.dtsi \
        ${S}/arch/arm/boot/dts/nxp/imx/

    install -m 0644 ${WORKDIR}/nxp/imx/makefile-add-datalogger-dts.patch \
        ${S}/arch/arm/boot/dts/nxp/imx/
}

KERNEL_DEVICETREE += "nxp/imx/imx6ull-datalogger.dtb"

