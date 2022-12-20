FROM giovtorres/slurm-docker-cluster 

RUN yum install -y mailx sendmail nss-pam-ldapd.x86_64
#RUN groupadd nslcd &&  sed -i -e "s,passwd.*,passwd: ldap compat systemd," -e "s,group.*,group: ldap compat systemd," /etc/nsswitch.conf
COPY etc/docker-entrypoint.sh /entrypoint.sh
COPY etc/register_cluster.sh /register_cluster.sh
RUN chmod a+x /entrypoint.sh

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime
# CMD ["slurmctld"]
#ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/entrypoint.sh"]

