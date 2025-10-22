#FROM continuumio/anaconda3:sha256:53ae2a3a2cd3c0155a42ea88b0b991c3dcd86f21b7174bd123abe064b9dbec85
FROM sha256:53ae2a3a2cd3c0155a42ea88b0b991c3dcd86f21b7174bd123abe064b9dbec85

FROM base-aptp_ubuntu20-v5


COPY --from=0 /opt/conda /opt/conda
RUN /opt/conda/bin/conda update -y conda


# conda
ENV CONDA_DIR /opt/conda
ENV PATH $CONDA_DIR/bin:$PATH
ENV SHELL /bin/bash
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN pip install pandas>=1.4.*


