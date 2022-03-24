FROM ubuntu:focal

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
      locales nfs-common acl nfs4-acl-tools tzdata \
      libnss-ldapd \
      openldap-utils \
      ldap-client \
      libldap2-dev \
      systemd && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.19.0/tini && \
    echo "93dcc18adc78c65a028a84799ecf8ad40c936fdfc5f2a57b1acda5a8117fa82c *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

# FIXME: to cm; Install LDAP and setup authentication
#RUN mkdir /etc/mnt
#RUN sed -i -e "s,passwd.*,passwd: ldap compat systemd," -e "s,group.*,group: ldap compat systemd," /etc/nsswitch.conf

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.a /usr/lib/
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

# FIXME: to cm;
#RUN mkdir /init
#ADD etc/01-nslcd /init/01-nslcd
#RUN chmod +x /init/01-nslcd
ADD etc/entrypoint.sh /entrypoint.sh

RUN mkdir /root/.ssh
RUN chmod 0600 /root/.ssh

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime && \
    dpkg-reconfigure tzdata && \
    sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs && \
    pam-auth-update --package

ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/entrypoint.sh"]

