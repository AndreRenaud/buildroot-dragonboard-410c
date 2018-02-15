################################################################################
#
# festival
#
################################################################################

FESTIVAL_VERSION = 2.5.0
FESTIVAL_SOURCE = festival-$(FESTIVAL_VERSION)-release.tar.gz
FESTIVAL_SITE = http://festvox.org/packed/festival/2.5
FESTIVAL_LICENSE_FILES = COPYING

FESTIVAL_DEPENDENCIES = speech_tools

FESTIVAL_MAKE = $(MAKE1)
FESTIVAL_MAKE_ENV = EST=$(BASE_DIR)/build/speech_tools-2.5.0/
FESTIVAL_MAKE_OPTS = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)"

define FESTIVAL_INSTALL_TARGET_CMDS
        $(INSTALL) -m 0755 -D $(@D)/src/main/festival \
                $(TARGET_DIR)/usr/bin/festival
endef

$(eval $(autotools-package))
