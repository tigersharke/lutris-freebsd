PORTNAME=		lutris
DISTVERSION=		g20230216
CATEGORIES=		games
PKGNAMEPREFIX=		${PY_FLAVOR}-
PKGNAMESUFFIX=		-freebsd
DISTNAME=		${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=		${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=		nope@nothere
COMMENT=		Free and open source game manager for Linux-based operating systems
WWW=			https://lutris.net/

LICENSE=		GPLv3

BROKEN=			builds but uncertain how much it works, TRYBROKEN=true to test.
PY_FLAVOR=		py39
BUILD_DEPENDS=		${PYTHON_PKGNAMEPREFIX}yaml>=4:devel/py-yaml@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}lxml>0:devel/py-lxml@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}pillow>=0:graphics/py-pillow@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}gobject3>0:devel/py-gobject3@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}setproctitle>0:devel/py-setproctitle@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}python-magic>0:devel/py-python-magic@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}dbus>=0:devel/py-dbus@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}notify2>0:devel/py-notify2@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}evdev>0:devel/py-evdev@${PY_FLAVOR} \
			${LOCALBASE}/include/GL/internal/dri_interface.h:graphics/mesa-dri \
			${LOCALBASE}/libdata/pkgconfig/dri.pc:graphics/mesa-dri \
			glxinfo:graphics/mesa-demos \
			${PYTHON_PKGNAMEPREFIX}nose-cov>0:devel/py-nose-cov@${PY_FLAVOR} \
			Xvfb:x11-servers/xorg-server
#			pylint:devel/pylint@{PY_FLAVOR}
RUN_DEPENDS=		${PYTHON_PKGNAMEPREFIX}yaml>=4:devel/py-yaml@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}lxml>0:devel/py-lxml@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}requests>0:www/py-requests@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}pillow>=0:graphics/py-pillow@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}gobject3>0:devel/py-gobject3@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}setproctitle>0:devel/py-setproctitle@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}python-magic>0:devel/py-python-magic@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}dbus>=0:devel/py-dbus@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}notify2>0:devel/py-notify2@${PY_FLAVOR} \
			${LOCALBASE}/include/GL/internal/dri_interface.h:graphics/mesa-dri \
			${LOCALBASE}/libdata/pkgconfig/dri.pc:graphics/mesa-dri \
			glxinfo:graphics/mesa-demos \
			${PYTHON_PKGNAMEPREFIX}nose-cov>0:devel/py-nose-cov@${PY_FLAVOR} \
			Xvfb:x11-servers/xorg-server \
			pstree:sysutils/psmisc \
			cabextract:archivers/cabextract \
			${LOCALBASE}/bin/unzip:archivers/unzip \
			zip:archivers/zip \
			7z:archivers/7-zip \
			curl:ftp/curl \
			${LOCALBASE}/share/sounds/sf2/FluidR3_GM.sf2:audio/fluid-soundfont \
			appstream-builder:devel/appstream-glib \
			xdg-open:devel/xdg-utils \
			${PYTHON_PKGNAMEPREFIX}evdev>0:devel/py-evdev@${PY_FLAVOR} \
			winetricks:emulators/winetricks
#			pylint:devel/pylint
LIB_DEPENDS=		libwebkit2gtk-4.0.so:www/webkit2-gtk3 \
			libdbus-1.so:devel/dbus \
			libcurl.so:ftp/curl

USES=			linux gl gnome localbase:ldflags pkgconfig python:-3.10 desktop-file-utils \
			shebangfix xorg

USE_GNOME=		cairo glib20 gtk30 gnomeprefix gnomedesktop3 gdkpixbuf2 intlhack \
			introspection libxml2 libxslt pygobject3

USE_PYTHON=		distutils concurrent

USE_XORG=		dmx pciaccess x11 ice xau xdmcp xrandr
USE_GL=			gl

USE_GITHUB=		nodefault

