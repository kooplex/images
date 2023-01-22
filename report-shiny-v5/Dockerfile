FROM rocker/shiny-verse:latest

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


RUN R -e "install.packages(c('BiocManager','devtools'), repos='http://cran.us.r-project.org')"  && R -e  "library(devtools)" 
RUN R -e 'devtools::install_github("cran/FField")'  && R -e 'library(FField)'
RUN R -e 'devtools::install_github("HenrikBengtsson/matrixStats")'  && R -e  'library(matrixStats)'

RUN R -e 'devtools::install_version("RPostgreSQL", version="0.7-4", repos="http://cran.us.r-project.org")' && R -e 'library(RPostgreSQL)'
RUN R -e 'devtools::install_version("XML", version="3.99-0.11", repos="http://cran.us.r-project.org")' && R -e 'library(XML)'
RUN R -e 'devtools::install_github("solymosin/RpostGIS")' && R -e ' library(RpostGIS)'

RUN R -e 'devtools::install_version("RCurl", version="1.98-1.8", repos="http://cran.us.r-project.org")' && R -e 'library(RCurl)'

RUN R -e "install.packages(c('GenomeInfoDb','Biostrings','DelayedArray','SummarizedExperiment','GenomicRanges','KEGGREST'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('Cairo', 'sf', 'genefilter','permute','lattice','ggnewscale','markdown','tidyverse','pdftools','shinydashboard','plotly','ggplot2','DT','rsconnect','shinythemes','data.table','stringr','readxl','umap','ggfortify','heatmap3','dplyr','lme4','car','optimx','ggthemes','gridExtra','cowplot','htmltools','fastmap', 'shinyWidgets'), repos='http://cran.us.r-project.org')"

RUN R -e "install.packages(c('rgdal','tmap','tmaptools','raster'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('fields','spdep','SpatialEpi','weathermetrics','spsurvey'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('highcharter','shinybusy','shinyBS','pool','ggrepel','shinycssloaders','SwimmeR'),repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('config','DBI', 'lubridate','ISOweek','NGLVieweR', 'RColorBrewer','jsTreeR'),repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('ggiraph'), repos='http://cran.us.r-project.org')"

RUN R -e "BiocManager::install(c('DESeq2','microbiome','GenVisR','edgeR','qvalue','phyloseq'))"  && R -e "library(GenVisR);library(edgeR);library(qvalue);library(phyloseq)"
RUN R -e 'BiocManager::install("ShortRead")' && R -e 'library(ShortRead)'
RUN R -e 'devtools::install_github("hadley/devtools"); devtools::install_github("gadenbuie/shinyThings")'

COPY etc/shiny-customized.config-template /etc/shiny-server/shiny-server.conf
#ADD index.html /srv/shiny-server/index.html

WORKDIR /srv/report

ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh 

WORKDIR /


