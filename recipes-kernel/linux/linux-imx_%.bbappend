FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://imx6ull-datalogger.dts"

do_configure:append() {
    # Copy your DTS into the kernel source tree
    cp ${WORKDIR}/imx6ull-datalogger.dts ${S}/arch/arm/boot/dts/
}