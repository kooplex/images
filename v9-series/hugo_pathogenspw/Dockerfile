FROM base-teleportv14.3.21_ubuntu24
FROM base_ubuntu24-v8

RUN sed -i -e 's/archive.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources
RUN sed -i -e 's/security.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources
RUN apt update && apt install -y hugo netcat-traditional &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* 

COPY --from=0 /usr/local/bin/teleport /usr/local/bin/teleport

WORKDIR /opt

# Pathogens Portal code
#RUN git clone https://github.com/csabaiBio/pathogens-portal-hu.git
WORKDIR /opt/pathogens-portal-hu

ADD etc/entrypoint.sh /entrypoint.sh
ADD etc/check_repo_change.sh /usr/bin/check_repo_change.sh
RUN chmod a+x /entrypoint.sh /usr/bin/check_repo_change.sh

CMD ["/bin/bash", "/entrypoint.sh"]
 
