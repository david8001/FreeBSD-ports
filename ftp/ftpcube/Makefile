# Created by: ijliao
# $FreeBSD$

PORTNAME=	ftpcube
PORTVERSION=	0.5.1
PORTREVISION=	9
CATEGORIES=	ftp python
MASTER_SITES=	SF

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Graphical FTP Client

LICENSE=	ART10

RUN_DEPENDS=	${PYTHON_SITELIBDIR}/paramiko/__init__.py:${PORTSDIR}/security/py-paramiko

USES=		python
USE_PYTHON=	distutils autoplist
USE_WX=		2.6+
WX_COMPS=	python
WX_UNICODE=	yes

post-patch:
	@${REINPLACE_CMD} 's,/usr/local,${PREFIX},' ${WRKSRC}/setup.cfg
	@${ECHO_CMD} record=installed-files.log >> ${WRKSRC}/setup.cfg

.include <bsd.port.mk>
