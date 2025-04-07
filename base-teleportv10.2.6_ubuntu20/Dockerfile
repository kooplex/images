FROM ubuntu:focal

RUN apt update && apt install -y  --no-install-recommends\
    gdebi wget &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

ENV TELEPORT_VER 10.2.6
RUN wget --no-check-certificate https://cdn.teleport.dev/teleport_${TELEPORT_VER}_amd64.deb &&\
    gdebi -n teleport_${TELEPORT_VER}_amd64.deb &&\
    rm teleport_${TELEPORT_VER}_amd64.deb
