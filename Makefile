PORTNAME=		lutris
DISTVERSION=		g20220331
CATEGORIES=		games
PKGNAMEPREFIX=		${PY_FLAVOR}-
PKGNAMESUFFIX=		-freebsd
DISTNAME=		${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=		${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=		nope@nothere
COMMENT=		Free and open source game manager for Linux-based operating systems

LICENSE=		GPLv3

BROKEN=			builds but it seems there may be something wrong with tls for account access widget.

BUILD_DEPENDS=		${PYTHON_PKGNAMEPREFIX}dbus>=0:devel/py-dbus@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}evdev>0:devel/py-evdev@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}gobject3>0:devel/py-gobject3@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}lxml>0:devel/py-lxml@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}python-magic>0:devel/py-python-magic@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}nose-cov>0:devel/py-nose-cov@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}notify2>0:devel/py-notify2@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}pillow>=0:graphics/py-pillow@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}setproctitle>0:devel/py-setproctitle@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}yaml>=4:devel/py-yaml@${PY_FLAVOR} \
			glxinfo:graphics/mesa-demos \
			Xvfb:x11-servers/xorg-vfbserver \
			${LOCALBASE}/include/GL/internal/dri_interface.h:graphics/mesa-dri \
			${LOCALBASE}/libdata/pkgconfig/dri.pc:graphics/mesa-dri
RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}dbus>=0:devel/py-dbus@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}evdev>0:devel/py-evdev@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}gobject3>0:devel/py-gobject3@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}lxml>0:devel/py-lxml@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}python-magic>0:devel/py-python-magic@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}nose-cov>0:devel/py-nose-cov@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}notify2>0:devel/py-notify2@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}pillow>=0:graphics/py-pillow@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}setproctitle>0:devel/py-setproctitle@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}yaml>=4:devel/py-yaml@${PY_FLAVOR} \
			glxinfo:graphics/mesa-demos \
			Xvfb:x11-servers/xorg-vfbserver \
			${LOCALBASE}/include/GL/internal/dri_interface.h:graphics/mesa-dri \
			${LOCALBASE}/libdata/pkgconfig/dri.pc:graphics/mesa-dri \
			appstream-builder:devel/appstream-glib \
			cabextract:archivers/cabextract \
			${LOCALBASE}/share/sounds/sf2/FluidR3_GM.sf2:audio/fluid-soundfont \
			7z:archivers/p7zip \
			${LOCALBASE}/bin/unzip:archivers/unzip \
			zip:archivers/zip \
			xdg-open:devel/xdg-utils \
			pylint:devel/pylint \
			pstree:sysutils/psmisc \
			curl:ftp/curl
LIB_DEPENDS=		libwebkit2gtk-4.0.so:www/webkit2-gtk3 \
			libdbus-1.so:devel/dbus \
			libcurl.so:ftp/curl

USES=			gl gnome localbase:ldflags pkgconfig python:-3.10 desktop-file-utils \
			shebangfix xorg

USE_GNOME=		cairo glib20 gtk30 gnomeprefix gnomedesktop3 gdkpixbuf2 intlhack \
			introspection libxml2 libxslt
#			introspection libxml2 libxslt pygobject3
INSTALLS_ICONS=		yes

USE_PYTHON=		distutils

USE_XORG=		dmx pciaccess x11 ice xau xdmcp xrandr
USE_GL=			gl

USE_GITHUB=		nodefault

SHEBANG_FILES=		share/lutris/bin/lutris-wrapper

GH_ACCOUNT=		lutris
GH_PROJECT=		lutris
GH_TAGNAME=		d474f704c94709b65f4956089bbb5e796f8fb445

WRKSRC=			${WRKDIR}/lutris-${GH_TAGNAME}


OPTIONS_DEFINE=		NLS GNUTLS GVFS WINE VULKAN VULKAN3D
OPTIONS_DEFAULT=

NLS_USES=		gettext

GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls

GVFS_USE=		GNOME=gvfs

WINE_DESC=		Windows support
WINE_RUN_DEPENDS=	wine:emulators/wine

VULKAN_DESCR=		Vulkan support
VULKAN_BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers
VULKAN_LIB_DEPENDS=	libvulkan.so:graphics/vulkan-loader
VULKAN_RUN_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers

VULKAN3D_DESCR=		Vulkan3D support (implies Vulkan)
VULKAN3D_BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers
VULKAN3D_LIB_DEPENDS=	libvulkan.so:graphics/vulkan-loader \
			libvkd3d.so:graphics/vkd3d
VULKAN3D_RUN_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers

.include <bsd.port.options.mk>

.include <bsd.port.mk>
#
# Note that pkg-plist as generated looks good, a few lines incorporate lutris version in the path. 
