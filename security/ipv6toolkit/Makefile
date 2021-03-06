# $FreeBSD$

PORTNAME=	ipv6toolkit
PORTVERSION=	2.0.b
CATEGORIES=	security ipv6
MASTER_SITES=	http://www.si6networks.com/tools/ipv6toolkit/
DISTNAME=	ipv6toolkit-v2.0beta

MAINTAINER=	hrs@FreeBSD.org
COMMENT=	Set of IPv6 security assessment tools

LICENSE=	GPLv3

USES=		shebangfix uidfix
SHEBANG_FILES=	tools/blackhole6 tools/script6
MAKE_ENV=	DATADIR=${DATADIR} WRKSRC=${WRKSRC}
SUB_FILES=	BSDMakefile Makefile Makefile.lib
MAKEFILE=	BSDMakefile
PORTDOCS=	README.TXT CHANGES.TXT CREDITS.TXT

PROGDIRS=	addr6 flow6 frag6 icmp6 jumbo6 na6 ni6 ns6 path6 ra6 rd6 rs6 \
		scan6 tcp6
LIBDIRS=	libipv6

OPTIONS_DEFINE=	DOCS

.include <bsd.port.options.mk>

post-extract:
	@cd ${WRKSRC} && ${MKDIR} ${PROGDIRS} ${LIBDIRS}

post-patch: apply-slist
	${INSTALL_DATA} ${WRKDIR}/BSDMakefile ${WRKSRC}
	for D in ${PROGDIRS}; do \
		${INSTALL_DATA} ${WRKDIR}/Makefile ${WRKSRC}/$$D; \
	done
	for D in ${LIBDIRS}; do \
		${INSTALL_DATA} ${WRKDIR}/Makefile.lib ${WRKSRC}/$$D/Makefile; \
	done

post-install:
	${INSTALL_SCRIPT} ${WRKSRC}/tools/blackhole6 ${WRKSRC}/tools/script6 \
	    ${STAGEDIR}${PREFIX}/sbin
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${PORTDOCS} ${STAGEDIR}${DOCSDIR}
.endif

.include <bsd.port.mk>
