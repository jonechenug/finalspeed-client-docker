FROM java:openjdk-8-jre

MAINTAINER jonechenug <jonechenug@gmail.com>

RUN apt-get update

RUN apt-get install  libpcap-dev -y
RUN apt-get install iptables -y
RUN apt-get install -y --force-yes python && \
    apt-get install -y --force-yes python-pip  && \
    apt-get install -y --force-yes curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY fs.ini /etc/supervisor/conf.d/fs.ini

RUN supervisord -c /etc/supervisord.conf

ARG source=.
WORKDIR /fs
COPY $source .
EXPOSE 1099
EXPOSE 2200

