FROM ghcr.io/graalvm/jdk:ol9-java17-22

EXPOSE 25565/tcp

ENV MC_VERSION 1.19.2
ENV MC_EULA true
ENV MC_RAM_XMS 1536M
ENV MC_RAM_XMX 2048M
ENV MC_URL_ZIP_SERVER_FIILES https://www.learningcontainer.com/download/sample-zip-files/?wpdmdl=1637&refresh=63b94b59702e41673087833

VOLUME /home/server

USER root
WORKDIR /home/server

COPY src/main.sh /main.sh

RUN microdnf install -y epel-release &&\
    microdnf install -y unar

RUN chmod +x /main.sh

CMD ["/main.sh"]