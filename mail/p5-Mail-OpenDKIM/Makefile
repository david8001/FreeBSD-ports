# Created by: Vivek Khera <vivek@khera.org>
# $FreeBSD$

PORTNAME=	Mail-OpenDKIM
PORTVERSION=	4201
PORTREVISION=	1
CATEGORIES=	mail perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	vivek@khera.org
COMMENT=	Perl interface to OpenDKIM C library

LICENSE=	ART10 GPLv1
LICENSE_COMB=	dual

BUILD_DEPENDS=	opendkim>=2.5.0:${PORTSDIR}/mail/opendkim
LIB_DEPENDS=	libopendkim.so:${PORTSDIR}/mail/opendkim
RUN_DEPENDS=	opendkim>=2.5.0:${PORTSDIR}/mail/opendkim \
		p5-Error>=0:${PORTSDIR}/lang/p5-Error

USES=		perl5
USE_PERL5=	configure

BROKEN=		fails to compile with present version of mail/opendkim port
DEPRECATED=	Does not compile with newer opendkim port. Please use mail/p5-Mail-DKIM instead.
EXPIRATION_DATE=	2015-10-31

PLIST_FILES=	%%SITE_ARCH%%/Mail/OpenDKIM.pm \
		%%SITE_ARCH%%/Mail/OpenDKIM/DKIM.pm \
		%%SITE_ARCH%%/Mail/OpenDKIM/PrivateKey.pm \
		%%SITE_ARCH%%/Mail/OpenDKIM/Signature.pm \
		%%SITE_ARCH%%/Mail/OpenDKIM/Signer.pm \
		%%SITE_ARCH%%/auto/Mail/OpenDKIM/OpenDKIM.so \
		%%PERL5_MAN3%%/Mail::OpenDKIM.3.gz \
		%%PERL5_MAN3%%/Mail::OpenDKIM::DKIM.3.gz \
		%%PERL5_MAN3%%/Mail::OpenDKIM::PrivateKey.3.gz \
		%%PERL5_MAN3%%/Mail::OpenDKIM::Signature.3.gz \
		%%PERL5_MAN3%%/Mail::OpenDKIM::Signer.3.gz

.include <bsd.port.mk>
