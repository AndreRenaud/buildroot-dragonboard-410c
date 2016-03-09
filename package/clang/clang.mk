################################################################################
#
# clang
#
################################################################################

CLANG_VERSION = 4.0.1
CLANG_SITE = http://llvm.org/releases/$(CLANG_VERSION)
CLANG_SOURCE = cfe-$(CLANG_VERSION).src.tar.xz
CLANG_LICENSE = NCSA
CLANG_LICENSE_FILES = LICENSE.TXT

HOST_CLANG_DEPENDENCIES = host-llvm host-libxml2

CLANG_SUPPORTS_IN_SOURCE_BUILD = NO

HOST_CLANG_CONF_OPTS += -DLLVM_INCLUDE_TESTS=OFF \
	-DCLANG_INCLUDE_TESTS=OFF \
	-DCLANG_BUILD_EXAMPLES=OFF \
	-DCLANG_BUILD_TOOLS=ON \
	-DCLANG_VENDOR=$(TARGET_VENDOR) \
	-DCLANG_VENDOR_UTI="http://bugs.buildroot.net/"

# For some reason clang-tblgen is not installed in HOST_DIR.
define HOST_CLANG_COPY_CLANG_TBLGEN_TO_HOST_DIR
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/bin/clang-tblgen \
		$(HOST_DIR)/usr/bin/clang-tblgen
endef
HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_COPY_CLANG_TBLGEN_TO_HOST_DIR

# We need to set a proper RPATH otherwise the build stop on the RPATH check:
# *** ERROR: package host-clang installs executables without proper RPATH
HOST_CLANG_CONF_ENV += \
	LDFLAGS="$(HOST_LDFLAGS) -L${HOST_DIR}/usr/lib -Wl,-rpath,${HOST_DIR}/usr/lib"

$(eval $(host-cmake-package))
