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
      systemd && \
    rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.19.0/tini && \
    echo "93dcc18adc78c65a028a84799ecf8ad40c936fdfc5f2a57b1acda5a8117fa82c *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

RUN apt update && apt install -y tmux curl curlftpfs \
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
 openjdk-8-source openjdk-8-jre &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

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
RUN pip install pymysql pymssql psycopg2
#RUN $CONDA_DIR/bin/pip install mysqlclient pymssql psycopg2 pymonetdb

RUN R -e "install.packages(c('pdftools','shinydashboard','plotly','ggplot2','DT','rsconnect','shinythemes','data.table','stringr','readxl','umap','ggfortify','heatmap3','dplyr','lme4','car','optimx','ggthemes','gridExtra','cowplot','htmltools','fastmap', 'shinyWidgets'),repos='http://cran.us.r-project.org')"
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install(c('GenVisR','edgeR','qvalue','phyloseq'))"

#RUN R -e "update.packages(ask=FALSE)"
#RUN R -e 'install.packages("digest")'

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    libglpk-dev &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN R -e "BiocManager::install(c('phyloseq'))"
#ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png

RUN R -e "install.packages('tidyverse')"

RUN $CONDA_DIR/bin/pip install    pyvcf multiqc pymonetdb
#RUN $CONDA_DIR/bin/pip install --ignore-installed  kubernetes
RUN $CONDA_DIR/bin/pip install kubernetes
RUN apt-get update &&\
    apt-get install -yq --no-install-recommends \
    libcairo2-dev libudunits2-dev libgdal-dev libgeos-dev libproj-dev r-base \
    libharfbuzz-dev libfribidi-dev &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

#RUN R -e "install.packages(c('BiocManager','Cairo','RpostGIS', 'sf', 'genefilter','microbiome','permute','lattice','ggnewscale','DESeq2','markdown','tidyverse','phyloseq','pdftools','shinydashboard','plotly','ggplot2','DT','rsconnect','shinythemes','data.table','stringr','readxl','umap','ggfortify','heatmap3','dplyr','lme4','car','optimx','ggthemes','gridExtra','cowplot','htmltools','fastmap', 'shinyWidgets'),repos='http://cran.us.r-project.org')"
#RUN R -e 'devtools::install_github("cran/FField")'
#RUN R -e "BiocManager::install(c('GenVisR','edgeR','qvalue','phyloseq'))"

########## add the rest
#ADD init /init_scripts
#RUN chmod a+x /init_scripts/91-startsshagent.sh
# Install LDAP and setup authentication

#RUN mkdir /etc/mnt
#RUN sed -i -e "s,passwd.*,passwd: ldap compat systemd," -e "s,group.*,group: ldap compat systemd," /etc/nsswitch.conf

RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.a /usr/lib/
RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

#RUN mkdir /init
#ADD etc/01-nslcd /init/01-nslcd
#RUN chmod +x /init/01-nslcd
ADD etc/entrypoint-rstudio.sh /entrypoint.sh
ADD etc/rstudio-login.html /etc/rstudio/login.html
ADD etc/rstudio-user-settings /etc/rstudio/user-settings
RUN chmod a-w /etc/rstudio/login.html

#Meg valamit ezzel is kezdeni kell /var/run/s6/services/rstudio/run

ADD etc/rstudio-rserver.conf /etc/rstudio/rserver.conf
ADD etc/rstudio-rsession.conf /etc/rstudio/rsession.conf

ADD etc/rstudio-nginx.conf /etc/nginx/sites-enabled/

RUN mkdir /root/.ssh
RUN chmod 0600 /root/.ssh

ADD etc/entrypoint-rstudio.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime && \
    dpkg-reconfigure tzdata && \
    sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs && \
    pam-auth-update --package

WORKDIR /


#ENTRYPOINT ["tini", "--"]
#CMD ["/bin/bash", "/entrypoint.sh"]
