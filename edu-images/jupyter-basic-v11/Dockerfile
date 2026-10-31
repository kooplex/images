FROM image-registry.vo.elte.hu/base_ubuntu26uv_linux_amd64

RUN apt update && apt install -y --no-install-recommends  \
 liblapack-dev libblas-dev sshfs\
 gfortran libfreetype6* pkg-config \
 git gcc mpi-default-dev mpi-default-bin libfftw3-dev cmake \
  links2 \
 autoconf libncurses5-dev libncursesw5-dev libbz2-dev liblzma-dev apt-rdepends \
 libfontconfig1 libxrender1 libxrender-dev  libxtst6 libxi6 libasound2-dev  libpci-dev \
 g++ libicu-dev libxml2-dev \
 libscalapack-mpi-dev \
 texlive-xetex texlive-lang-european texlive-science texlive-plain-generic libmysqlclient-dev\
 python3-dev python3-gdbm \
 liblapack-dev liblapack-doc  liblapack-test liblapacke liblapacke-dev libtmglib-dev libtmglib3 libblas3 libblas-dev libblasr-dev libblas-test \
 less gzip libpng-dev\
 make ssh libpq-dev cutadapt\
 rsync netcat-openbsd at zip bc xxd \
 nodejs unzip mc\
         ngspice libngspice0 libngspice0-dev \
 snakemake automake libtool zlib1g-dev &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*

RUN  pip install \
	 ipython-sql jupyterlab_latex jupyter_copilot \
	"ipywidgets>=8.0" nbclassic  mysqlclient pymssql psycopg2 pymonetdb sqlalchemy \
	gunicorn jupyter-book pandoc \
	PySpice schemdraw

RUN sed -i '625{s/^[[:space:]]*self\._error_in_stderr = True/# &/}' \
        /opt/conda/lib/python3.12/site-packages/PySpice/Spice/NgSpice/Shared.py

## git lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo os=ubuntu dist=jammy bash &&\
    apt-get install -yq --no-install-recommends \
    git-lfs && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.296/quarto-1.3.296-linux-amd64.deb &&\
    dpkg -i  quarto-1.3.296-linux-amd64.deb && rm quarto-1.3.296-linux-amd64.deb




