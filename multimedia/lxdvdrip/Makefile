# Created by: Ulrich Spoerlein <q@uni.de>
# $FreeBSD$

PORTNAME=	lxdvdrip
PORTVERSION=	1.62
PORTREVISION=	16
CATEGORIES=	multimedia
MASTER_SITES=	http://download.berlios.de/lxdvdrip/
EXTRACT_SUFX=	.tgz

MAINTAINER=	multimedia@FreeBSD.org
COMMENT=	Command Line Tool to make a copy from a Video DVD

LIB_DEPENDS=	libdvdnav.so:${PORTSDIR}/multimedia/libdvdnav \
		libdvdread.so:${PORTSDIR}/multimedia/libdvdread
RUN_DEPENDS=	buffer:${PORTSDIR}/misc/buffer \
		dvdauthor:${PORTSDIR}/multimedia/dvdauthor \
		growisofs:${PORTSDIR}/sysutils/dvd+rw-tools \
		mpgtx:${PORTSDIR}/multimedia/mpgtx \
		mplayer:${PORTSDIR}/multimedia/mplayer \
		transcode:${PORTSDIR}/multimedia/transcode

SUB_FILES=	pkg-message
PKGMESSAGE=	${WRKDIR}/pkg-message

WRKSRC=		${WRKDIR}/${PORTNAME}
VAMPSRC=	vamps.c requant.c
LXDVDRIPSRC=	cputest.c \
		dvdbackup.c \
		dvdcell.c \
		dvdcopy.c \
		dvdinfo.c \
		dvdtools.c \
		ifo.c \
		lxdvdrip.c \
		requant.c \
		streamanalyze.c \
		systools.c \
		tcmemcpy.c \
		vaporize.c
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lpthread -ldvdread -lm

DOCS=	Changelog.de Changelog.en Changelog.fr \
		README.de  README.en README.fr \
		README.dvdwizard.DE README.dvdwizard.EN README.dvdwizard.FR \
		TODO freebsd.doc

OPTIONS_DEFINE=	DOCS EXAMPLES

post-patch:
	@${REINPLACE_CMD} -E \
		-e 's|playwave[[:space:]]+-r[[:space:]]+|wavplay -s|' \
		-e 's|playwave|wavplay|' \
		-e 's|/usr/local/share/lxdvdrip.wav|${DATADIR}/lxdvdrip.wav|' \
		${WRKSRC}/${PORTNAME}.c
	@${REINPLACE_CMD} -E \
		-e 's|^.+alloca.h.+$$||' \
		${WRKSRC}/dvdbackup.c
	@${REINPLACE_CMD} -E \
		-e 's|fopen64|fopen|g ; s|__off64_t|off_t|g' \
		${WRKSRC}/dvdinfo.c \
		${WRKSRC}/lxdvdrip.c
	@${REINPLACE_CMD} -E \
		-e 's|stat64|stat|' \
		${WRKSRC}/systools.c
	@${REINPLACE_CMD} -E \
		-e 's|uint([[:space:]]+)|unsigned int\1|g' \
		-e 's|int([[:digit:]]+)|int\1_t|' \
		${WRKSRC}/vamps/requant.c

do-install:
.for f in lxdvdrip lxac3scan
	${INSTALL_PROGRAM} ${WRKSRC}/${f} ${STAGEDIR}${PREFIX}/bin
.endfor
	${INSTALL_MAN} ${WRKSRC}/lxdvdrip.1 ${STAGEDIR}${MANPREFIX}/man/man1
	${INSTALL_DATA} ${WRKSRC}/doc-pak/lxdvdrip.conf.EN ${STAGEDIR}${PREFIX}/etc/lxdvdrip.conf.sample
# binaries
	${INSTALL_PROGRAM} ${WRKSRC}/vamps/vamps_${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/vamps/play_cell_${PORTNAME} ${STAGEDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/dvdbackup/dvdbackup_${PORTNAME} ${STAGEDIR}${PREFIX}/bin
# examples
	${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
.for f in lxdvdrip.conf.DE lxdvdrip.conf.EN lxdvdrip.conf.FR
	${INSTALL_DATA} ${WRKSRC}/doc-pak/${f} ${STAGEDIR}${EXAMPLESDIR}
.endfor
# data
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.wav ${STAGEDIR}${DATADIR}
# docs
	${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC}/doc-pak ; ${INSTALL_DATA} ${DOCS} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
