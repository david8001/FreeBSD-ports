# $FreeBSD$

PORTNAME=	pfSense-pkg-AutoConfigBackup
PORTVERSION=	1.28
CATEGORIES=	sysutils
MASTER_SITES=	# empty
DISTFILES=	# empty
EXTRACT_ONLY=	# empty

MAINTAINER=	coreteam@pfsense.org
COMMENT=	pfSense package AutoConfigBackup

NO_BUILD=	yes
NO_MTREE=	yes

SUB_FILES=	pkg-install pkg-deinstall
SUB_LIST=	PORTNAME=${PORTNAME}

do-extract:
	${MKDIR} ${WRKSRC}

do-install:
	${MKDIR} ${STAGEDIR}${PREFIX}/pkg
	${MKDIR} ${STAGEDIR}${PREFIX}/pkg/write_config
	${MKDIR} ${STAGEDIR}${PREFIX}/www
	${MKDIR} ${STAGEDIR}/etc/inc
	${MKDIR} ${STAGEDIR}${DATADIR}
	${INSTALL_DATA} -m 0644 ${FILESDIR}${PREFIX}/pkg/autoconfigbackup.xml \
		${STAGEDIR}${PREFIX}/pkg
	${INSTALL_DATA} -m 0755 ${FILESDIR}${PREFIX}/pkg/write_config/parse_config_upload.inc \
		${STAGEDIR}${PREFIX}/pkg/write_config
	${INSTALL_DATA} -m 0755 ${FILESDIR}${PREFIX}/www/autoconfigbackup.php \
		${STAGEDIR}${PREFIX}/www
	${INSTALL_DATA} -m 0755 ${FILESDIR}${PREFIX}/pkg/autoconfigbackup.inc \
		${STAGEDIR}${PREFIX}/pkg
	${INSTALL_DATA} -m 0755 ${FILESDIR}/etc/inc/crypt_acb.php \
		${STAGEDIR}/etc/inc
	${INSTALL_DATA} -m 0755 ${FILESDIR}${PREFIX}/www/autoconfigbackup_backup.php \
		${STAGEDIR}${PREFIX}/www
	${INSTALL_DATA} -m 0755 ${FILESDIR}${PREFIX}/pkg/write_config/parse_config_upload.php \
		${STAGEDIR}${PREFIX}/pkg/write_config
	${INSTALL_DATA} -m 0755 ${FILESDIR}${PREFIX}/www/autoconfigbackup_stats.php \
		${STAGEDIR}${PREFIX}/www
	${INSTALL_DATA} ${FILESDIR}${DATADIR}/info.xml \
		${STAGEDIR}${DATADIR}

.include <bsd.port.mk>
