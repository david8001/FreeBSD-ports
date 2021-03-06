# Created by: Alonso Cardenas <acm@FreeBSD.org>
# $FreeBSD$

PORTNAME=	bareos
DISTVERSION=	15.2
PORTREVISION?=	1
CATEGORIES?=	sysutils
PKGNAMEPREFIX?=	#
PKGNAMESUFFIX?=	-server

USE_GITHUB=	yes
GH_ACCOUNT=	bareos
GH_PROJECT=	bareos
GH_TAGNAME=	bb1529f88585da31a0053f06727c74f2a7cb0dc1

MAINTAINER=	acm@FreeBSD.org
COMMENT?=	Backup archiving recovery open sourced (server)

USES+=		libtool:keepla

CONFLICTS?=	bacula*-server-*

LIB_DEPENDS+=	liblzo2.so:${PORTSDIR}/archivers/lzo2

USERS=		bareos
GROUPS=		${USERS}

PLIST_SUB+=	LIB_VERSION=${PORTVERSION}.0

GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

CPPFLAGS+=	-I/usr/include/readline -I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

OPTIONS_DEFINE?=	MTX PYTHON NLS OPENSSL
OPTIONS_DEFAULT?=	NLS OPENSSL PGSQL
MTX_DESC=		Install mtx for control of autochanger devices

.if ${PKGNAMESUFFIX} == "-server"  
OPTIONS_SINGLE_DATABASE=	SQLITE3 MYSQL PGSQL
OPTIONS_SINGLE=		DATABASE
DATABASE_DESC=		Database support
.endif

OPENSSL_USE=	OPENSSL=yes
OPENSSL_CONFIGURE_ON=	--with-openssl=${OPENSSLBASE}
OPENSSL_CONFIGURE_OFF=	--with-openssl="no"

.if ${PKGNAMESUFFIX} == "-client" || ${PKGNAMESUFFIX} == "-server"  #Till end of the file

PYTHON_USES=		  python
PYTHON_CONFIGURE_ON=	--with-python=yes
PYTHON_CONFIGURE_OFF=	--with-python=no

.if !defined(WITH_CLIENT_ONLY)
LIB_DEPENDS+=	libbareos.so:${PORTSDIR}/sysutils/bareos-client
USE_RC_SUBR?=	bareos-dir bareos-sd
.endif

.if defined(WITH_CLIENT_ONLY)
SUB_FILES+=	pkg-install.client pkg-deinstall.client pkg-message.client
.else
SUB_FILES+=	pkg-message.server
.endif

CONFIGURE_ARGS+=--with-tcp-wrappers=/usr/lib \
		--enable-libtool \
		--enable-smartalloc \
		--sysconfdir=${PREFIX}/etc \
		--with-working-dir=${BAREOS_DIR} \
		--with-scriptdir=${PREFIX}/share/${PORTNAME} \
		--with-logdir=/var/log/bareos \
		--with-readline=yes \
		--disable-conio \
		--enable-batch-insert \
		--with-plugindir=${PREFIX}/lib/bareos/plugins \
		--with-scriptdir=${PREFIX}/lib/bareos/scripts \
		--with-dump-email=root@localhost \
		--with-job-email=root@localhost \
		--with-db-name=bareos \
		--with-sbin-perm=755 \
		--with-db-user=bareos \
		--with-baseport=9101 \
		--with-pid-dir=/var/run/bareos

.if defined(WITH_CLIENT_ONLY)
CONFIGURE_ARGS+=--with-fd-user=root \
		--with-fd-group=wheel
.else
CONFIGURE_ARGS+=--with-dir-user=${BAREOS_USER} \
		--with-dir-group=${BAREOS_GROUP} \
		--with-sd-user=${BAREOS_USER} \
		--with-sd-group=operator
.endif

# The user/group IDs below are registered, see
# http://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/book.html#DADS-UID
#
BAREOS_USER?=	bareos
BAREOS_GROUP?=	${BAREOS_USER}
BAREOS_UID?=	997
BAREOS_GID?=	${BAREOS_UID}
BAREOS_DIR?=	/var/db/bareos

PLIST_SUB+=	BAREOS_DIR=${BAREOS_DIR}

SUB_LIST=	BAREOS_USER=${BAREOS_USER} \
		BAREOS_GROUP=${BAREOS_GROUP} \
		BAREOS_UID=${BAREOS_UID} \
		BAREOS_GID=${BAREOS_GID} \
		BAREOS_DIR=${BAREOS_DIR}

NLS_USES=		gettext
NLS_CONFIGURE_ENABLE=	nls

# Client only or full server version
.if defined(WITH_CLIENT_ONLY)
CONFFILES=	fd
CONFIGURE_ARGS+=	--enable-client-only

