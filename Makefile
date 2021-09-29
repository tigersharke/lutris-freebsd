PORTNAME=	lutris
DISTVERSION=	g20210927
CATEGORIES=	games
PKGNAMESUFFIX=	-freebsd
DISTNAME=	${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=	nope@nothere
COMMENT=	a free and open source game manager for Linux-based operating systems

LICENSE=	GPLv3

USES=desktop-file-utils python shebangfix
SHEBANG_FILES=share/lutris/bin/lutris-wrapper

USE_PYTHON=	distutils

USE_GITHUB=     nodefault
GH_ACCOUNT=     lutris
GH_PROJECT=     lutris
GH_TAGNAME=	9c5ab57ab68d40653ff755731f6c2ad01f19e6bf

WRKSRC=	${WRKDIR}/lutris-${GH_TAGNAME}

.include <bsd.port.mk>
