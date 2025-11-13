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
TARGET_CC_ARCH += "${LDFLAGS}"

SRC_URI = "git://git@git.cleanmobility.info/datalogging/cmlogger.git;protocol=ssh;branch=master"

# Modify these as desired
PV = "1.0+git"
SRCREV = "${AUTOREV}"

S = "${WORKDIR}/git"

do_compile () {
	# You will almost certainly need to add additional arguments here
	oe_runmake CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

do_install () {
	install -d ${D}${bindir}
    install -m 0755 ${S}/cmlogger ${D}${bindir}/cmlogger
}
