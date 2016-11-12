FROM openjdk-8-jre

MAINTAINER jonechenug <jonechenug@gmail.com>

RUN apt-get update

RUN apt-get install  libpcap-dev -y

RUN apt-get clean

RUN mkdir -p /fs
ADD client.jar /fs/client.jar
ADD client_config.json /fs/client_config.json
ADD port_map.json /fs/port_map.json
RUN chmod -R 755 /fs

EXPOSE 1099
EXPOSE 2200

CMD ["sh", "-c", "java -jar /fs/client.jar -b"]
