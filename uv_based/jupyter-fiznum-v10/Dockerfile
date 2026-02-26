FROM base_ubuntu24uv-v10

RUN apt-get update && apt-get install -y --no-install-recommends \
        ngspice libngspice0 libngspice0-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN uv pip install --python ${VENV_PATH}/bin/python \
    PySpice schemdraw

COPY patches/ /tmp/patches/
RUN cd /opt/venv/lib/python3.12/site-packages && \
    patch -p1 < /tmp/patches/pyspice-math-docstrings.patch && \
    patch -p1 < /tmp/patches/pyspice-ngspice-shared-stderr.patch && \
    patch -p1 < /tmp/patches/pyspice-server-docstring.patch
