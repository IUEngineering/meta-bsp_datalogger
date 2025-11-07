SUMMARY = "Auto-resize rootfs on first boot"
DESCRIPTION = "Installs a systemd service to auto-resize the rootfs on first boot."
LICENSE = "CLOSED"

# Put script into sbin, so use that as the filename in FILES_${PN}
FILES_${PN} += "${sbindir}/resizeRootfs.sh"

SRC_URI = "file://resizefs.service \
           file://resizeRootfs.sh \
          "

do_install() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/resizefs.service ${D}${systemd_system_unitdir}

    # Install the script under /usr/sbin and mark executable
    install -d ${D}${sbindir}
    install -m 0755 ${WORKDIR}/resizeRootfs.sh ${D}${sbindir}/
}

SYSTEMD_SERVICE:${PN} = "resizefs.service"
inherit systemd
