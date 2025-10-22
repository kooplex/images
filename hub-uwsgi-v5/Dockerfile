FROM tiangolo/uwsgi-nginx
FROM base_ubuntu20-v5

#COPY --from=0 /tmp/requirements.txt /tmp/requirements.txt 

COPY --from=0 /entrypoint.sh /entrypoint.sh

# Copy start.sh script that will check for a /app/prestart.sh script and run it before starting the app
COPY --from=0 /start.sh /start.sh

#COPY --from=0 /install-nginx-debian.sh /install-nginx-debian.sh
ADD etc/install-nginx-debian.sh /install-nginx-debian.sh
RUN bash /install-nginx-debian.sh

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    python3.8 python3-pip libpython3-dev gcc &&\
    rm -rf /var/lib/apt/lists/*
RUN pip3 install --no-cache-dir uwsgi==2.0.20
RUN rm /etc/nginx/conf.d/default.conf


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                gcc cron supervisor\
                gettext \
                libmysqlclient-dev \
                vim less libssl-dev \
                ssh git mysql-client\
                python3-pip python3-dev && \
    rm -rf /var/lib/apt/lists/*

ENV DJANGO_VERSION 3.2.5

# Custom Supervisord config
COPY --from=0 /etc/supervisor/conf.d/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Copy stop-supervisor.sh to kill the supervisor and substasks on app failure
#COPY stop-supervisor.sh /etc/supervisor/stop-supervisor.sh
#RUN chmod +x /etc/supervisor/stop-supervisor.sh

# By default, run 2 processes
ENV UWSGI_CHEAPER 2

# By default, when on demand, run up to 16 processes
ENV UWSGI_PROCESSES 16

# By default, allow unlimited file sizes, modify it to limit the file sizes
# To have a maximum of 1 MB (Nginx's default) change the line to:
# ENV NGINX_MAX_UPLOAD 1m
ENV NGINX_MAX_UPLOAD 0

# By default, Nginx will run a single worker process, setting it to auto
# will create a worker for each CPU core
ENV NGINX_WORKER_PROCESSES 1

# By default, Nginx listens on port 80.
# To modify this, change LISTEN_PORT environment variable.
# (in a Dockerfile or with an option for `docker run`)
ENV LISTEN_PORT 80


# Copy the entrypoint that will generate Nginx additional configs

RUN pip3 install --upgrade pip
RUN pip3 install setuptools
RUN pip3 install mysqlclient netaddr ldap3 pwgen unidecode pandas kubernetes parse \
   django-threadlocals django=="$DJANGO_VERSION" \
   django-tables2 django-bootstrap-v5 django_pandas django-bootstrap5 \
   "python-social-auth[django]" "social-auth-core[openidconnect]" social-auth-app-django social-auth-core \
   django-celery-beat redis python-jose==3.3.0 django-taggit channels["daphne"]

#RUN pip3 install  debugpy==1.5.1 #git+https://github.com/arount/pytea
RUN ln -s /usr/local/bin/pip3.8 /usr/bin/pip3.8

EXPOSE 80

ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/entrypoint.sh"]

