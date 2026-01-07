FROM jupyter-basic-v8


RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    r-base r-base-dev
    
RUN R -e 'install.packages("IRkernel")' 
RUN R -e 'IRkernel::installspec(user = FALSE)' 
RUN jupyter labextension install @techrah/text-shortcuts  # for RStudio’s shortcuts
WORKDIR /




