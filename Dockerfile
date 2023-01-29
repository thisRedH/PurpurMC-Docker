FROM ghcr.io/graalvm/jdk:ol9-java17-22

EXPOSE 25565/tcp

ENV MC_VERSION 1.19.2
ENV MC_EULA true
ENV MC_RAM_XMS 1536M
ENV MC_RAM_XMX 2048M

VOLUME /home/server

USER root
WORKDIR /home/server

COPY src/main.sh /main.sh

RUN microdnf install -y epel-release &&\
    microdnf install -y unar &&\
    microdnf install -y findutils

RUN chmod +x /main.sh

CMD ["/main.sh"]