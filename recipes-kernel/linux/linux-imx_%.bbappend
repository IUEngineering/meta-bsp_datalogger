FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

KBUILD_DEFCONFIG:imx6ull-datalogger = "imx_v7_datalogger_defconfig"

SRC_URI += "file://nxp/imx/imx6ull-datalogger.dts \
            file://nxp/imx/makefile-add-datalogger-dts.patch \
            file://nxp/imx/imx6ull-datalogger.dtsi \
           "


# # Tell the kernel class which defconfig to use to fix do_kernel_metadata error
# SRC_URI[defconfig] = "file://imx_v7_datalogger_defconfig;patchdir=/arch/arm/configs/"

# # Add the modified defconfig to the correct folder.
# do_kernel_metadata::prepend() {
#     install -m 0644 ${WORKDIR}/imx_v7_datalogger_defconfig -t ${S}/arch/arm/configs/
#     cp ${WORKDIR}/imx_v7_datalogger_defconfig ${S}/arch/arm/configs/
# }


# Install custom .dts into the kernel source tree and place patch in correct folder.
do_configure:append() {
    install -m 0644 ${WORKDIR}/nxp/imx/imx6ull-datalogger.dts \
        ${S}/arch/arm/boot/dts/nxp/imx/

    install -m 0644 ${WORKDIR}/nxp/imx/imx6ull-datalogger.dtsi \
        ${S}/arch/arm/boot/dts/nxp/imx/

    install -m 0644 ${WORKDIR}/nxp/imx/makefile-add-datalogger-dts.patch \
        ${S}/arch/arm/boot/dts/nxp/imx/
}

# Important to have the /nxp/imx/ :( which is kinda dumb.
KERNEL_DEVICETREE += "/nxp/imx/imx6ull-datalogger.dtb"

