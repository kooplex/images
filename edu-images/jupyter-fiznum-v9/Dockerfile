FROM base-jupyter_ubuntu24-v9

RUN conda install -c conda-forge "libstdcxx-ng>=13" "libgcc-ng>=13"

RUN apt-get update && apt-get install -y --no-install-recommends \
        tmux curl zip xxd bc mc ngspice libngspice0 libngspice0-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install PySpice schemdraw

RUN sed -i '625{s/^[[:space:]]*self\._error_in_stderr = True/# &/}' \
        /opt/conda/lib/python3.12/site-packages/PySpice/Spice/NgSpice/Shared.py

