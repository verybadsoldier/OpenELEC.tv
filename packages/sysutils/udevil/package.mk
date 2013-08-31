################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2012 Stephan Raue (stephan@openelec.tv)
#
#  This Program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  This Program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.tv; see the file COPYING.  If not, write to
#  the Free Software Foundation, 51 Franklin Street, Suite 500, Boston, MA 02110, USA.
#  http://www.gnu.org/copyleft/gpl.html
################################################################################

PKG_NAME="udevil"
PKG_VERSION="77e0ba0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/IgnorantGuru/udevil"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS="systemd glib"
PKG_BUILD_DEPENDS_TARGET="toolchain systemd glib"
PKG_PRIORITY="optional"
PKG_SECTION="system"
PKG_SHORTDESC="udevil: Mounts and unmounts removable devices and networks without a password."
PKG_LONGDESC="udevil Mounts and unmounts removable devices and networks without a password (set suid), shows device info, monitors device changes. Emulates mount's and udisks's command line usage and udisks v1's output. Includes the devmon automounting daemon."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-systemd \
                           --with-mount-prog=/bin/mount \
                           --with-umount-prog=/bin/umount \
                           --with-losetup-prog=/sbin/losetup \
                           --with-setfacl-prog=/usr/bin/setfacl"

makeinstall_target() {
 : # nothing to install
}

post_makeinstall_target() {
  mkdir -p $INSTALL/etc/udevil
    cp $PKG_DIR/config/udevil.conf $INSTALL/etc/udevil

  mkdir -p $INSTALL/usr/bin
    cp -PR src/udevil $INSTALL/usr/bin
}
