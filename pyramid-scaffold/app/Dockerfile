# start with a base image
FROM ubuntu:14.10

ADD sources.list /etc/apt/sources.list

RUN apt-get update && \
    apt-get install python-all-dev \
                    python-pip \
                    zlib1g-dev \
                    libmysqlclient-dev \
                    mysql-client \
                    python-mysqldb \
                    supervisor -y && \
    apt-get autoremove

# add requirements.txt and install
ADD requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt -i http://pypi.douban.com/simple

ADD supervisor.conf /etc/supervisor/supervisord.conf

EXPOSE 6543
VOLUME /code

WORKDIR /code

CMD ["/usr/bin/supervisord"]
