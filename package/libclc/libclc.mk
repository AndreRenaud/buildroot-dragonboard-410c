################################################################################
#
# libclc
#
################################################################################

LIBCLC_VERSION = 1cb3fbf504e25d86d972e8b2af3e24571767046b
LIBCLC_SITE = http://llvm.org/git/libclc.git
LIBCLC_SITE_METHOD = git

LIBCLC_DEPENDENCIES = host-clang host-llvm

LIBCLC_INSTALL_STAGING = YES

# C++ compiler is used to build a small tool (prepare-builtins) for the host.
# It must be build with the C++ compiler from the host, simply use
# HOSTCXX_NOCCACHE.
LIBCLC_CONF_OPTS = --with-llvm-config=$(HOST_DIR)/usr/bin/llvm-config \
	--prefix="/usr" \
	--pkgconfigdir="/usr/lib/pkgconfig" \
	--llvm-bindir=$(HOST_DIR)/usr/bin \
	--with-cxx-compiler='$(HOSTCXX_NOCCACHE)'

define LIBCLC_CONFIGURE_CMDS
	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure.py $(LIBCLC_CONF_OPTS))
endef

define LIBCLC_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define LIBCLC_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install
endef

define LIBCLC_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) install
endef

$(eval $(generic-package))
