# Created by: Tim McCormick <tim@pcbsd.org>
# $FreeBSD$

PORTNAME=	min12xxw
PORTVERSION=	0.0.9
CATEGORIES=	print
MASTER_SITES=	http://hinterbergen.de/mala/min12xxw/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Print driver for the Minolta PagePro 1(2/3/4)xxW printers

HAS_CONFIGURE=	yes

PLIST_FILES=	bin/min12xxw bin/esc-m \
		man/man1/min12xxw.1.gz

do-install:
	${INSTALL_SCRIPT} ${WRKSRC}/min12xxw ${STAGEDIR}${PREFIX}/bin
	${INSTALL_SCRIPT} ${WRKSRC}/esc-m ${STAGEDIR}${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/min12xxw.1 ${STAGEDIR}${PREFIX}/man/man1

.include <bsd.port.mk>
