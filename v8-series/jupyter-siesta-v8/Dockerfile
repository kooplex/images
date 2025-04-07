FROM base-jupyter_ubuntu24-v8

RUN  pip install notebook sqlalchemy \
	poetry poetry-kernel ipython-sql jupyterlab_latex jupyterlab_iframe \
	"ipywidgets>=8.0" nbclassic  sisl

WORKDIR /
RUN conda install -y  -c conda-forge siesta=5.2.2=nompi_h12af787_1000

RUN apt update && apt install -y unzip libnss3 libasound2-dev &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/fathyb/carbonyl/releases/download/v0.0.3/carbonyl.linux-amd64.zip && \
    unzip carbonyl.linux-amd64.zip && cp carbonyl-0.0.3/carbonyl carbonyl-0.0.3/*.json carbonyl-0.0.3/*.bin carbonyl-0.0.3/icudtl.dat /usr/local/bin/ && \
    cp carbonyl-0.0.3/*so /usr/lib/ && \
    rm -r carbonyl*
#iRUN apt update && apt install -y --no-install-recommends carbonyl &&\
# apt-get clean && rm -rf /var/lib/apt/lists/*



