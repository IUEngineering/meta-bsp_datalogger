DESCRIPTION = "Customize fstab"

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
SRC_URI += "file://fstab"


do_install:append() {
    install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}
}