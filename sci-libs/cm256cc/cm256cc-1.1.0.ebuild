# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Fast GF(256) Cauchy MDS Block Erasure Codec in C++"
HOMEPAGE="https://github.com/f4exb/cm256cc"
SRC_URI="https://github.com/f4exb/cm256cc/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

PATCHES=(
	"${FILESDIR}"/00-include-cstdint.patch
)

src_configure() {
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
