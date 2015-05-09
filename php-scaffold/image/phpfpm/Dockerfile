FROM centos:7

MAINTAINER Eryx Lee <eryx.lee0901@gmail.com>

RUN groupadd -r www-data -g 433 && \
useradd -u 431 -r -g www-data -s /sbin/nologin -c "www user" www-data 

RUN yum -y update \
&& yum -y remove php php-\* \
&& yum -y install  libxml2 libxml2-devel \
                  libxslt-devel \
                  zlib zlib-devel \
                  glibc glibc-devel \
                  glib2 glib2-devel \
                  openssl-devel \
                  bzip2-devel \
                  libcurl-devel \
                  libjpeg libjpeg-devel \
                  libpng libpng-devel \
                  freetype freetype-devel \
                  libevent-devel \
                  libtool-ltdl libtool-ltdl-devel \
                  libicu libicu-devel \
                  libmcrypt libmcrypt-devel \
                  mhash mhash-devel \
                  mcrypt \
                  gearmand \
                  pcre pcre-devel \
                  mysql-devel \
                  php php-cli php-common php-devel php-fpm php-gd \
                  php-mbstring php-mysql php-pdo php-pear php-pecl-memcache \
                  php-pecl-redis php-xml php-xmlrpc \
                  php-mcrypt php-bcmath php-mhash php-mcrypt \
                  git \
                  python-setuptools

RUN easy_install supervisor

ADD supervisord.conf /etc/supervisor/supervisord.conf

WORKDIR /var/www/html

EXPOSE 9000

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
