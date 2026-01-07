FROM ubuntu:focal

RUN apt update && apt install -y  --no-install-recommends\
    gdebi wget &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://cdn.teleport.dev/teleport_12.0.2_amd64.deb &&\
    gdebi -n teleport_12.0.2_amd64.deb &&\
    rm teleport_12.0.2_amd64.deb
