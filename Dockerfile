FROM java:openjdk-8-jre

MAINTAINER jonechenug <jonechenug@gmail.com>

COPY $source .

RUN apt-get update
RUN apt-get install  libpcap-dev -y
RUN apt-get install iptables -y
RUN apt-get install -y --force-yes supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY supervisord.conf /etc/supervisord.conf
COPY fs.ini /etc/supervisor/conf.d/fs.ini

RUN supervisord -c /etc/supervisord.conf

ARG source=.
WORKDIR /fs

EXPOSE 1099
EXPOSE 2200

CMD ["supervisorctl", ]



