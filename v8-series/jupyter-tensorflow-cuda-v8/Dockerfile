FROM jupyter-basic-cuda-v8

#RUN ${CONDA_DIR}/bin/conda install -y -c conda-forge --force cudatoolkit=11.2 && ${CONDA_DIR}/bin/conda install -y pip && ${CONDA_DIR}/bin/conda install -y -c conda-forge --force cudnn=8.* cudatoolkit=11.8.0 && \
#RUN ${CONDA_DIR}/bin/conda install -y -c conda-forge --force cudatoolkit=11.8.0 cudnn=8.6.* && \
RUN apt-get update && apt-get install -y --no-install-recommends    libcudnn9-dev-cuda-12 libcudnn9-cuda-12 &&     rm -rf /var/lib/apt/lists/* 
RUN   ${CONDA_DIR}/bin/pip install tensorflow[and-cuda] nvidia-cudnn-cu11

RUN ${CONDA_DIR}/bin/conda install -y jupyter
RUN   ${CONDA_DIR}/bin/pip install matplotlib seaborn
RUN   ${CONDA_DIR}/bin/pip install pandas  scikit-learn scikit-learn-intelex xgboost specio
RUN ${CONDA_DIR}/bin/conda install -y -c conda-forge cudatoolkit=12.6 cudnn==8.9.*
#RUN mkdir -p /usr/local/cuda/nvvm/libdevice && cp /opt/conda/pkgs/cudatoolkit-12.6.0-hd8887f6_10/lib/libdevice.10.bc /usr/local/cuda/nvvm/libdevice/libdevice.10.bc
RUN apt-get update && apt-get install -y --no-install-recommends    nvidia-cuda-toolkit &&     rm -rf /var/lib/apt/lists/* 
#
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:$CONDA_DIR/lib/:/opt/conda/lib/python3.11/site-packages/nvidia/cudnn/lib/:/usr/lib/x86_64-linux-gnu/
#
##RUN $CONDA_DIR/bin/conda install pytorch torchvision torchaudio pytorch-cuda=11.7 -c pytorch -c nvidia &&\
##    $CONDA_DIR/bin/conda clean --packages
#
##RUN $CONDA_DIR/bin/conda create -n pytorch python==3.10.* 
##RUN . $CONDA_DIR/bin/activate && activate pytorch && conda update -y conda && conda install pytorch torchvision torchaudio pytorch-cuda -c pytorch -c nvidia &&\
##    $CONDA_DIR/bin/conda clean --packages
#
RUN $CONDA_DIR/bin/pip install transformers


RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# Install Tini
#RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.19.0/tini && \
#    echo "93dcc18adc78c65a028a84799ecf8ad40c936fdfc5f2a57b1acda5a8117fa82c *tini" | sha256sum -c - && \
#    mv tini /usr/local/bin/tini && \
#    chmod +x /usr/local/bin/tini

#RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.a /usr/lib/
#RUN ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/

#RUN mkdir /root/.ssh
#RUN chmod 0600 /root/.ssh

RUN ln -sf  /usr/share/zoneinfo/Europe/Budapest  /etc/localtime && \
    dpkg-reconfigure tzdata && \
    sed -i -e "s/^\(UMASK\).*/\1 0002/" /etc/login.defs && \
    pam-auth-update --package


#RUN curl -sL https://deb.nodesource.com/setup_14.x |  bash - && \
#    apt install --yes nodejs 

# For databases
#RUN pip3 install mysqlclient pymssql psycopg2 pymonetdb pandas>=1.4.* \
#	dash_bootstrap_components gunicorn\
#	jupyter-book

#COPY --from=1 /usr/local/bin/teleport /usr/local/bin/teleport

# Jupyter specific settings and templates
#ADD etc/jupyter-notebook-kooplex /opt/conda/bin/jupyter-notebook-kooplex 
ADD etc/jupyter_notebook_config.py /etc/jupyter_notebook_config.py
#ADD etc/jupyter_report_config.py /etc/jupyter_report_config.py
#ADD etc/kooplex-logo.png /opt/conda/lib/python3.10/site-packages/notebook/static/base/images/kooplex-logo.png
#ADD etc/kooplex-logo.png /opt/conda/lib/python3.10/site-packages/notebook/static/base/images/jupyterlab.png

ADD etc/start-notebook.sh /usr/local/bin/runjupyter.sh
ADD etc/entrypoint.sh /entrypoint.sh
#RUN chmod a+x /usr/local/bin/runjupyter.sh /opt/conda/bin/jupyter-notebook-kooplex /entrypoint.sh
RUN chmod a+x /usr/local/bin/runjupyter.sh  /entrypoint.sh



WORKDIR /

