# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils qmake-utils git-2

DESCRIPTION="Micro Air Vehicle Ground Control Station"
HOMEPAGE="http://qgroundcontrol.org"
EGIT_REPO_URI="https://github.com/mavlink/qgroundcontrol.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="app-accessibility/espeak
	app-accessibility/flite
	dev-libs/protobuf
        media-plugins/gst-plugins-meta 
	media-libs/libsdl
	dev-qt/qtlocation
	dev-qt/qtopengl
	dev-qt/qtsql
	dev-qt/qtsvg
	dev-qt/qtserialport
	dev-qt/qtwebkit
	dev-qt/qtmultimedia
"
RDEPEND="${DEPEND}"

src_prepare() {
git submodule init && git submodule update
mkdir build;
cd build;
eqmake5 ../qgroundcontrol.pro;
emake;
}

src_install() {
	cd build/release
	dobin QGroundControl
}
