#FROM continuumio/anaconda3

FROM base-conda_ubuntu24-v8

RUN pip install  kaleido   gunicorn flask  pandas sqlalchemy streamlit
# dash_leaflet holoviews datashader networkx dash missingno pyarrow datatable  dash_cytoscape dash_html_components cufflinks 
ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh 

WORKDIR /report


