FROM base_ubuntu24-v9

RUN uv tool install jupyterlab
RUN uv tool install jupyter-core

RUN  pip install \
	 ipython-sql jupyterlab_latex jupyter_copilot \
	"ipywidgets>=8.0" nbclassic

## For databases
RUN pip install  mysqlclient pymssql psycopg2 pymonetdb sqlalchemy


