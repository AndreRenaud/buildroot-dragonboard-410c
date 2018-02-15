################################################################################
#
# speech_tools
#
################################################################################

SPEECH_TOOLS_VERSION = 2.5.0
SPEECH_TOOLS_SOURCE = speech_tools-$(SPEECH_TOOLS_VERSION)-release.tar.gz
SPEECH_TOOLS_SITE = http://festvox.org/packed/festival/2.5
SPEECH_TOOLS_LICENSE_FILES = COPYING
SPEECH_TOOLS_MAKE = $(MAKE1)

SPEECH_TOOLS_MAKE_OPTS = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)"

$(eval $(autotools-package))
