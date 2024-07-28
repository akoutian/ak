# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Monitor frequency limiting reasons for Intel Sandy Bridge and Ivy Bridge CPUs."
HOMEPAGE="https://github.com/akoutian/snb-ivb-throttle-reason"
SRC_URI="https://github.com/akoutian/snb-ivb-throttle-reason/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-libs/ncurses sys-apps/iotools"

src_install() {
		dodir /usr/bin
    cp "${S}/${PN}" "${D}/usr/bin"
}
