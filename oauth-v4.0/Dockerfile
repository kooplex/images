#FROM k8plex-base
FROM base_ubuntu20-v4.0


RUN apt-get update && apt-get install -y \
                gettext \
                mysql-client libmysqlclient-dev \
                vim less libssl-dev \
                tzdata gcc \
                python3-pip python3-dev \
                libssl-dev libsasl2-dev libxmlsec1 xmlsec1 \
        --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV DJANGO_VERSION 3.1.5

RUN pip3 install --upgrade pip &&  pip3 install setuptools wheel 

ADD etc/requirements.txt /tmp/requirements.txt
RUN pip3 download -r /tmp/requirements.txt -d /opt &&  pip3 install -r /tmp/requirements.txt --find-links=/opt


#RUN pip3 install --upgriade pip &&  pip3 install setuptools wheel \
#    &&  pip3 install django=="$DJANGO_VERSION" django-oauth-toolkit django-allauth django-cors-middleware \
#    mysqlclient ldap3 pwgen django-tables2 django-bootstrap3 unidecode \
#    pandas django_pandas djangosaml2 && \
#    ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime && dpkg-reconfigure tzdata
#
#RUN pip3 install importlib-metadata typing-extensions

EXPOSE 80


ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/entrypoint.sh"]

