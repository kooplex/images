FROM ubuntu:24.10

RUN apt update && apt install -y  --no-install-recommends\
    gdebi wget &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://cdn.teleport.dev/teleport_14.3.21_amd64.deb &&\
    gdebi -n teleport_14.3.21_amd64.deb &&\
    rm teleport_14.3.21_amd64.deb
