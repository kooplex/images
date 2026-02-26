FROM ubuntu:24.10

LABEL \
  org.opencontainers.image.title="uv-jupyter-base" \
  org.opencontainers.image.description="Ubuntu 24.10 base image with uv, JupyterLab, and common Python packages" \
  org.opencontainers.image.authors="Kooplex Team <kooplex@elte.hu>" \
  org.opencontainers.image.source="https://github.com/kooplex/images.git"

USER root

# configure apt frontent
RUN mkdir -p /var/cache/uv && chmod 1777 /var/cache/uv
ENV DEBIAN_FRONTEND=noninteractive \
    VENV_PATH=/opt/venv \
    UV_TOOL_BIN_DIR=/usr/local/bin \
    UV_CACHE_DIR=/var/cache/uv

RUN sed -i -e 's/archive.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources && \
    sed -i -e 's/security.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
       gnupg ca-certificates tini curl wget python3 python3-venv links2 netcat-openbsd \
       systemd locales tzdata libnss-ldapd openldap-utils \
       nfs-common acl nfs4-acl-tools \
       git vim less mc tmux bzip2 gzip unzip zip bc xxd ssh sshfs rsync \
       patch make automake pkg-config autoconf gcc g++ gfortran \
       python3-dev libpq-dev libmysqlclient-dev && \
    rm -rf /var/lib/apt/lists/*

#      ldap-client  libhdf5-dev \
#      libldap2-dev \
#    libconfig-simple-perl libipc-run-perl liblwp-protocol-https-perl libjson-xs-perl \
#    libclass-accessor-perl libtemplate-perl libfile-slurp-perl libgetopt-long-descriptive-perl \
#    libgraph-perl libconvert-pem-perl libcrypt-openssl-rsa-perl libjson-perl liblist-moreutils-perl \
#    libparse-yapp-perl libdevel-stacktrace-perl cpanminus libgdchart-gd2-xpm-dev\
#    libmoose-perl liblingua-en-inflect-perl libobject-tiny-perl libexception-class-perl libjson-rpc-perl libdatetime-perl \
# liblapack-dev libblas-dev \
# libfreetype6*  \
# mpi-default-dev mpi-default-bin libfftw3-dev cmake \
# libncurses5-dev libncursesw5-dev libbz2-dev liblzma-dev apt-rdepends \
# libfontconfig1 libxrender1 libxrender-dev  libxtst6 libxi6 libasound2-dev  libpci-dev \
# libicu-dev libxml2-dev \
# libscalapack-mpi-dev \
# texlive-xetex texlive-lang-european texlive-science texlive-plain-generic texlive-full texlive-latex-extra \
# python3-gdbm \
# liblapack-dev liblapack-doc  liblapack-test liblapacke liblapacke-dev libtmglib-dev libtmglib3 libblas3 libblas-dev libblasr-dev libblas-test \
# libpng-dev\
# cutadapt\
# at \
# snakemake libtool zlib1g-dev &&\

# Install uv, then place it somewhere standard
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    install -m 0755 /root/.local/bin/uv /usr/local/bin/uv && \
    rm -rf /root/.local

RUN uv venv ${VENV_PATH}
ENV PATH="${VENV_PATH}/bin:${PATH}"

# Reproducible install based on your lock
WORKDIR /tmp/app
COPY pyproject.toml uv.lock ./

# Force uv sync to use the active venv (/opt/venv)
RUN . ${VENV_PATH}/bin/activate && uv sync --frozen --no-dev --active


RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
#RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.19.0/tini && \
#    echo "93dcc18adc78c65a028a84799ecf8ad40c936fdfc5f2a57b1acda5a8117fa82c *tini" | sha256sum -c - && \
#    mv tini /usr/local/bin/tini && \
#    chmod +x /usr/local/bin/tini

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.a /usr/lib/
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime && \
    dpkg-reconfigure tzdata && \
    sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs && \
    pam-auth-update --package

# INSTALL NODEJS
ENV NODE_MAJOR=20
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | \
        gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | \
        tee /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        nodejs && \
    rm -rf /var/lib/apt/lists/*


#ENTRYPOINT ["tini", "--"]
#CMD ["/bin/bash", "/entrypoint.sh"]

# Jupyter specific settings and templates
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
ADD etc/kooplex-logo.png /tmp/kooplex-logo.png
RUN tt=`python --version | awk '{print $2}'`; echo $tt &&  ver=${tt%.*} &&  \
    mkdir -p /opt/conda/lib/python-${ver}/site-packages/notebook/static/base/images && \
    cp /tmp/kooplex-logo.png /opt/conda/lib/python-${ver}/site-packages/notebook/static/base/images/kooplex-logo.png && cp /tmp/kooplex-logo.png /opt/conda/lib/python-${ver}/site-packages/notebook/static/base/images/jupyterlab.png

ADD etc/runjupyter.sh /usr/local/bin/runjupyter.sh
ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /usr/local/bin/runjupyter.sh  /entrypoint.sh

