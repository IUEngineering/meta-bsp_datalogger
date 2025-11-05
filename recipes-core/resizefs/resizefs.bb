SUMMARY = "Auto-resize rootfs on first boot"
DESCRIPTION = "Installs a systemd service to auto-resize the rootfs on first boot."
LICENSE = "CLOSED"

SRC_URI = "file://resizefs.service"

do_install() {
    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/resizefs.service ${D}${systemd_system_unitdir}
}

SYSTEMD_SERVICE:${PN} = "resizefs.service"
inherit systemd
