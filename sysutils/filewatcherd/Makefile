# Created by: Natacha Porte <natbsd@instinctive.eu>
# $FreeBSD$

PORTNAME=	filewatcherd
PORTVERSION=	1.0b2
PORTREVISION=	1
CATEGORIES=	sysutils

MAINTAINER=	natbsd@instinctive.eu
COMMENT=	Daemon that watches files and runs commands when they change

LICENSE=	ISCL

USE_GITHUB=	yes
GH_ACCOUNT=	faelys
GH_TAGNAME=	1.0-beta2

USE_RC_SUBR=	filewatcherd

SUB_FILES=	pkg-message
PLIST_FILES=	sbin/filewatcherd etc/watchtab.sample

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/filewatcherd ${STAGEDIR}${PREFIX}/sbin
	${INSTALL_DATA} ${FILESDIR}/watchtab.sample ${STAGEDIR}${PREFIX}/etc

.include <bsd.port.mk>
