FROM ubuntu:24.10

MAINTAINER Kooplex Team <kooplex@complex.elte.hu>

USER root

# configure apt frontent
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    vim python3.12 python3-pip git curl postgresql-client-16 gcc libpython3-dev libpq-dev locales tini && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime && \
    dpkg-reconfigure tzdata

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

ENV PATH $PATH:/root/.local/bin:/usr/lib/postgresql/16/bin/

RUN uv venv /opt/python-packages
RUN . /opt/python-packages/bin/activate && uv pip install django==3.2.13 django-cors-headers bio psycopg2

EXPOSE 8080
RUN echo "\n. /opt/python-packages/bin/activate \n cd /srv/" >> /root/.bashrc

ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT ["tini", "--"]
CMD ["/bin/bash", "/entrypoint.sh"]

