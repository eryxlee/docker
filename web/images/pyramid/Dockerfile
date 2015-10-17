# start with a base image
FROM ubuntu:14.10

# change default source list
ADD sources.list /etc/apt/sources.list

# change default UTC timezone to Asia/Shanghai
# use -v /etc/localtime:/etc/localtime instead if available
RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update && \
    apt-get install python-all-dev \
                    autoconf \
                    zlib1g-dev \
                    libmysqlclient-dev \
                    mysql-client \
                    python-crypto \
                    python-mysqldb \
                    supervisor -y && \
    apt-get autoremove

# install python pip, python-pip is out of date
ADD get-pip.py /source/get-pip.py
RUN python /source/get-pip.py --trusted-host mirrors.aliyun.com -i http://mirrors.aliyun.com/pypi/simple

# add requirements.txt and install
ADD requirements.txt /source/requirements.txt
RUN pip install -r /source/requirements.txt  --trusted-host mirrors.aliyun.com -i http://mirrors.aliyun.com/pypi/simple

ADD supervisor.conf /etc/supervisor/supervisord.conf

EXPOSE 6543
VOLUME /source

WORKDIR /source

CMD ["/usr/bin/supervisord"]
