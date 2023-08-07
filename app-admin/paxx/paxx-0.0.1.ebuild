# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION='Console-based C++ password manager, inspired by "pass"'
HOMEPAGE="https://github.com/akoutian/paxx"
SRC_URI="https://github.com/akoutian/paxx/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-crypt/gpgme
	x11-libs/libXvMC
"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/conan"

CMAKE_USE_DIR="${WORKDIR}/${P}/src"
BUILD_DIR="${WORKDIR}/${P}/build"

src_configure() {
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
