FROM base_ubuntu20-v5

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                gcc cron \
                gettext \
                libmysqlclient-dev \
                vim less libssl-dev \
                ssh git mysql-client pkg-config\
                python3-pip python3-dev && \
    rm -rf /var/lib/apt/lists/*

ENV DJANGO_VERSION 3.2.5

RUN pip3 install --upgrade pip
RUN pip3 install setuptools
RUN pip3 install mysqlclient netaddr ldap3 pwgen unidecode pandas kubernetes parse \
   django-threadlocals django=="$DJANGO_VERSION" \
   "django-tables2==2.4.1" "django-bootstrap-v5==1.0.11" "django_pandas==0.6.6" "django-bootstrap5==21.3" \
   "python-social-auth[django]" "social-auth-core[openidconnect]" "social-auth-app-django==5.0.0" social-auth-core

RUN pip3 install  debugpy==1.5.1 #git+https://github.com/arount/pytea
RUN ln -s /usr/local/bin/pip3.8 /usr/bin/pip3.8
RUN pip3 install django-celery-beat redis django-taggit Pillow
RUN pip3 install -U channels["daphne"]
RUN pip3 install plotly kaleido jsonfield


EXPOSE 80

ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/entrypoint.sh"]

