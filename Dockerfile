FROM ubuntu:14.04

MAINTAINER jonechenug <jonechenug@gmail.com>

RUN apt-get update
RUN apt-get dist-upgrade -y

RUN apt-get install -y --force-yes libpcap-dev
RUN apt-get install -y --force-yes openjdk-7-jre

RUN apt-get clean

RUN mkdir -p /fs
ADD client.jar /fs/client.jar
ADD client_config.json /fs/client_config.json
ADD port_map.json /fs/port_map.json
RUN chmod -R 755 /fs

EXPOSE 1099
EXPOSE 2200

CMD ["sh", "-c", "java -jar /fs/client.jar -b"]
