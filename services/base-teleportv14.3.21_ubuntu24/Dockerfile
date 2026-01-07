FROM ubuntu:24.10

RUN sed -i -e 's/archive.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources
RUN sed -i -e 's/security.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources
RUN apt update && apt install -y  --no-install-recommends\
    gdebi wget &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://cdn.teleport.dev/teleport_14.3.21_amd64.deb &&\
    gdebi -n teleport_14.3.21_amd64.deb &&\
    rm teleport_14.3.21_amd64.deb
