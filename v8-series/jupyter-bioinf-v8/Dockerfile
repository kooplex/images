FROM base-bioinf_ubuntu24-v8

RUN $CONDA_DIR/bin/conda update jupyter 

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    texlive-formats-extra texlive-plain-generic \
    libconfig-simple-perl libipc-run-perl liblwp-protocol-https-perl libjson-xs-perl \
    libclass-accessor-perl libtemplate-perl libfile-slurp-perl libgetopt-long-descriptive-perl \
    libgraph-perl libconvert-pem-perl libcrypt-openssl-rsa-perl libjson-perl liblist-moreutils-perl \
    libparse-yapp-perl libdevel-stacktrace-perl cpanminus libgdchart-gd2-xpm-dev\
    pandoc \
    libmoose-perl liblingua-en-inflect-perl libobject-tiny-perl libexception-class-perl libjson-rpc-perl libdatetime-perl && \
   wget https://github.com/TheSEED/RASTtk-Distribution/releases/download/v1.3.0/rasttk-v1.3.0.deb && dpkg -i rasttk-v1.3.0.deb && apt-get install -f && rm rasttk-v1.3.0.deb && \
    rm -rf /var/lib/apt/lists/*

# Prerequisites for Bakta
RUN conda create -n baktaenv -y -c conda-forge -c bioconda python blast hmmer libcurl ncbi-amrfinderplus infernal=1.1.2 && $CONDA_DIR/bin/conda clean -y --all
RUN activate baktaenv && pip install pyrodigal bakta deepsig-biocomp 
RUN rm /opt/conda/envs/baktaenv/bin/cmscan

# These are already in the bitools attachment
#RUN wget --no-check-certificate http://trna.ucsc.edu/software/trnascan-se-2.0.12.tar.gz && \
#    tar -xf trnascan-se-2.0.12.tar.gz && cd tRNAscan-SE-2.0/ && ./configure  && make && make install && \
#    cd ../ && rm -r tRNAscan-SE-2.0/ trnascan-se-2.0.12.tar.gz
#RUN wget http://www.trna.se/ARAGORN/Downloads/aragorn1.2.41.c && gcc -O3 -ffast-math -finline-functions -o aragorn aragorn1.2.41.c && \
#    cp aragorn /usr/local/bin && rm aragorn1.2.41.c
#RUN wget http://www.drive5.com/pilercr/pilercr1.06.tar.gz && tar xf pilercr1.06.tar.gz && cd pilercr1.06  make && cp pilercr /usr/local/bin/ && \
#    rm -r pilercr*
#RUN wget http://github.com/bbuchfink/diamond/releases/download/v2.1.8/diamond-linux64.tar.gz && tar xzf diamond-linux64.tar.gz && \
#    mv diamond /usr/local/bin/ && rm diamond-linux64.tar.gz
#	./diamond makedb --in reference.fasta -d reference
#RUN wget http://eddylab.org/infernal/infernal-1.1.4.tar.gz && tar xf infernal-1.1.4.tar.gz && \
#    cd  infernal-1.1.4 && ./configure && make && make install

RUN rm /opt/conda/lib/libzip.so && ln -s /usr/lib/jvm/java-17-openjdk-amd64/lib/libzip.so /opt/conda/lib/libzip.so

RUN pip3 install jinja2==3.0.1

# IF snakemake version 8 or higher is needen than we need to install it with other then apt
#RUN apt-get remove -y snakemake
#RUN pip install  snakemake==v8.5.2

## Install mafft https://mafft.cbrc.jp/alignment/software/source.html
#ENV MAFFT_VER mafft-7.490
#ENV MAFFT_DIR mafft-7.490-with-extensions
#RUN wget https://mafft.cbrc.jp/alignment/software/${MAFFT_DIR}-src.tgz && \
#    gunzip -cd  ${MAFFT_DIR}-src.tgz| tar xfv - && \
#    cd ${MAFFT_DIR}/core/ && \
#    make install  &&   cd ../extensions/ && make install 
    


ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
RUN chmod a+x /usr/local/bin/runjupyter.sh /entrypoint.sh 
#ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
	libzip-dev &&\
    rm -rf /var/lib/apt/lists/*
RUN conda install -y zip
RUN pip install psycopg2 
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
	openjdk-17-jre openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

RUN $CONDA_DIR/bin/conda clean -y --all
WORKDIR /


