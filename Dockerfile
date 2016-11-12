FROM java:openjdk-8-jre

MAINTAINER jonechenug <jonechenug@gmail.com>

RUN apt-get update

RUN apt-get install  libpcap-dev -y
RUN apt-get install iptables -y
RUN apt-get clean


ADD client.jar client.jar
ADD client_config.json client_config.json
ADD port_map.json port_map.json

EXPOSE 1099
EXPOSE 2200

CMD ["sh", "-c", "java -jar client.jar -b"]
