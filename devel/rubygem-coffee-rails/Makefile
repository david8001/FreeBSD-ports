# Created by: Steve Wills <swills@FreeBSD.org>
# $FreeBSD$

PORTNAME=	coffee-rails
PORTVERSION=	3.2.2
PORTREVISION=	1
CATEGORIES=	devel rubygems
MASTER_SITES=	RG

MAINTAINER=	ruby@FreeBSD.org
COMMENT=	Coffee Script adapter for the Rails asset pipeline

LICENSE=	MIT

RUN_DEPENDS=	rubygem-coffee-script>=2.2.0:${PORTSDIR}/devel/rubygem-coffee-script \
		rubygem-railties>=3.2.10:${PORTSDIR}/www/rubygem-railties

NO_ARCH=	yes

USE_RUBY=	yes
USE_RUBYGEMS=	yes
RUBYGEM_AUTOPLIST=	yes

PORTSCOUT=	limit:^3\.

.include <bsd.port.mk>
