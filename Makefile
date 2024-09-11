PORTNAME=		lutris
DISTVERSION=	g20240904
CATEGORIES=		games
PKGNAMEPREFIX=	${PY_FLAVOR}-
PKGNAMESUFFIX=	-freebsd
DISTNAME=		${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=		nope@nothere
COMMENT=		Free and open source game manager for Linux-based operating systems
WWW=			https://lutris.net/

LICENSE=		GPLv3

PY_FLAVOR=		py311

BUILD_DEPENDS= \
				${PY_FLAVOR}-wheel>0:devel/py-wheel@${PY_FLAVOR} \
				${PY_FLAVOR}-setuptools>0:devel/py-setuptools@${PY_FLAVOR} \
				fdupes>0:sysutils/fdupes \
				appstream-glib>0:devel/appstream-glib
RUN_DEPENDS= \
				${PY_FLAVOR}-pyyaml>0:devel/py-pyyaml@${PY_FLAVOR} \
				${PY_FLAVOR}-requests>0:www/py-requests@${PY_FLAVOR} \
				${PY_FLAVOR}-dbus>0:devel/py-dbus@${PY_FLAVOR} \
				${PY_FLAVOR}-evdev>0:devel/py-evdev@${PY_FLAVOR} \
				${PY_FLAVOR}-distro>0:sysutils/py-distro@${PY_FLAVOR} \
				${PY_FLAVOR}-pillow>0:graphics/py-pillow@${PY_FLAVOR} \
				cabextract>0:archivers/cabextract \
				psmisc>0:sysutils/psmisc

USES=			display:Xvfb linux gl gnome localbase:ldflags pkgconfig python:3.11 desktop-file-utils \
				shebangfix xorg

USE_GNOME=		cairo glib20 gtk30 gnomeprefix gnomedesktop3 gdkpixbuf2 intlhack \
				introspection libxml2 libxslt pygobject3

USE_PYTHON=		distutils concurrent

USE_XORG=		pciaccess x11 ice xau xdmcp xrandr
USE_GL=			gl

USE_GITHUB=		nodefault

NO_ARCH=		yes

SHEBANG_FILES=	share/lutris/bin/lutris-wrapper

GH_ACCOUNT=		lutris
GH_PROJECT=		lutris
GH_TAGNAME=		3ec23ac521871e2ba648d64a7734cfc78eb8b9bc

WRKSRC=			${WRKDIR}/lutris-${GH_TAGNAME}

OPTIONS_DEFINE=	NLS GNUTLS WINE VULKAN GVFS #VULKAN3D GVFS
OPTIONS_DEFAULT=NLS GNUTLS WINE VULKAN GVFS #VULKAN3D GVFS

NLS_USES=		gettext

#GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls

GVFS_DESCR=		gnome virtual filesystem support --broken--
GVFS_USE=		GNOME=gvfs

WINE_DESC=		Windows support
WINE_RUN_DEPENDS=	wine>0:emulators/wine

VULKAN_DESCR=		Vulkan support
VULKAN_BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers \
						vulkan-loader>0:graphics/vulkan-loader \
						vulkan-extension-layer>0:graphics/vulkan-extension-layer
#VULKAN_LIB_DEPENDS=	libvulkan.so:graphics/vulkan-loader \
#					libVkLayer_khronos_synchronization2.so:graphics/vulkan-extension-layer \
#					libVkLayer_khronos_timeline_semaphore.so:graphics/vulkan-extension-layer
VULKAN_RUN_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers \
					${LOCALBASE}/lib/libvulkan.so:graphics/vulkan-loader \
					vulkan-extension-layer>0:graphics/vulkan-extension-layer \
					${LOCALBASE}/lib/libvulkan.so:graphics/vulkan-loader

#VULKAN3D_DESCR=			Vulkan3D support (implies Vulkan)
#VULKAN3D_BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers
#VULKAN3D_LIB_DEPENDS=	libvulkan.so:graphics/vulkan-loader \
#						libvkd3d.so:graphics/vkd3d
#VULKAN3D_RUN_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers

post-patch:
	@${REINPLACE_CMD} -e 's|/proc|/compat/linux/proc|g' ${WRKSRC}/lutris/util/graphics/drivers.py
	@${REINPLACE_CMD} -e 's|/proc|/compat/linux/proc|g' ${WRKSRC}/lutris/util/linux.py
	@${REINPLACE_CMD} -e 's|/proc|/compat/linux/proc|g' ${WRKSRC}/lutris/util/process.py

.include <bsd.port.options.mk>

#
# might find dependencies in:
# lutris-freebsd/work-py311/lutris-3ec23ac521871e2ba648d64a7734cfc78eb8b9bc/lutris.spec
#

.include <bsd.port.mk>
