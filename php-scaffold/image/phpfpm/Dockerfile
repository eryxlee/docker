FROM centos:7
MAINTAINER Eryx Lee <eryx.lee0901@gmail.com>

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm \
 && rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
 && yum -y update && yum -y remove php php-\* \
 && yum -y --enablerepo=remi,remi-php56 install wget tar gcc gcc-c++ make \
                  libxml2 libxml2-devel \
                  libxslt libxslt-devel \
                  glibc glibc-devel \
                  glib2 glib2-devel \
                  zlib zlib-devel \
                  bzip2 bzip2-devel \
                  openssl openssl-devel \
                  libcurl libcurl-devel \
                  libjpeg libjpeg-devel \
                  libpng libpng-devel \
                  freetype freetype-devel \
                  libevent libevent-devel \
                  libtool-ltdl libtool-ltdl-devel \
                  libicu libicu-devel \
                  pcre pcre-devel \
                  libmcrypt libmcrypt-devel\
                  mhash mhash-devel\
                  mariadb-devel \
                  php php-bcmath php-cli php-common php-devel php-fpm php-gd \
                  php-intl php-ldap php-mbstring php-mysql php-pdo \
                  php-pear php-mcrypt php-soap php-xml php-xmlrpc  \
                  php-pecl-geoip php-pecl-gmagick \
                  php-pecl-mongo php-pecl-memcached php-pecl-redis \
                  php-pecl-xdebug \
                  git supervisor

ADD supervisord.conf /etc/supervisor/supervisord.conf

RUN groupadd -r www-data -g 433 && \
    useradd -u 431 -r -g www-data -s /sbin/nologin -c "www user" www-data

WORKDIR /var/www/html

EXPOSE 9000

CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
