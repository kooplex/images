FROM base-extras_ubuntu20-v5

RUN    apt-get update && apt-get install -y bwa ant default-jdk cmake &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN $CONDA_DIR/bin/conda install -c anaconda xlrd

RUN $CONDA_DIR/bin/conda install -y -c bioconda \
    trinity \
    sra-tools \
    fastqc \
    parallel-fastq-dump

#RUN $CONDA_DIR/bin/conda install -y -c tmap tmap 
RUN $CONDA_DIR/bin/conda install -c conda-forge -y umap-learn mdanalysis

WORKDIR /opt
RUN wget https://github.com/CSB5/lofreq/raw/master/dist/lofreq_star-2.1.5_linux-x86-64.tgz && tar -xf lofreq_star-2.1.5_linux-x86-64.tgz
#RUN pip uninstall -y samtools


#RUN conda install -y -c ambermd pytraj
RUN git clone https://github.com/Amber-MD/pytraj --depth=1 
RUN    cd pytraj && echo "cat << EOF | python ./setup.py install \n\
y\n\
y\n\
EOF" > /tmp/fut && cat /tmp/fut && /bin/bash /tmp/fut

#RUN $CONDA_DIR/bin/conda install -y -c bioconda \
#    sra-tools 
#RUN $CONDA_DIR/bin/conda install -y -c bioconda \
#    fastqc 
#RUN $CONDA_DIR/bin/conda install -y -c bioconda \
#    parallel-fastq-dump


#RUN $CONDA_DIR/bin/conda install -y -c bioconda  megahit pyvcf multiqc
RUN $CONDA_DIR/bin/pip install  pyvcf multiqc faerun pdb2pqr sniffio testfixtures\
    biopython\
    pdb2pqr sniffio testfixtures

# faerun hack
#ADD faerun_patch /tmp/patch
ADD etc/faerun_web.py /opt/conda/lib/python3.8/site-packages/faerun/web.py

#Trimmomatic
RUN wget http://www.usadellab.org/cms/uploads/supplementary/Trimmomatic/Trimmomatic-0.39.zip &&\
    unzip Trimmomatic-0.39.zip

# SAMTOOLS
ENV SAMVER 1.12
ENV SAMTOOLS samtools-${SAMVER}
ENV BCFTOOLS bcftools-${SAMVER}
ENV HTSLIB htslib-${SAMVER}
RUN mkdir /opt/samtools && cd /opt/samtools/ &&\
    wget https://github.com/samtools/samtools/releases/download/${SAMVER}/${SAMTOOLS}.tar.bz2 &&\
    bunzip2 ${SAMTOOLS}.tar.bz2 && tar -xf ${SAMTOOLS}.tar && cd ${SAMTOOLS} && ./configure && make && make install &&\
    wget https://github.com/samtools/bcftools/releases/download/${SAMVER}/${BCFTOOLS}.tar.bz2 &&\
    bunzip2 ${BCFTOOLS}.tar.bz2 && tar -xf ${BCFTOOLS}.tar && cd ${BCFTOOLS} && ./configure && make && make install &&\
    wget https://github.com/samtools/htslib/releases/download/${SAMVER}/${HTSLIB}.tar.bz2 &&\
    bunzip2 ${HTSLIB}.tar.bz2 && tar -xf ${HTSLIB}.tar && cd ${HTSLIB} && ./configure && make && make install 

RUN mkdir /opt/abayesqr && cd /opt/abayesqr/ && wget https://github.com/SoYeonA/aBayesQR/archive/refs/heads/master.zip &&\
    unzip master.zip && cd aBayesQR-master/ && make 

RUN rm /etc/alternatives/java
RUN ln -s /usr/lib/jvm/java-8-openjdk-amd64/bin/java /etc/alternatives/java

RUN mkdir /opt/seqmonk && cd /opt/seqmonk && wget https://www.bioinformatics.babraham.ac.uk/projects/seqmonk/seqmonk_v1.48.0_linux64.tar.gz && \
    tar -xzf seqmonk_v1.48.0_linux64.tar.gz &&\
    ln -s SeqMonk/seqmonk /usr/local/bin/seqmonk

