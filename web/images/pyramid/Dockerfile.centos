FROM centos:7
MAINTAINER Zheng, Ping <zp@pingz.biz>
RUN localedef -i en_US -c -f UTF-8 en_US.UTF-8
## change locale for utf-8
RUN sed -e 's/LANG=.*/LANG=en_US.UTF-8/' -i /etc/locale.conf
## change timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
# this can't run because it depend on systemd which is not enabled.
# RUN localectl set-locale LANG=en_US.UTF-8
RUN yum -y update && yum clean all
RUN yum -y install epel-release
RUN yum -y install python-pip \
                   gcc \
                   python-devel \
                   gmp-devel \
                   mariadb-devel
# using tsinghua mirror for pip
# refer https://wiki.tuna.tsinghua.edu.cn/MirrorUsage/pypi
RUN mkdir -p /root/.pip
COPY pip.conf /root/.pip/pip.conf
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple \
        sqlalchemy \
        mysql-python \
        pyramid \
        pyramid_webassets \
        pyramid-debugtoolbar \
        pyramid-chameleon \
        pyramid-mako \
        waitress \
        Pygments \
        Chameleon \
        Mako \
        MarkupSafe
# setup default workspace.
VOLUME ["/app"]
WORKDIR /app
# default port for devlopement app to run
EXPOSE 6543
COPY start.sh /start.sh
RUN chmod +x /start.sh
ENV PRJN                        # project name
CMD ["/start.sh"]
