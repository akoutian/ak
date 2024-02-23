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
	dev-embedded/serialDV
	dev-qt/qt5compat
	dev-qt/qtcharts
	dev-qt/qtlocation
	dev-qt/qtmultimedia
	dev-qt/qtpositioning
	dev-qt/qtserialport
	dev-qt/qtspeech
	dev-qt/qtwebengine
	dev-qt/qtwebsockets
	sci-libs/cm256cc
	sci-libs/fftw
"
RDEPEND="${DEPEND}"

IUSE="
	+server +dev-airspy +dev-airspyhf +dev-bladerf +mimo-beamsteeringcwmod
	+mimo-doa2 +mimo-interferometer +rx-chanalyzer +rx-demodadsb +rx-demodais
	+rx-demodam +rx-demodapt +rx-demodatv +rx-demodbfm
	+rx-demodchirpchat +rx-demoddab +rx-demoddatv +rx-demoddsc +rx-demoddsd
	+rx-demodfreedv +rx-demodft8 +rx-demodils +rx-demodm17 +rx-demodnavtex
	+rx-demodnfm +rx-demodpacket +rx-demodpager +rx-demodradiosonde
	+rx-demodrtty +rx-demodssb +rx-demodvor +rx-demodwfm +rx-filesink
	+rx-freqtracker +rx-localsink +rx-noisefigure +rx-radioastronomy
	+rx-radioclock +rx-remotesink +rx-remotetcpsink +rx-sigmffilesink
	+rx-udpsink +tx-filesource +tx-localsource +tx-mod802_15_4 +tx-modais
	+tx-modam +tx-modatv +tx-modchirpchat +tx-moddatv +tx-modfreedv +tx-modm17
	+tx-modnfm +tx-modpacket +tx-modssb +tx-modwfm +tx-remotesource
	+tx-udpsource +feature-afc +feature-ais +feature-ambe +feature-antennatools
	+feature-aprs +feature-demodanalyzer +feature-gs232controller
	+feature-jogdialcontroller +feature-limerfe +feature-map +feature-pertester
	+feature-radiosonde +feature-remotecontrol +feature-rigctlserver
	+feature-satellitetracker +feature-simpleptt +feature-startracker
	+feature-vorlocalizer +dev-funcube +dev-hackrf +dev-limesuite +dev-mirisdr
	+dev-perseus +dev-rtlsdr +dev-sdrplay +dev-soapysdr +dev-usrp +dev-xtrx
	+qt6
"

