#FROM continuumio/anaconda3

FROM base-conda_ubuntu20-v5

RUN $CONDA_DIR/bin/pip install dash missingno pyarrow datatable  dash_cytoscape dash_html_components cufflinks \
      holoviews datashader networkx gunicorn dash_bootstrap_components 

RUN $CONDA_DIR/bin/pip install kaleido 

ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh 

WORKDIR /


