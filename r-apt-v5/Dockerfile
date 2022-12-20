from rocker/shiny-verse

USER root
# configure apt frontend
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
      wget sudo vim \
      nfs-common acl nfs4-acl-tools libnss-ldapd  openldap-utils ldap-client libldap2-dev \
      systemd tzdata \
      git mpi-default-dev mpi-default-bin libfftw3-dev fftw3 cmake \
      nginx \
      libncurses5-dev libncursesw5-dev zlib1g-dev libbz2-dev apt-rdepends \
      libscalapack-mpi-dev \
      texlive-xetex texlive-lang-european texlive-science \
      liblapack-doc  liblapack-pic liblapack-test liblapacke liblapacke-dev libtmglib-dev libtmglib3 libblasr libblasr-dev libblas-test \
      less zlib1g-dev curl \
      ssh python3-dev cutadapt \
      rsync snakemake \
      libtool zlib1g-dev \
      libnlopt-dev \
      openjdk-8-source openjdk-8-jre \
      libglpk-dev \
      libudunits2-dev libgdal-dev libgeos-dev libproj-dev r-base \
      libreadline-dev xorg-dev \
      r-cran-xml libsqlite3-mod-spatialite \
      libproj-dev libgsl23 \ 
      libpq-dev  &&\
    rm -rf /var/lib/apt/lists/*


# libcurl4-gnutls-dev 

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.19.0/tini && \
    echo "93dcc18adc78c65a028a84799ecf8ad40c936fdfc5f2a57b1acda5a8117fa82c *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

#ADD etc/apt_package_list /tmp/apt_package_list
#RUN apt update && dpkg --set-selections < /tmp/apt_package_list &&\
# apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_14.x |  bash - && \
    apt install --yes nodejs 

# Install kubectl
RUN curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg &&\
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list &&\
    apt update && apt install -y kubectl &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*


WORKDIR /opt

# conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Create conda dir
RUN mkdir -p $CONDA_DIR

# Install conda
RUN cd /tmp && \
    mkdir -p $CONDA_DIR && \
    ANACONDA="Anaconda3-2021.11-Linux-x86_64.sh" && \
    wget --quiet https://repo.anaconda.com/archive/${ANACONDA} && \
    #FIXME: check sum
    /bin/bash ${ANACONDA} -f -b -p $CONDA_DIR && \
    rm ${ANACONDA} && $CONDA_DIR/bin/conda clean --yes --all

RUN $CONDA_DIR/bin/conda update -y conda
RUN pip install pymysql pymssql psycopg2 pyvcf multiqc pymonetdb

RUN $CONDA_DIR/bin/pip install kubernetes

RUN ln -s /usr/include/locale.h  /usr/include/xlocale.h && \
    wget https://github.com/unicode-org/icu/archive/release-58-3.tar.gz &&\
    tar xf release-58-3.tar.gz &&\
    cd icu-release-58-3/icu4c/source/ &&\
    ./configure &&  make -j4 install

#RUN wget https://cran.rstudio.com/src/base/R-4/R-4.2.1.tar.gz &&\
#    tar xf R-4.2.1.tar.gz && cd R-4.2.1 &&\
#    ./configure --with-pcre1 --enable-R-shlib &&  make -j4 && make install


RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.a /usr/lib/
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

ADD etc/entrypoint-rstudio.sh /entrypoint.sh
ADD etc/rstudio-login.html /etc/rstudio/login.html
ADD etc/rstudio-user-settings /etc/rstudio/user-settings
RUN chmod a-w /etc/rstudio/login.html

#Meg valamit ezzel is kezdeni kell /var/run/s6/services/rstudio/run

ADD etc/rstudio-rserver.conf /etc/rstudio/rserver.conf
ADD etc/rstudio-rsession.conf /etc/rstudio/rsession.conf

ADD etc/rstudio-nginx.conf /etc/nginx/sites-enabled/

#ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png

#RUN mkdir /root/.ssh
#RUN chmod 0600 /root/.ssh

ADD etc/entrypoint-rstudio.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime && \
    dpkg-reconfigure tzdata && \
    sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs && \
    pam-auth-update --package

WORKDIR /


#ENTRYPOINT ["tini", "--"]
#CMD ["/bin/bash", "/entrypoint.sh"]
