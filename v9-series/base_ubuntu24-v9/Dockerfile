FROM ubuntu:24.10

MAINTAINER Kooplex Team <kooplex@complex.elte.hu>

USER root

# configure apt frontent
ENV DEBIAN_FRONTEND=noninteractive

# Install all OS dependencies for notebook server that starts but lacks all
# features (e.g., download as all possible file formats)
# Install NFS client ACL manipulation

RUN sed -i -e 's/archive.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources
RUN sed -i -e 's/security.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
      wget curl tmux mc\
      bzip2 \
      ca-certificates \
      curl gnupg \
      sudo vim\
      locales nfs-common acl nfs4-acl-tools tzdata \
      libnss-ldapd \
      openldap-utils \
      ldap-client  libhdf5-dev \
      libldap2-dev \
    libconfig-simple-perl libipc-run-perl liblwp-protocol-https-perl libjson-xs-perl \
    libclass-accessor-perl libtemplate-perl libfile-slurp-perl libgetopt-long-descriptive-perl \
    libgraph-perl libconvert-pem-perl libcrypt-openssl-rsa-perl libjson-perl liblist-moreutils-perl \
    libparse-yapp-perl libdevel-stacktrace-perl cpanminus libgdchart-gd2-xpm-dev\
    libmoose-perl liblingua-en-inflect-perl libobject-tiny-perl libexception-class-perl libjson-rpc-perl libdatetime-perl \
      systemd && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.19.0/tini && \
    echo "93dcc18adc78c65a028a84799ecf8ad40c936fdfc5f2a57b1acda5a8117fa82c *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.a /usr/lib/
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

#RUN mkdir /root/.ssh
#RUN chmod 0600 /root/.ssh

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime && \
    dpkg-reconfigure tzdata && \
    sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs && \
    pam-auth-update --package

#ENTRYPOINT ["tini", "--"]
#CMD ["/bin/bash", "/entrypoint.sh"]

