#FROM continuumio/anaconda3

FROM base-conda_ubuntu20-v5

RUN pip install shapely geopandas

ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh 

WORKDIR /