NO_ARCH=		yes

SHEBANG_FILES=		share/lutris/bin/lutris-wrapper

GH_ACCOUNT=		lutris
GH_PROJECT=		lutris
GH_TAGNAME=		c151e4b211bec7c8dda452f90533f289452648ed

WRKSRC=			${WRKDIR}/lutris-${GH_TAGNAME}

OPTIONS_DEFINE=		NLS GNUTLS GVFS WINE VULKAN VULKAN3D
OPTIONS_DEFAULT=	NLS GNUTLS GVFS WINE VULKAN VULKAN3D

NLS_USES=		gettext

GNUTLS_LIB_DEPENDS=	libgnutls.so:security/gnutls

GVFS_USE=		GNOME=gvfs

WINE_DESC=		Windows support
WINE_RUN_DEPENDS=	wine:emulators/wine

VULKAN_DESCR=		Vulkan support
VULKAN_BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers \
			vulkan-loader>0:graphics/vulkan-loader \
			vulkan-extension-layer>0:graphics/vulkan-extension-layer
VULKAN_LIB_DEPENDS=	libvulkan.so:graphics/vulkan-loader \
			libVkLayer_khronos_synchronization2.so:graphics/vulkan-extension-layer \
			libVkLayer_khronos_timeline_semaphore.so:graphics/vulkan-extension-layer
VULKAN_RUN_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers \
			${LOCALBASE}/lib/libvulkan.so:graphics/vulkan-loader \
			vulkan-extension-layer>0:graphics/vulkan-extension-layer \
			${LOCALBASE}/lib/libvulkan.so:graphics/vulkan-loader

VULKAN3D_DESCR=		Vulkan3D support (implies Vulkan)
VULKAN3D_BUILD_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers
VULKAN3D_LIB_DEPENDS=	libvulkan.so:graphics/vulkan-loader \
			libvkd3d.so:graphics/vkd3d
VULKAN3D_RUN_DEPENDS=	${LOCALBASE}/include/vulkan/vulkan.h:graphics/vulkan-headers

post-patch:
	@${REINPLACE_CMD} -e 's|/proc|/compat/linux/proc|g' ${WRKSRC}/lutris/util/graphics/drivers.py
	@${REINPLACE_CMD} -e 's|/proc|/compat/linux/proc|g' ${WRKSRC}/lutris/util/linux.py
	@${REINPLACE_CMD} -e 's|/proc|/compat/linux/proc|g' ${WRKSRC}/lutris/util/process.py

.include <bsd.port.options.mk>

#
# Notes
# pkg-plist as generated looks good, a few lines incorporate lutris version in the path.
#
# Find options toggles:
# - gnutls seems to be used regardless
# - NLS seems to add no other files
# Need to figure out how to help it find missing things during runtime.
# 
#Depends: ${misc:Depends},
#         ${python3:Depends},
#         python3-yaml,
#         python3-lxml,
#         python3-requests,
#         python3-pil,
#         python3-gi,
#         python3-setproctitle,
#         python3-magic,
#         python3-distro,
#         python3-dbus,
#         gir1.2-gtk-3.0,
#         gir1.2-webkit2-4.0,
#         gir1.2-notify-0.7,
#         psmisc,
#         cabextract,
#         unzip,
#         p7zip,
#         curl,
#         fluid-soundfont-gs,
#         x11-xserver-utils,
#         mesa-utils,
#Recommends: python3-evdev,
#            gvfs-backends,
#            libwine-development,
#            winetricks,
#Suggests: gamemode, -- no FreeBSD port, dunno if too Linux specific.
#
# after build but before install?
# need to modify utils/linux.py
# need to modify utils/display.py
# to have ldconfig -r, replace lspci with pciconf -lv, and more.
# modify multiarch lib folders to more appropriate.
# Eventually re-write entire linux.py as freebsd.py with appropriate info.
.include <bsd.port.mk>