WORKDIR /opt
RUN wget https://github.com/FelixKrueger/TrimGalore/archive/refs/tags/0.6.6.tar.gz && tar -xf 0.6.6.tar.gz && ln  TrimGalore-0.6.6/trim_galore /opt/conda/bin/trim_galore
RUN wget https://jztkft.dl.sourceforge.net/project/bowtie-bio/bowtie2/2.4.5/bowtie2-2.4.5-linux-x86_64.zip && unzip bowtie2-2.4.5-linux-x86_64.zip
ENV PATH ${PATH}:/opt/bowtie2-2.4.5-linux-x86_64


#kraken2 kraken2: https://github.com/DerrickWood/kraken2/blob/master/docs/MANUAL.markdown
RUN git clone --depth 1 --branch v2.1.2 https://github.com/DerrickWood/kraken2.git && cd kraken2 && bash install_kraken2.sh /opt/kraken2_build
ENV PATH ${PATH}:/opt/kraken2_build

#SPAdes https://github.com/ablab/spades#sec2.1
RUN wget http://cab.spbu.ru/files/release3.15.3/SPAdes-3.15.3-Linux.tar.gz &&\
    tar -xzf SPAdes-3.15.3-Linux.tar.gz 
ENV PATH ${PATH}:/opt/SPAdes-3.15.3-Linux/bin/

#quast http://quast.sourceforge.net/docs/manual.html#sec1
RUN wget https://downloads.sourceforge.net/project/quast/quast-5.0.2.tar.gz &&\
    tar -xzf quast-5.0.2.tar.gz && \
    cd quast-5.0.2 && ./setup.py install_full

#edirect https://dataguide.nlm.nih.gov/edirect/install.html
RUN perl -MNet::FTP -e '$ftp = new Net::FTP("ftp.ncbi.nlm.nih.gov", Passive => 1); $ftp->login; $ftp->binary; $ftp->get("/entrez/entrezdirect/edirect.tar.gz");' &&\
    gunzip -c edirect.tar.gz | tar xf - &&\
    rm edirect.tar.gz 
#    cd edirect && ls && ./edirect/setup.sh
    #export PATH=$PATH:$HOME/edirect >& /dev/null || setenv PATH "${PATH}:$HOME/edirect"

#picard https://broadinstitute.github.io/picard/
RUN git clone --depth 1 --branch 2.26.9 https://github.com/broadinstitute/picard &&\
    cd picard && ./gradlew shadowJar 

# MONI https://github.com/maxrossi91/moni
# Need cmake 3.15 at least
RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.2/cmake-3.22.2-linux-x86_64.sh &&\
    bash cmake-3.22.2-linux-x86_64.sh --skip-license --prefix=/usr/ --exclude-subdir
RUN git clone  --depth 1 https://github.com/maxrossi91/moni.git && \
    cd moni && mkdir build && cd build && cmake .. && make && make install

#vsearch
RUN wget https://github.com/torognes/vsearch/archive/v2.21.1.tar.gz &&\
    tar xzf v2.21.1.tar.gz &&\
    cd vsearch-2.21.1 &&\
    ./autogen.sh &&\
    ./configure CFLAGS="-O3" CXXFLAGS="-O3" &&\
    make && make install 

#pavian
#megahit 
#pear

# Could go as attachment for this image
WORKDIR /opt/ncbi-tax
RUN git clone --depth 1 https://github.com/ncbi/ngs-tools.git --branch tax && \
    git clone --depth 1 https://github.com/ncbi/ncbi-vdb.git && \
    git clone --depth 1 https://github.com/ncbi/sra-tools.git && \
    cd ./ncbi-vdb/ && ./configure --without-debug && make -j4 && cd .. && \
    cd ./sra-tools/ && ./configure --without-debug && make -j4 && cd .. && \
    cd ./ngs-tools/ && ./configure --without-debug && make -j4 && cd ../ 