PKGDEINSTALL=	${FILESDIR}/pkg-deinstall.client
PKGINSTALL=	${FILESDIR}/pkg-install.client
.else
# Server only Options
CONFFILES=		sd dir
# Server default database

MYSQL_CONFIGURE_ON=	--with-mysql=yes
MYSQL_USE=	MYSQL=yes
SQLITE3_CONFIGURE_ON=	--with-sqlite3=yes
SQLITE3_LIB_DEPENDS=	libsqlite3.so:${PORTSDIR}/databases/sqlite3
PGSQL_CONFIGURE_ON=	--with-postgresql=yes
PGSQL_USES=	pgsql

MTX_RUN_DEPENDS=	${LOCALBASE}/sbin/mtx:${PORTSDIR}/misc/mtx

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MMYSQL}
DBTYPE=			mysql
SUB_LIST+=		REQ_MYSQL=mysql REQ_PGSQL=""
.elif ${PORT_OPTIONS:MSQLITE3}
DBTYPE=			sqlite3
.else
DBTYPE=			postgresql
SUB_LIST+=		REQ_MYSQL="" REQ_PGSQL=postgresql
.endif
PLIST_SUB+=		DBTYPE=${DBTYPE}

.endif

.if defined(WITH_CLIENT_ONLY)
MP1+=	bconsole.1
MP8+=	bareos-fd.8
.else
MP8+=	bareos.8 bareos-dir.8 bareos-sd.8 bcopy.8 bextract.8 bls.8 bscan.8 \
	btape.8 btraceback.8 bareos-dbcheck.8
MP1+=	bsmtp.1 bregex.1 bwild.1 bareos-tray-monitor.1
.endif

MAKE_ENV+=	MAN8="${MP8}" MAN1="${MP1}"

post-patch:
#	This port does not install docs.  See bareos-docs for that
	${REINPLACE_CMD} -e '/docdir/d' ${WRKSRC}/Makefile.in
#	Default bconsole.conf is in ${ETCDIR}
	@${REINPLACE_CMD} -e 's|./bconsole.conf|${ETCDIR}/bconsole.conf|g' ${WRKSRC}/src/console/console.c
	@${REINPLACE_CMD} -e 's|^MAN8 =|MAN8 ?=|g' -e 's|^MAN1 =|MAN1 ?=|g' ${WRKSRC}/manpages/Makefile.in
	@${REINPLACE_CMD} -e 's|_NONSHARED||g' ${WRKSRC}/src/filed/Makefile.in
.if defined(WITH_CLIENT_ONLY)
	@${REINPLACE_CMD} -e 's|^\(fd_subdirs = .*\)scripts\(.*\)|\1\2|g' ${WRKSRC}/Makefile.in
	${REINPLACE_CMD} -e 's|\(.*$${MKDIR} $${DESTDIR}$${scriptdir}\)|#\1|g' ${WRKSRC}/Makefile.in
.else
#	In server port don't install filed
	@${REINPLACE_CMD} -e '/^fd_subdirs = /s|src/filed||' -e 's|src/console||' \
		-e 's|src/lib||' -e 's|src/findlib||' -e 's|@FD_PLUGIN_DIR@||' ${WRKSRC}/Makefile.in
	@${REINPLACE_CMD} -e 's|../lib/|$$(LOCALBASE)/lib/|g' -e 's|../findlib/|$$(LOCALBASE)/lib/|g' ${WRKSRC}/src/dird/Makefile.in \
		${WRKSRC}/src/stored/Makefile.in ${WRKSRC}/src/tools/Makefile.in
	@${REINPLACE_CMD} -e 's|fd_plugins.h|filed/fd_plugins.h|g' -e 's|dir_plugins.h|dird/dir_plugins.h|g' -e 's|stored.h|stored/stored.h|g' \
		${WRKSRC}/src/tools/bpluginfo.c
.endif

.if !target(post-install)
post-install:
.if defined(WITH_CLIENT_ONLY)
	${MV} ${STAGEDIR}${ETCDIR}/bconsole.conf ${STAGEDIR}${ETCDIR}/bconsole.conf.sample
.else
	${INSTALL_SCRIPT} ${FILESDIR}/chio-bareos ${STAGEDIR}${PREFIX}/sbin
	${INSTALL_DATA} ${FILESDIR}/bareos-barcodes ${STAGEDIR}${ETCDIR}/bareos-barcodes.sample
	${CHMOD} o+x ${STAGEDIR}${PREFIX}/bin/bsmtp
.endif
	for na in ${CONFFILES}; do \
		${MV} ${STAGEDIR}${ETCDIR}/bareos-$$na.conf ${STAGEDIR}${ETCDIR}/bareos-$$na.conf.sample; \
	done
	@${MKDIR} ${STAGEDIR}/var/run/bareos
.endif
.else
.include "${MASTERDIR}/Makefile.common"
.endif # -client and -server are defined
.include <bsd.port.mk>
