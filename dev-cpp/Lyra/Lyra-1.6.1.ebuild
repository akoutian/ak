# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A simple to use, composable, command line parser for C++ 11 and beyond"
HOMEPAGE="https://bfgroup.github.io/Lyra/"
SRC_URI="https://github.com/bfgroup/Lyra/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Boost-1.0"
SLOT="0"
KEYWORDS="~amd64"

src_configure() {
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
