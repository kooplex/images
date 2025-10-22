FROM giovtorres/slurm-docker-cluster 
#FROM csniper/slurm:23.11-deb
#FROM mmayer123/slurm-docker-cluster:2024.04.0-daily-456.pro1-slurm-23.11.3-1-jammy
#FROM nathanhess/slurm:full-root

RUN sed -i 's|^mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's|^#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo && \
    yum clean all && yum makecache

RUN yum install -y mailx sendmail nss-pam-ldapd.x86_64

#ENV DEBIAN_FRONTEND noninteractive
#
#RUN apt-get update && \
#    apt-get install -yq --no-install-recommends \
#mailutils sendmail \
# libnss-ldapd openldap-utils ldap-client libldap2-dev &&\
# apt-get clean && rm -rf /var/lib/apt/lists/*

#RUN groupadd nslcd &&  sed -i -e "s,passwd.*,passwd: ldap compat systemd," -e "s,group.*,group: ldap compat systemd," /etc/nsswitch.conf
COPY etc/docker-entrypoint.sh /entrypoint.sh
COPY etc/register_cluster.sh /register_cluster.sh
RUN chmod a+x /entrypoint.sh

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime
# CMD ["slurmctld"]
#ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/entrypoint.sh"]

