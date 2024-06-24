# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Intel® Performance Counter Monitor (Intel® PCM)"
HOMEPAGE="https://github.com/intel/pcm"
SRC_URI="https://github.com/intel/pcm/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

src_configure() {
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
