#FROM image-registry.vo.elte.hu/jupyter-siesta-v9
#FROM csniper/slurm:23.11-deb
#FROM mmayer123/slurm-docker-cluster:2024.04.0-daily-456.pro1-slurm-23.11.3-1-jammy
#FROM nathanhess/slurm:full-root
#FROM giovtorres/slurm-docker-cluster 

#RUN apt update && apt install -y --no-install-recommends curl gpg \ 
#libnuma-dev libmunge-dev libhwloc-dev numactl libreadline-dev openssl libpam0g-dev &&\
# apt-get clean && rm -rf /var/lib/apt/lists/*

FROM jupyter-siesta-v7

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
  munge nano build-essential git mariadb-server wget slurmd slurm-client slurmctld sudo openssh-server  &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*
WORKDIR /opt
#RUN wget https://snapshot.debian.org/archive/debian/20220422T085053Z/pool/main/s/slurm-wlm/slurm-wlm_21.08.7-1_amd64.deb
#RUN wget https://snapshot.debian.org/archive/debian/20220422T085053Z/pool/main/s/slurm-wlm/slurm-client_21.08.7-1_amd64.deb
#RUN apt update 
#RUN  apt install -y --no-install-recommends  slurm-wlm=21.08.7-1
#RU apt-get clean && rm -rf /var/lib/apt/lists/*
#RUN dpkg -i slurm-wlm_21.08.7-1_amd64.deb 
#RUN wget https://download.schedmd.com/slurm/slurm-23.11.5.tar.bz2 &&\
#    tar xjf slurm-23.11.5.tar.bz2 
#RUN cd slurm-23.11.5 &&\
#    ./configure \
#    --prefix=/usr/local/slurm \
#    --sysconfdir=/etc/slurm \
#    --without-systemdsystemunitdir \
#    --disable-pam \
#    --disable-cgroup \
#    make  && make install
    

COPY etc/docker-entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh


ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/entrypoint.sh"]
WORKDIR /
