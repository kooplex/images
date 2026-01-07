FROM image-registry.vo.elte.hu/jupyter-bioinf-v8

#RUN $CONDA_DIR/bin/conda clean -y --all

# Install RGI dependencies https://github.com/arpcard/rgi
#RUN git clone --depth=1 https://github.com/arpcard/rgi && cd rgi/ && $CONDA_DIR/bin/conda  env create -f conda_env.yml

# Install further tool into the conda rgi env
#RUN conda activate rgi && $CONDA_DIR/bin/conda install -y samtools bamtools kma
RUN pip install "biopython>=1.78" "filetype>=1.0.0" "pytest>=3.0.0" "pandas>=0.15.0" "matplotlib>=2.1.2" \
 "seaborn>=0.8.1" "pyfaidx>=0.5.4.1" "pyahocorasick==2.1.0" "pysam>=0.16.0.1" "beautifulsoup4>=4.9.3" "requests==2.32.4" "lxml>=4.9.1" "dask[dataframe]" \
 "pyrodigal>=3.0.0" "setuptools>=47.1.0"

RUN $CONDA_DIR/bin/conda install -y -c conda-forge -c bioconda biopython pysam  blast  prodigal  pyrodigal diamond oligoarrayaux samtools \
bamtools bedtools bowtie2  bwa  kma bioconda::jellyfish dask

#RUN conda install mamba
#RUN mamba search --channel conda-forge --channel bioconda --channel defaults rgi

RUN cd /opt/ && git clone  https://github.com/arpcard/rgi && cd /opt/rgi && \
 mkdir -p /opt/rgi/inputs/heatmap_inputs/  && \
 python setup.py build &&  python setup.py test && python setup.py install 
#&& cd /opt/rgi/app/_data/ && wget https://card.mcmaster.ca/latest/data && tar -xvf data ./card.json 

#RUN cd /opt/rgi && rgi load --card_json /opt/rgi/app/_data/card.json 

#RUN cd /opt/rgi/tests/ && pytest -v -rxs

RUN sed -i -e 's/archive.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources
RUN sed -i -e 's/security.u/old-releases.u/' /etc/apt/sources.list.d/ubuntu.sources
RUN apt update && apt install -y tree clustalw &&\
    apt-get clean && rm -rf /var/lib/apt/lists/* 

RUN pip install biopython pandas numpy matplotlib seaborn plotly requests beautifulsoup4 scipy scikit-learn networkx




WORKDIR /


