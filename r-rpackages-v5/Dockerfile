from rocker/rstudio:3.6.3-ubuntu18.04

RUN R -e "install.packages(c('BiocManager','devtools'), repos='http://cran.us.r-project.org')  && R -e  library(devtools)" 
RUN R -e 'devtools::install_github("cran/FField")  && R -e library(FField)'
RUN R -e 'devtools::install_github("HenrikBengtsson/matrixStats")  && R -e  library(matrixStats)'

RUN R -e 'devtools::install_version("RPostgreSQL", version="0.7-4", repos="http://cran.us.r-project.org"); library(RPostgreSQL)'
RUN R -e 'devtools::install_version("XML", version="3.99-0.11", repos="http://cran.us.r-project.org")' && R -e 'library(XML)'
RUN R -e 'devtools::install_github("solymosin/RpostGIS")' && R -e ' library(RpostGIS)'

RUN R -e 'devtools::install_version("RCurl", version="1.98-1.8", repos="http://cran.us.r-project.org")' && R -e 'library(RCurl)'

RUN R -e "install.packages(c('GenomeInfoDb','Biostrings','DelayedArray','SummarizedExperiment','GenomicRanges','KEGGREST'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('Cairo', 'sf', 'genefilter','permute','lattice','ggnewscale','markdown','tidyverse','pdftools','shinydashboard','plotly','ggplot2','DT','rsconnect','shinythemes','data.table','stringr','readxl','umap','ggfortify','heatmap3','dplyr','lme4','car','optimx','ggthemes','gridExtra','cowplot','htmltools','fastmap', 'shinyWidgets'), repos='http://cran.us.r-project.org')"

RUN R -e "install.packages(c('rgdal','tmap','tmaptools','raster'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('fields','spdep','SpatialEpi','weathermetrics','spsurvey'), repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('highcharter','shinybusy','shinyBS','pool','ggrepel','shinycssloaders','SwimmeR'),repos='http://cran.us.r-project.org')"
RUN R -e "install.packages(c('config','DBI', 'lubridate','ISOweek','NGLVieweR', 'RColorBrewer','jsTreeR'),repos='http://cran.us.r-project.org')"

RUN R -e "BiocManager::install(c('DESeq2','microbiome','GenVisR','edgeR','qvalue','phyloseq'))"  && R -e "library(GenVisR);library(edgeR);library(qvalue);library(phyloseq)"
RUN R -e 'BiocManager::install("ShortRead")' && R -e 'library(ShortRead)'
RUN R -e 'devtools::install_github("hadley/devtools"); devtools::install_github("gadenbuie/shinyThings")'

