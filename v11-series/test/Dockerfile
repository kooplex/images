FROM python:3.12-slim-bookworm

MAINTAINER Kooplex Team <kooplex@complex.elte.hu>

# Install uv utilities
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ENV UV_LINK_MODE=copy \
    UV_COMPILE_BYTECODE=1 \
    JUPYTER_PORT=8888

# System basics and handy tools
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash tmux curl wget git ca-certificates gnupg apt-transport-https tini \
        build-essential pkg-config \
        locales tzdata at \
        build-essential pkg-config procps sudo \
        libnss-ldapd nslcd ldap-utils \
        bc mc vim less xxd \
        bzip2 gzip unzip zip \
        rsync acl nfs4-acl-tools ssh netcat-openbsd \
        sshfs \
        texlive-base texlive-plain-generic texlive-latex-extra texlive-fonts-recommended texlive-science texlive-lang-european \
        default-libmysqlclient-dev libpq-dev libmariadb-dev freetds-dev freetds-bin unixodbc-dev \
        libglib2.0-0 libgomp1 \
    && rm -rf /var/lib/apt/lists/*

#NOTE: curlftpfs is not available in bookworm and fuse break fuse3
#ARG CURLFTPFS_VERSION=0.9.2
#
#RUN apt-get update && apt-get install -y --no-install-recommends \
#    libcurl4-openssl-dev \
#    libfuse-dev \
#    fuse \
# && rm -rf /var/lib/apt/lists/*
#
#RUN curl -fsSL -o /tmp/curlftpfs.tar.gz \
#      "https://downloads.sourceforge.net/project/curlftpfs/curlftpfs/${CURLFTPFS_VERSION}/curlftpfs-${CURLFTPFS_VERSION}.tar.gz" \
# && mkdir -p /tmp/curlftpfs \
# && tar -xzf /tmp/curlftpfs.tar.gz -C /tmp/curlftpfs --strip-components=1 \
# && cd /tmp/curlftpfs \
# && ./configure --prefix=/usr/local \
# && make -j"$(nproc)" \
# && make install \
# && rm -rf /tmp/curlftpfs /tmp/curlftpfs.tar.gz

# ODBC drivers
ARG TARGETARCH

RUN set -eux; \
    curl -fsSL https://packages.microsoft.com/keys/microsoft.asc \
      | gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg; \
    echo "deb [arch=${TARGETARCH} signed-by=/usr/share/keyrings/microsoft-prod.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" \
      > /etc/apt/sources.list.d/microsoft-prod.list; \
    apt-get update; \
    ACCEPT_EULA=Y apt-get install -y --no-install-recommends \
      msodbcsql18 \
      unixodbc-dev; \
    rm -rf /var/lib/apt/lists/*

# Basic system configuration
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen; \
    ln -sf /usr/share/zoneinfo/Europe/Budapest /etc/localtime \
    && dpkg-reconfigure tzdata

# Jupyter server environment
RUN uv venv /opt/jupyter
ENV PATH="/opt/jupyter/bin:$PATH"

COPY requirements.in /tmp/requirements.in

RUN uv pip install --python /opt/jupyter/bin/python \
    -r /tmp/requirements.in \
    && uv pip freeze --python /opt/jupyter/bin/python \
    > /opt/jupyter/requirements-resolved.txt

# Default Python kernel
RUN python -m ipykernel install \
    --prefix=/usr/local \
    --name=python-main \
    --display-name="Python main"

# git-lfs installation
ARG TARGETARCH
ARG GIT_LFS_VERSION=3.6.1

RUN case "${TARGETARCH}" in \
      amd64) GIT_LFS_ARCH=amd64 ;; \
      arm64) GIT_LFS_ARCH=arm64 ;; \
      *) echo "Unsupported arch: ${TARGETARCH}" && exit 1 ;; \
    esac && \
    curl -fsSL -o /tmp/git-lfs.tar.gz \
      "https://github.com/git-lfs/git-lfs/releases/download/v${GIT_LFS_VERSION}/git-lfs-linux-${GIT_LFS_ARCH}-v${GIT_LFS_VERSION}.tar.gz" && \
    mkdir -p /tmp/git-lfs && \
    tar -xzf /tmp/git-lfs.tar.gz -C /tmp/git-lfs --strip-components=1 && \
    /tmp/git-lfs/install.sh && \
    rm -rf /tmp/git-lfs /tmp/git-lfs.tar.gz

# Quarto installation
ARG TARGETARCH
ARG QUARTO_VERSION=1.9.38

RUN case "${TARGETARCH}" in \
      amd64)  QUARTO_ARCH=amd64 ;; \
      arm64)  QUARTO_ARCH=arm64 ;; \
      *)      echo "Unsupported arch: ${TARGETARCH}" && exit 1 ;; \
    esac && \
    curl -fsSL -o /tmp/quarto.deb \
      "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-${QUARTO_ARCH}.deb" && \
    apt-get update && \
    apt-get install -y /tmp/quarto.deb && \
    rm -f /tmp/quarto.deb && \
    rm -rf /var/lib/apt/lists/*



#TODO: A standard working directory should be set to /workspace, but this breaks the entrypoint script, so it is commented out for now. The entrypoint script should be fixed to work with /workspace as the working directory and refactor mounting volumes under /workspace instead of /v.
#WORKDIR /workspace
WORKDIR /v

EXPOSE 8888

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["tini", "--", "/usr/local/bin/entrypoint.sh"]
#CMD []



