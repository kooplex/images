FROM ubuntu:bionic

MAINTAINER Kooplex Team <kooplex@complex.elte.hu>

USER root

# configure apt frontent
ENV DEBIAN_FRONTEND noninteractive

# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
# Install NFS client ACL manipulation
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    wget \
    bzip2 \
    ca-certificates \
    sudo vim \
    locales nfs-common acl nfs4-acl-tools tzdata\
  liblapack-dev libblas-dev \
 gfortran libfreetype6* pkg-config \
 git gcc mpi-default-dev mpi-default-bin libfftw3-dev fftw3 cmake \
 autoconf libncurses5-dev libncursesw5-dev zlib1g-dev libbz2-dev liblzma-dev apt-rdepends \
 libfontconfig1 libxrender1 libxrender-dev \
 g++-5 libicu-dev libxml2-dev \
 libblacs-mpi-dev libscalapack-mpi-dev systemd slurmd \
 libnss-ldapd openldap-utils ldap-client libldap2-dev &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.19.0/tini && \
    echo "93dcc18adc78c65a028a84799ecf8ad40c936fdfc5f2a57b1acda5a8117fa82c *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

# Install LDAP and setup authentication
# COPY nslcd.conf /etc/nslcd.conf
# RUN chmod 0600 /etc/nslcd.conf
#RUN sed -i -e "s,passwd.*,passwd: ldap compat systemd," -e "s,group.*,group: ldap compat systemd," /etc/nsswitch.conf

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.a /usr/lib/
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

#RUN mkdir /init
#RUN echo "service nslcd start" > /init/01-nslcd

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime
RUN dpkg-reconfigure tzdata


COPY etc/docker-entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh


ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/entrypoint.sh"]

