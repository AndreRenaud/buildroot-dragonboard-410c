################################################################################
#
# shapelib
#
################################################################################

SHAPELIB_VERSION = 1.4.1
SHAPELIB_SITE = http://download.osgeo.org/shapelib
SHAPELIB_LICENSE = MIT or LGPL-2.0
SHAPELIB_LICENSE_FILES = web/license.html COPYING
SHAPELIB_INSTALL_STAGING = YES
SHAPELIB_DEPENDENCIES = proj

$(eval $(autotools-package))
