# $FreeBSD$

PORTNAME=	graphite2
PORTVERSION=	1.3.0
CATEGORIES=	graphics print
MASTER_SITES=	SF/silgraphite/${PORTNAME}

MAINTAINER=	office@FreeBSD.org
COMMENT=	Rendering capabilities for complex non-Roman writing systems

USES=		cmake iconv tar:tgz
USE_LDCONFIG=	yes
LDFLAGS+=	-L${LOCALBASE}/lib ${ICONV_LIB}

post-patch:
	@${REINPLACE_CMD} -e 's,/pkgconfig,data/pkgconfig,g' ${WRKSRC}/CMakeLists.txt

.include <bsd.port.mk>