src_configure() {
	local mycmakeargs=(
		-DENABLE_QT6=$(usex qt6 ON OFF)
		-DBUILD_SERVER=$(usex server ON OFF)
		-DENABLE_AIRSPY=$(usex dev-airspy ON OFF)
		-DENABLE_AIRSPYHF=$(usex dev-airspyhf ON OFF)
		-DENABLE_BLADERF=$(usex dev-bladerf ON OFF)
		-DENABLE_CHANNELMIMO=$(usex mimo-beamsteeringcwmod ON OFF)
		-DENABLE_CHANNELMIMO=$(usex mimo-doa2 ON OFF)
		-DENABLE_CHANNELMIMO=$(usex mimo-interferometer ON OFF)
		-DENABLE_CHANNELRX_CHANALYZER=$(usex rx-chanalyzer ON OFF)
		-DENABLE_CHANNELRX_DEMODADSB=$(usex rx-demodadsb ON OFF)
		-DENABLE_CHANNELRX_DEMODAIS=$(usex rx-demodais ON OFF)
		-DENABLE_CHANNELRX_DEMODAM=$(usex rx-demodam ON OFF)
		-DENABLE_CHANNELRX_DEMODAPT=$(usex rx-demodapt ON OFF)
		-DENABLE_CHANNELRX_DEMODATV=$(usex rx-demodatv ON OFF)
		-DENABLE_CHANNELRX_DEMODBFM=$(usex rx-demodbfm ON OFF)
		-DENABLE_CHANNELRX_DEMODCHIRPCHAT=$(usex rx-demodchirpchat ON OFF)
		-DENABLE_CHANNELRX_DEMODDAB=$(usex rx-demoddab ON OFF)
		-DENABLE_CHANNELRX_DEMODDATV=$(usex rx-demoddatv ON OFF)
		-DENABLE_CHANNELRX_DEMODDSC=$(usex rx-demoddsc ON OFF)
		-DENABLE_CHANNELRX_DEMODDSD=$(usex rx-demoddsd ON OFF)
		-DENABLE_CHANNELRX_DEMODFREEDV=$(usex rx-demodfreedv ON OFF)
		-DENABLE_CHANNELRX_DEMODFT8=$(usex rx-demodft8 ON OFF)
		-DENABLE_CHANNELRX_DEMODILS=$(usex rx-demodils ON OFF)
		-DENABLE_CHANNELRX_DEMODM17=$(usex rx-demodm17 ON OFF)
		-DENABLE_CHANNELRX_DEMODNAVTEX=$(usex rx-demodnavtex ON OFF)
		-DENABLE_CHANNELRX_DEMODNFM=$(usex rx-demodnfm ON OFF)
		-DENABLE_CHANNELRX_DEMODPACKET=$(usex rx-demodpacket ON OFF)
		-DENABLE_CHANNELRX_DEMODPAGER=$(usex rx-demodpager ON OFF)
		-DENABLE_CHANNELRX_DEMODRADIOSONDE=$(usex rx-demodradiosonde ON OFF)
		-DENABLE_CHANNELRX_DEMODRTTY=$(usex rx-demodrtty ON OFF)
		-DENABLE_CHANNELRX_DEMODSSB=$(usex rx-demodssb ON OFF)
		-DENABLE_CHANNELRX_DEMODVOR=$(usex rx-demodvor ON OFF)
		-DENABLE_CHANNELRX_DEMODWFM=$(usex rx-demodwfm ON OFF)
		-DENABLE_CHANNELRX_FILESINK=$(usex rx-filesink ON OFF)
		-DENABLE_CHANNELRX_FREQTRACKER=$(usex rx-freqtracker ON OFF)
		-DENABLE_CHANNELRX_LOCALSINK=$(usex rx-localsink ON OFF)
		-DENABLE_CHANNELRX_NOISEFIGURE=$(usex rx-noisefigure ON OFF)
		-DENABLE_CHANNELRX_RADIOASTRONOMY=$(usex rx-radioastronomy ON OFF)
		-DENABLE_CHANNELRX_RADIOCLOCK=$(usex rx-radioclock ON OFF)
		-DENABLE_CHANNELRX_REMOTESINK=$(usex rx-remotesink ON OFF)
		-DENABLE_CHANNELRX_REMOTETCPSINK=$(usex rx-remotetcpsink ON OFF)
		-DENABLE_CHANNELRX_SIGMFFILESINK=$(usex rx-sigmffilesink ON OFF)
		-DENABLE_CHANNELRX_UDPSINK=$(usex rx-udpsink ON OFF)
		-DENABLE_CHANNELTX_FILESOURCE=$(usex tx-filesource ON OFF)
		-DENABLE_CHANNELTX_LOCALSOURCE=$(usex tx-localsource ON OFF)
		-DENABLE_CHANNELTX_MOD802.15.4=$(usex tx-mod802_15_4 ON OFF)
		-DENABLE_CHANNELTX_MODAIS=$(usex tx-modais ON OFF)
		-DENABLE_CHANNELTX_MODAM=$(usex tx-modam ON OFF)
		-DENABLE_CHANNELTX_MODATV=$(usex tx-modatv ON OFF)
		-DENABLE_CHANNELTX_MODCHIRPCHAT=$(usex tx-modchirpchat ON OFF)
		-DENABLE_CHANNELTX_MODDATV=$(usex tx-moddatv ON OFF)
		-DENABLE_CHANNELTX_MODFREEDV=$(usex tx-modfreedv ON OFF)
		-DENABLE_CHANNELTX_MODM17=$(usex tx-modm17 ON OFF)
		-DENABLE_CHANNELTX_MODNFM=$(usex tx-modnfm ON OFF)
		-DENABLE_CHANNELTX_MODPACKET=$(usex tx-modpacket ON OFF)
		-DENABLE_CHANNELTX_MODSSB=$(usex tx-modssb ON OFF)
		-DENABLE_CHANNELTX_MODWFM=$(usex tx-modwfm ON OFF)
		-DENABLE_CHANNELTX_REMOTESOURCE=$(usex tx-remotesource ON OFF)
		-DENABLE_CHANNELTX_UDPSOURCE=$(usex tx-udpsource ON OFF)
		-DENABLE_FEATURE_AFC=$(usex feature-afc ON OFF)
		-DENABLE_FEATURE_AIS=$(usex feature-ais ON OFF)
		-DENABLE_FEATURE_AMBE=$(usex feature-ambe ON OFF)
		-DENABLE_FEATURE_ANTENNATOOLS=$(usex feature-antennatools ON OFF)
		-DENABLE_FEATURE_APRS=$(usex feature-aprs ON OFF)
		-DENABLE_FEATURE_DEMODANALYZER=$(usex feature-demodanalyzer ON OFF)
		-DENABLE_FEATURE_GS232CONTROLLER=$(usex feature-gs232controller ON OFF)
		-DENABLE_FEATURE_JOGDIALCONTROLLER=$(usex feature-jogdialcontroller ON OFF)
		-DENABLE_FEATURE_LIMERFE=$(usex feature-limerfe ON OFF)
		-DENABLE_FEATURE_MAP=$(usex feature-map ON OFF)
		-DENABLE_FEATURE_PERTESTER=$(usex feature-pertester ON OFF)
		-DENABLE_FEATURE_RADIOSONDE=$(usex feature-radiosonde ON OFF)
		-DENABLE_FEATURE_REMOTECONTROL=$(usex feature-remotecontrol ON OFF)
		-DENABLE_FEATURE_RIGCTLSERVER=$(usex feature-rigctlserver ON OFF)
		-DENABLE_FEATURE_SATELLITETRACKER=$(usex feature-satellitetracker ON OFF)
		-DENABLE_FEATURE_SIMPLEPTT=$(usex feature-simpleptt ON OFF)
		-DENABLE_FEATURE_STARTRACKER=$(usex feature-startracker ON OFF)
		-DENABLE_FEATURE_VORLOCALIZER=$(usex feature-vorlocalizer ON OFF)
		-DENABLE_FUNCUBE=$(usex dev-funcube ON OFF)
		-DENABLE_HACKRF=$(usex dev-hackrf ON OFF)
		-DENABLE_LIMESUITE=$(usex dev-limesuite ON OFF)
		-DENABLE_MIRISDR=$(usex dev-mirisdr ON OFF)
		-DENABLE_PERSEUS=$(usex dev-perseus ON OFF)
		-DENABLE_RTLSDR=$(usex dev-rtlsdr ON OFF)
		-DENABLE_SDRPLAY=$(usex dev-sdrplay ON OFF)
		-DENABLE_SOAPYSDR=$(usex dev-soapysdr ON OFF)
		-DENABLE_USRP=$(usex dev-usrp ON OFF)
		-DENABLE_XTRX=$(usex dev-xtrx ON OFF)
		-DENABLE_QT6=$(usex qt6 ON OFF)
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
}
