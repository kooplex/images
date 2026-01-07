from rocker/rstudio:3.6.3-ubuntu18.04
#FROM base_ubuntu20-v4.0

USER root
# configure apt frontent
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
      wget \
      bzip2 \
      ca-certificates \
      sudo vim \
      locales nfs-common acl nfs4-acl-tools tzdata \
      libnss-ldapd \
      openldap-utils \
      ldap-client \
      libldap2-dev \
      systemd \
      liblapack-dev libblas-dev \
      gfortran libfreetype6* pkg-config \
      git gcc mpi-default-dev mpi-default-bin libfftw3-dev fftw3 cmake \
      nginx \
      autoconf libncurses5-dev libncursesw5-dev zlib1g-dev libbz2-dev liblzma-dev apt-rdepends \
      libfontconfig1 libxrender1 libxrender-dev \
       libicu-dev libxml2-dev \
      libscalapack-mpi-dev \
      texlive-xetex texlive-lang-european texlive-science default-libmysqlclient-dev\
      python3-dev libpq-dev \
      liblapack-dev liblapack-doc  liblapack-pic liblapack-test liblapacke liblapacke-dev libtmglib-dev libtmglib3 libblas3 libblas-dev libblasr libblasr-dev libblas-test \
      less gzip zlib1g-dev libpng-dev\
      make gcc ssh python3-dev libpq-dev cutadapt \
      rsync snakemake \
      autoconf automake libtool zlib1g-dev \
      libnlopt-dev \
      openjdk-8-source openjdk-8-jre \
      libglpk-dev \
      libcairo2-dev libudunits2-dev libgdal-dev libgeos-dev libproj-dev r-base \
      libharfbuzz-dev libfribidi-dev curl \
      libreadline-dev libx11-dev xorg-dev \
      libcurl4-openssl-dev libxml2-dev\ 
      r-cran-xml libsqlite3-mod-spatialite \
      libpq-dev  &&\
    rm -rf /var/lib/apt/lists/*

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
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list &&\
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


RUN ln -s /usr/include/locale.h  /usr/include/xlocale.h && \
    wget https://github.com/unicode-org/icu/archive/release-58-3.tar.gz &&\
    tar xf release-58-3.tar.gz &&\
    cd icu-release-58-3/icu4c/source/ &&\
    ./configure &&  make -j4 install

RUN wget https://cran.rstudio.com/src/base/R-4/R-4.2.1.tar.gz &&\
    tar xf R-4.2.1.tar.gz && cd R-4.2.1 &&\
    ./configure --with-pcre1 --enable-R-shlib &&  make -j4 && make install

RUN apt-get update && \
    apt-get install -yq --no-install-recommends libcurl4-gnutls-dev &&\
    rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages('devtools', repos='http://cran.us.r-project.org'); library(devtools)" 
RUN R -e 'devtools::install_github("cran/FField");library(FField)'
RUN R -e 'devtools::install_github("HenrikBengtsson/matrixStats"); library(matrixStats)'
RUN R -e "install.packages(c('BiocManager'))"

RUN R -e 'devtools::install_version("RPostgreSQL", version="0.7-4", repos="http://cran.us.r-project.org"); library(RPostgreSQL)'
RUN R -e 'devtools::install_version("XML", version="3.99-0.11", repos="http://cran.us.r-project.org")' && R -e 'library(XML)'
RUN R -e 'devtools::install_github("solymosin/RpostGIS")' && R -e ' library(RpostGIS)'

RUN R -e 'devtools::install_version("RCurl", version="1.98-1.8", repos="http://cran.us.r-project.org")' && R -e 'library(RCurl)'
RUN R -e "BiocManager::install(c('GenVisR','edgeR','qvalue','phyloseq'))"  && R -e "library(GenVisR);library(edgeR);library(qvalue);library(phyloseq)"

RUN R -e "BiocManager::install(c('DESeq2','microbiome'))"
RUN R -e "install.packages(c('RCurl'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('GenomeInfoDb','Biostrings'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('GenomicRanges','KEGGREST'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('DelayedArray','SummarizedExperiment'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('BiocManager','Cairo', 'sf', 'genefilter','permute','lattice','ggnewscale','markdown','tidyverse','phyloseq','pdftools','shinydashboard','plotly','ggplot2','DT','rsconnect','shinythemes','data.table','stringr','readxl','umap','ggfortify','heatmap3','dplyr','lme4','car','optimx','ggthemes','gridExtra','cowplot','htmltools','fastmap', 'shinyWidgets'), repos='http://cran.us.r-project.org')"

RUN apt-get update && \
    apt-get install -yq --no-install-recommends libproj-dev &&\
    rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages(c('rgdal','tmap','tmaptools','raster'), repos='http://cran.us.r-project.org')"
RUN R -e 'BiocManager::install("ShortRead")' && R -e 'library(ShortRead)'
RUN R -e "install.packages(c('fields','spdep','SpatialEpi','weathermetrics','spsurvey'), repos='http://cran.us.r-project.org')"
RUN apt-get update && \
    apt-get install -yq --no-install-recommends libgsl23 lzma liblzma-dev libpoppler-cpp-dev &&\
    rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('highcharter','shinybusy','shinyBS','pool','ggrepel','shinycssloaders','SwimmeR'),repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('config','DBI', 'lubridate','ISOweek','NGLVieweR', 'RColorBrewer','jsTreeR'),repos='http://cran.us.r-project.org')"
RUN R -e 'devtools::install_github("hadley/devtools"); devtools::install_github("gadenbuie/shinyThings")'
RUN apt-get update && \
    apt-get install -yq --no-install-recommends libv8-dev libjq-dev &&\
    rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages(c('ggiraph','geojsonio','leaflet','magrittr'), repos='http://cran.us.r-project.org')"
RUN apt-get update && \
    apt-get install -yq --no-install-recommends protobuf-compiler unixodbc unixodbc-dev odbc-postgresql libsqliteodbc r-cran-rjava &&\
    rm -rf /var/lib/apt/lists/*
RUN R -e "install.packages(c('protolite'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('geojsonio'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('ncdf4'), repos='http://cran.us.r-project.org')"

RUN rm /usr/share/keyrings/kubernetes-archive-keyring.gpg /etc/apt/sources.list.d/kubernetes.list &&\
    apt-get update && \
    apt-get install -yq --no-install-recommends tcsh gawk &&\
    rm -rf /var/lib/apt/lists/*

########## add the rest
# Install LDAP and setup authentication

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.a /usr/lib/
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

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
