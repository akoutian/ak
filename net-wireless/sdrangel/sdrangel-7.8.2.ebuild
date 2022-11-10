# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="SDR Rx/Tx software for Airspy, Airspy HF+, BladeRF, HackRF,\
LimeSDR, PlutoSDR, RTL-SDR, SDRplay RSP1 and FunCube"
HOMEPAGE="https://www.sdrangel.org/"
SRC_URI="https://github.com/f4exb/sdrangel/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtwebsockets
	dev-qt/qtpositioning
	dev-qt/qtcharts
	dev-qt/qtserialport
	dev-qt/qtlocation
	dev-qt/qtspeech
	dev-qt/qtwebengine
	sci-libs/fftw
	dev-embedded/serialDV
	sci-libs/cm256cc
"
RDEPEND="${DEPEND}"

src_configure() {
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
