FROM jupyter-cuda-atys-v9

ENV UV_INSTALL_DIR=/opt/uv/
ENV UV_TOOL_BIN_DIR=/opt/uv_bin
ENV UV_TOOL_DIR=/opt/uv_tools_dir
#ENV UV_PYTHON_BIN_DIR=/opt/uv_pythonbin/
#ENV UV_PYTHON_INSTALL_DIR=/opt/uv_pthondir/

RUN curl -LsSf https://astral.sh/uv/install.sh | sh
#ENV PATH=$PATH:/root/.local/bin
#RUN uv venv /opt/python-packages

#RUN . /opt/python-packages/bin/activate && uv tool install arc-state
#RUN $UV_INSTALL_DIR/uv tool install ruff -n 
RUN $UV_INSTALL_DIR/uv tool install arc-state -n 

ENV PATH=$PATH:$UV_TOOL_BIN_DIR
# RUN mv /root/.local/bin/state /opt/tools_bin/ && chmod a+rx -R /opt/tools_bin/ /root/.local/share/uv


RUN  pip install \
	poetry poetry-kernel ipython-sql jupyterlab_latex jupyter_copilot \
	"ipywidgets>=8.0"  
WORKDIR /

RUN pip install keras tensorflow[and-cuda]

