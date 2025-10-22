FROM jupyter-basic-v9 as base

#RUN . /opt/python-packages/bin/activate && uv pip install notebook poetry poetry-kernel sqlalchemy ipython-sql jupyterlab_latex  naas_drivers distutils
#RUN . /opt/python-packages/bin/activate && uv pip install setuptools
#RUN pip install --upgrade setuptools
#RUN . /opt/python-packages/bin/activate && uv pip install "pandas>=2.0" "numpy>=2.0"
#RUN . /opt/python-packages/bin/activate && uv pip install notebook sqlalchemy 
#RUN . /opt/python-packages/bin/activate && uv pip install poetry poetry-kernel  
##RUN . /opt/python-packages/bin/activate && uv pip install  naas_drivers 
#
#RUN . /opt/python-packages/bin/activate && uv pip install ipython-sql jupyterlab_latex  
##RUN  pip install notebook poetry poetry-kernel sqlalchemy ipython-sql jupyterlab_latex  naas_drivers 
#RUN . /opt/python-packages/bin/activate && uv pip install "ipywidgets>=8.0"
#RUN . /opt/python-packages/bin/activate && uv pip install nbclassic
###RUN  pip install notebook sqlalchemy \
RUN  pip install \
	poetry poetry-kernel ipython-sql jupyterlab_latex jupyter_copilot \
	"ipywidgets>=8.0"  
WORKDIR /
RUN chmod a+x /usr/local/bin/runjupyter.sh  /entrypoint.sh

#RUN  wget https://download.mql5.com/cdn/web/metaquotes.software.corp/mt5/mt5ubuntu.sh && chmod +x mt5ubuntu.sh 
#&& ./mt5ubuntu.sh 




