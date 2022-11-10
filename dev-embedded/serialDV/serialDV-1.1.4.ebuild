# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="C++ Minimal interface to encode and decode audio with AMBE3000\
based devices in packet mode over a serial link"
HOMEPAGE="https://github.com/f4exb/serialDV"
SRC_URI="https://github.com/f4exb/serialDV/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

src_configure() {
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