RUN  cp -r /root/ncbi-outdir/*/linux/gcc/x86_64/rel/bin/* /usr/local/sbin/ 
#     rm -r /root/ncbi-outdir/ ngs-tools ncbi-vdb sra-tools


WORKDIR /opt
RUN wget https://github.com/CSB5/lofreq/raw/master/dist/lofreq_star-2.1.5_linux-x86-64.tgz && tar -xf lofreq_star-2.1.5_linux-x86-64.tgz
#RUN pip uninstall -y samtools

WORKDIR /opt/nextflow
RUN curl -s https://get.nextflow.io | bash && chmod +rx nextflow 
#TEST RUN ./nextflow

WORKDIR /opt

RUN wget "https://github.com/iqtree/iqtree2/releases/download/v2.2.0/iqtree-2.2.0-Linux.tar.gz" -O iqtree.gz && tar xf iqtree.gz


# Remove unwanted, non working samtools from conda
RUN rm /opt/conda/bin/samtools && ln /opt/samtools/samtools-1.12/samtools /opt/conda/bin/samtools

RUN wget https://mafft.cbrc.jp/alignment/software/mafft-7.490-linux.tgz && tar xf mafft-7.490-linux.tgz && chmod a+rx -R /opt/mafft-linux64/
RUN ln -s /opt/mafft-linux64/mafftdir/libexec /usr/libexec/mafft
#RUN /opt/conda/bin/conda create -n ete3 python=3 && /opt/conda/bin/conda activate ete3 && conda install -y -c etetoolkit ete3 ete_toolchain && ete3 build check

RUN $CONDA_DIR/bin/pip install \
      graphviz \
      #ipyleaflet==0.13.2 tensorflow==2.3.0  \
      ipyleaflet tensorflow \
      nbindex-jupyter jupyter-datatables jupyter_require \
      shapely folium geopandas seaborn pyproj geovoronoi descartes \
      jupyter-kernel-gateway dash jupyter-dash missingno pyarrow datatable  dash_cytoscape dash_html_components cufflinks \
      opencv-python wordcloud\
      holoviews datashader networkx 

RUN $CONDA_DIR/bin/pip install jupyterlab_sql ipython-sql pgspecial && \
    jupyter serverextension enable jupyterlab_sql --py --sys-prefix && \
    jupyter lab build 

RUN $CONDA_DIR/bin/pip install jupyterlab-dash && ls && jupyter labextension install jupyterlab-dash && \
    jupyter lab build 

RUN  $CONDA_DIR/bin/conda install -c conda-forge google-cloud-sdk 

RUN    apt-get update && apt-get install -y --no-install-recommends hisat2 python3-hisat2 &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

# SLURM 
RUN apt-get update && apt-get install -y slurm-client  &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip install jupyterlab_slurm 

# GO Teleport
RUN curl https://apt.releases.teleport.dev/gpg -o /usr/share/keyrings/teleport-archive-keyring.asc && \
    . /etc/os-release && \
    echo "deb [signed-by=/usr/share/keyrings/teleport-archive-keyring.asc] \
  https://apt.releases.teleport.dev/${ID?} ${VERSION_CODENAME?} stable/v10" \
| tee /etc/apt/sources.list.d/teleport.list && apt-get update && apt-get install -y teleport && \
    rm -rf /var/lib/apt/lists/*

RUN $CONDA_DIR/bin/pip install dash_bootstrap_components gunicorn

RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-410.0.0-linux-x86_64.tar.gz && \
    tar xf google-cloud-cli-410.0.0-linux-x86_64.tar.gz &&  rm /opt/google-cloud-cli-410.0.0-linux-x86_64.tar.gz 

RUN $CONDA_DIR/bin/pip install pymc3 numpy==1.21.6

RUN apt-get update && apt-get install -y libboost-all-dev &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://bitbucket.org/berkeleylab/metabat/get/master.tar.gz && \
    tar xzvf master.tar.gz && cd berkeleylab-metabat-* &&\
    mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    make -j8 && \
    make install && \
    cd .. && \
    rm -rf build

# basic
ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 

# Add local files as late as possible to avoid cache busting
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/kooplex-logo.png
ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png

RUN sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs

########## add the rest
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py

ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
ADD etc/entrypoint.sh /entrypoint.sh

RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh 

ADD etc/41-kubejobsaliases.sh /etc/profile.d/41-kubejobsaliases.sh

WORKDIR /


