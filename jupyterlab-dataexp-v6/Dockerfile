FROM base-jupyterlab_ubuntu20-v6

RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
 libhdf5-dev && pip install netcdf4 \
    && rm -rf /var/lib/apt/lists/*

RUN $CONDA_DIR/bin/conda install --quiet --yes  -c conda-forge  altair branca vega vincent nglview pscript \ 
       scikit-image igraph \
       ipyvolume \
     xgboost sisl ipython-sql ffmpeg plotly\
     pytess oauth2 k3d \
      graphviz \
      wrapt \
      #ipyleaflet==0.13.2 tensorflow==2.3.0  \
      ipyleaflet tensorflow \
      nbindex-jupyter jupyter-datatables jupyter_require \
      shapely folium geopandas seaborn pyproj geovoronoi descartes \
      jupyter-kernel-gateway dash jupyter-dash missingno pyarrow datatable  dash_cytoscape dash_html_components cufflinks \
      opencv-python wordcloud\
      holoviews datashader networkx 
      #pycairo>=1.20.0 networkx>=2.7.0 

RUN $CONDA_DIR/bin/pip install opencv-python schemdraw  ahkab   dash_bootstrap_components gunicorn
RUN  $CONDA_DIR/bin/conda install -c conda-forge  jupyterlab-git

RUN jupyter-nbextension enable nglview --py --sys-prefix


RUN $CONDA_DIR/bin/conda install  --quiet --yes   h5py  
#RUN conda install -c menpo opencv
                                                                                                                                                                                                                   

#RUN $CONDA_DIR/bin/conda update importlib_metadata
#RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager 
#RUN jupyter labextension install k3d || more /tmp/jupyterlab-debug-*
#RUN $CONDA_DIR/bin/conda update jupyterlab

#RUN $CONDA_DIR/bin/conda install -c conda-forge k3d



#RUN $CONDA_DIR/bin/conda install -c conda-forge  jupyterlab-git

# 2022 04 20 requests by Borkovits
#RUN $CONDA_DIR/bin/conda install --quiet --yes  -c conda-forge pycairo cairocffi
#RUN $CONDA_DIR/bin/conda update --quiet --yes  -c conda-forge networkx decorator

#  wrapt --upgrade --ignore-installed wrapt \

#RUN $CONDA_DIR/bin/conda install -y -c conda-forge python-infomap
#RUN $CONDA_DIR/bin/conda install -y decorator=5.0.9
#RUN pip install jupyterlab-bokeh-server && jupyter labextension install jupyterlab-bokeh-server
#RUN pip install keplergl pydantic[email,typing_extensions,dotenv]
#RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager keplergl-jupyter
#RUN jupyter serverextension enable jupyterlab_sql --py --sys-prefix
#RUN jupyter lab build
#RUN jupyter labextension install @pyviz/jupyterlab_pyviz jupyterlab-dash

## basic
#ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 
#
## Add local files as late as possible to avoid cache busting
#ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/kooplex-logo.png
#ADD etc/kooplex-logo.png /opt/conda/lib/python3.8/site-packages/notebook/static/base/images/jupyterlab.png
#
#RUN sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs
#
########### add the rest
#ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
#ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py
#
#ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
#ADD etc/entrypoint.sh /entrypoint.sh
#
# #//91-startsshagent.sh
#
#RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh
#
## FROM TOOLS/kubernetesjobtools
#ADD etc/41-kubejobsaliases.sh /etc/profile.d/41-kubejobsaliases.sh
WORKDIR /


