FROM base_ubuntu20-v4.0

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                gcc cron \
                gettext \
                libmysqlclient-dev \
                vim less libssl-dev \
                ssh git mysql-client\
                python3-pip python3-dev && \
    rm -rf /var/lib/apt/lists/*

ENV DJANGO_VERSION 3.2.5

RUN pip3 install --upgrade pip
RUN pip3 install setuptools
RUN pip3 install mysqlclient netaddr ldap3 pwgen unidecode pandas kubernetes parse \
   django-threadlocals django=="$DJANGO_VERSION" \
   django-tables2 django-bootstrap-v5 django_pandas django-bootstrap5 \
   "python-social-auth[django]" "social-auth-core[openidconnect]" social-auth-app-django social-auth-core

#RUN pip3 install  debugpy==1.5.1 #git+https://github.com/arount/pytea

#ADD etc/entrypoint.sh /entrypoint.sh
#RUN chmod a+x /entrypoint.sh

EXPOSE 80

