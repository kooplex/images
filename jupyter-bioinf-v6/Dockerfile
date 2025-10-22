FROM base-bioinf_ubuntu20-v6

RUN $CONDA_DIR/bin/conda update jupyter 

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    texlive-formats-extra texlive-plain-generic \
    libconfig-simple-perl libipc-run-perl liblwp-protocol-https-perl libjson-xs-perl \
    libclass-accessor-perl libtemplate-perl libfile-slurp-perl libgetopt-long-descriptive-perl \
    libgraph-perl libconvert-pem-perl libcrypt-openssl-rsa-perl libjson-perl liblist-moreutils-perl \
    libparse-yapp-perl libdevel-stacktrace-perl cpanminus libgdchart-gd2-xpm-dev\
    texlive texlive-latex-extra pandoc  \
    libmoose-perl liblingua-en-inflect-perl libobject-tiny-perl libexception-class-perl libjson-rpc-perl libdatetime-perl && \
   wget https://github.com/TheSEED/RASTtk-Distribution/releases/download/v1.3.0/rasttk-v1.3.0.deb && dpkg -i rasttk-v1.3.0.deb && apt-get install -f && rm rasttk-v1.3.0.deb && \
    rm -rf /var/lib/apt/lists/*

# Prerequisites for Bakta
RUN conda create -n baktaenv -y -c conda-forge -c bioconda python blast hmmer libcurl ncbi-amrfinderplus infernal=1.1.2
RUN activate baktaenv && pip install pyrodigal bakta deepsig-biocomp 
RUN rm /opt/conda/envs/baktaenv/bin/cmscan
RUN wget http://trna.ucsc.edu/software/trnascan-se-2.0.12.tar.gz --no-check-certificate && \
    tar -xf trnascan-se-2.0.12.tar.gz && cd tRNAscan-SE-2.0/ && ./configure  && make && make install && \
    cd ../ && rm -r tRNAscan-SE-2.0/ trnascan-se-2.0.12.tar.gz
#RUN wget http://www.ansikte.se/ARAGORN/Downloads/aragorn1.2.41.c && gcc -O3 -ffast-math -finline-functions -o aragorn aragorn1.2.41.c && \
#    cp aragorn /usr/local/bin && rm aragorn1.2.41.c
#RUN wget http://www.drive5.com/pilercr/pilercr1.06.tar.gz && tar xf pilercr1.06.tar.gz && cd pilercr1.06  make && cp pilercr /usr/local/bin/ && \
#    rm -r pilercr*

RUN wget http://github.com/bbuchfink/diamond/releases/download/v2.1.8/diamond-linux64.tar.gz && tar xzf diamond-linux64.tar.gz && \
    mv diamond /usr/local/bin/ && rm diamond-linux64.tar.gz
#	./diamond makedb --in reference.fasta -d reference

RUN wget http://eddylab.org/infernal/infernal-1.1.4.tar.gz && tar xf infernal-1.1.4.tar.gz && \
    cd  infernal-1.1.4 && ./configure && make && make install

RUN rm /opt/conda/lib/libzip.so && ln -s /usr/lib/jvm/java-17-openjdk-amd64/lib/libzip.so /opt/conda/lib/libzip.so

RUN pip3 install jinja2==3.0.1

RUN conda install -y -c bioconda bowtie2 
RUN wget https://genome-test.gi.ucsc.edu/~kent/src/blatSrc37.zip && unzip blatSrc37.zip && cd blatSrc && mkdir /opt/blat/bin/x86_64 &&  HOME=/opt/blat make



RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh 
WORKDIR /


