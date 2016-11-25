FROM java:openjdk-8-jre

MAINTAINER jonechenug <jonechenug@gmail.com>

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY fs.ini /etc/supervisor/conf.d/fs.ini

RUN apt-get update

RUN apt-get install  libpcap-dev -y
RUN apt-get install iptables -y
RUN apt-get install -y --force-yes supervisor && \
    apt-get install -y --no-install-recommends cron && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN echo '5 5 * * *  supervisorctl restart fs >> /log.txt' > /etc/crontab
RUN chmod 644 /etc/crontab

ARG source=.
WORKDIR /fs
COPY $source .
EXPOSE 1099
EXPOSE 2200

CMD ["cron", "-f"]

