FROM base-jupyter_ubuntu24-v9

RUN  pip install \
	poetry poetry-kernel ipython-sql jupyterlab_latex  \
	"ipywidgets>=8.0" nbclassic 

WORKDIR /opt/

# Install Denario
RUN git clone --depth=1 https://github.com/AstroPilot-AI/DenarioApp.git denario&& \
    cd denario && pip install -e .

WORKDIR /
RUN chmod a+x /usr/local/bin/runjupyter.sh  /entrypoint.sh




