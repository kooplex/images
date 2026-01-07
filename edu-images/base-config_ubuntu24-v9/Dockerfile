FROM base-conda_ubuntu24-v9

# Jupyter specific settings and templates
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
ADD etc/kooplex-logo.png /tmp/kooplex-logo.png
RUN tt=`python --version | awk '{print $2}'`; echo $tt &&  ver=${tt%.*} &&  \
    mkdir -p /opt/conda/lib/python-${ver}/site-packages/notebook/static/base/images && \
    cp /tmp/kooplex-logo.png /opt/conda/lib/python-${ver}/site-packages/notebook/static/base/images/kooplex-logo.png && cp /tmp/kooplex-logo.png /opt/conda/lib/python-${ver}/site-packages/notebook/static/base/images/jupyterlab.png

ADD etc/runjupyter.sh /usr/local/bin/runjupyter.sh
ADD etc/entrypoint.sh /entrypoint.sh
RUN chmod a+x /usr/local/bin/runjupyter.sh  /entrypoint.sh

WORKDIR /

