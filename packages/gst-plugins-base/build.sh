TERMUX_PKG_HOMEPAGE=https://gstreamer.freedesktop.org/
TERMUX_PKG_DESCRIPTION="GStreamer base plug-ins"
TERMUX_PKG_LICENSE="LGPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.18.5
TERMUX_PKG_SRCURL=https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=960b7af4585700db0fdd5b843554e11e2564fed9e061f591fae88a7be6446fa3
TERMUX_PKG_DEPENDS="gstreamer, libandroid-shmem, libjpeg-turbo, libopus, libpng, libvorbis, zlib"
TERMUX_PKG_BREAKS="gst-plugins-base-dev"
TERMUX_PKG_REPLACES="gst-plugins-base-dev"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-Dtests=disabled
-Dexamples=disabled
-Dpango=disabled
"

# Conflicts with Mesa.
TERMUX_PKG_RM_AFTER_INSTALL="include/GL"

termux_step_pre_configure() {
	LDFLAGS+=" -landroid-shmem"
}
