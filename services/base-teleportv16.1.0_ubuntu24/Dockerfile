FROM ubuntu:24.10

RUN apt update && apt install -y  --no-install-recommends\
    gdebi wget &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://cdn.teleport.dev/teleport_16.1.0_amd64.deb &&\
    gdebi -n teleport_16.1.0_amd64.deb &&\
    rm teleport_16.1.0_amd64.deb
