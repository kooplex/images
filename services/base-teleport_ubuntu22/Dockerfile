FROM ubuntu:jammy

RUN apt update && apt install -y  --no-install-recommends\
    gdebi wget curl &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

ENV TELEPORT_VERSION 14.3.1
#RUN curl https://goteleport.com/static/install.sh | bash -s 14.3.1
RUN wget --no-check-certificate https://cdn.teleport.dev/teleport_${TELEPORT_VERSION}_amd64.deb &&\
    gdebi -n teleport_${TELEPORT_VERSION}_amd64.deb &&\
    rm teleport_${TELEPORT_VERSION}_amd64.deb
