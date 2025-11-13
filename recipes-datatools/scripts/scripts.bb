# Recipe created by recipetool
# This is the basis of a recipe and may need further editing in order to be fully functional.
# (Feel free to remove these comments when editing.)

# Unable to find any files that looked like license statements. Check the accompanying
# documentation and source headers and set LICENSE and LIC_FILES_CHKSUM accordingly.
#
# NOTE: LICENSE is being set to "CLOSED" to allow you to at least start building - if
# this is not accurate with respect to the licensing of the software being built (it
# will not be in most cases) you must specify the correct value before using this
# recipe for anything other than initial testing/development!
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""
inherit systemd

RDEPENDS:${PN} += "bash"

SYSTEMD_AUTO_ENABLE_:${PN} = "enable"
SYSTEMD_PACKAGES = "${PN}"

SRC_URI = "git://git@git.cleanmobility.info/datalogging/scripts.git;protocol=ssh;branch=main"

# Modify these as desired
PV = "1.0+git"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

SYSTEMD_SERVICE:${PN} += "set_mac.service"
SYSTEMD_SERVICE:${PN} += "cmlogger.service"

DELTA_KERNEL_DEFCONFIG:append:= "adding.cfg"

FILES:${PN} += "${ROOT_HOME}"

do_install () {
    # Specify install commands here
    install -d ${D}${bindir}
    install -m 0755 ${S}/*.sh ${D}${bindir}/

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${S}/*.service ${D}${systemd_system_unitdir}

    install -d ${D}${sysconfdir}
    install -m 0644 ${S}/wvdial.conf ${D}${sysconfdir} 

    install -d ${D}${ROOT_HOME}
    install -m 0755 ${S}/cmlogger.config ${D}${ROOT_HOME}
}