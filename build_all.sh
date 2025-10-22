BUILDCMD='bash image_build.sh build'
#INSTALLCM=
# V6 images
VER=v6
# Layer order
${BUILDCMD} base_ubuntu20-${VER}
${BUILDCMD} base-aptp_ubuntu20-${VER}
# ${BUILDCMD} base-teleport_ubuntu20-${VER}

# config layer
${BUILDCMD} base-config_ubuntu20-${VER}

# CONDA
${BUILDCMD} base-conda_ubuntu20-${VER}

# Some Extras
${BUILDCMD} base-extras_ubuntu20-${VER}

# Temporarily kubernetes
#${BUILDCMD} base-kube_ubuntu20-${VER}

# Choose between jupyter or jupyterlab
## Jupyter
${BUILDCMD} base-jupyter_ubuntu20-${VER}
${BUILDCMD} jupyter-basic-${VER}

## Jupyterlab
${BUILDCMD} base-jupyterlab_ubuntu20-${VER}
${BUILDCMD} jupyterlab-basic-${VER}

## Bioinf
${BUILDCMD} base-bioinf_ubuntu20-${VER}
${BUILDCMD} jupyter-bioinf-${VER}

# With cuda capability
${BUILDCMD} jupyter-basic-cuda-${VER}
# or
${BUILDCMD} jupyterlab-basic-cuda-${VER}
# or
${BUILDCMD} jupyter-bioinf-cuda-${VER}

${BUILDCMD} jupyter-dataexp-${VER}

# INSTALL
#for host in edu veo krft test
#for host in  test
#do
#	echo "nstalling to $host"
##   bash image_build.sh install jupyter-basic-${VER}/ k8plex-$host hub-0
##   bash image_build.sh install jupyterlab-basic-${VER}/ k8plex-$host hub-0
##   bash image_build.sh install jupyter-basic-cuda-${VER}/ k8plex-$host hub-0
##   bash image_build.sh install jupyterlab-basic-cuda-${VER}/ k8plex-$host hub-0
#   bash image_build.sh install jupyter-bioinf-${VER}/ k8plex-$host hub-0
#   bash image_build.sh install jupyter-bioinf-cuda-${VER}/ k8plex-$host hub-0
#done

# V4 images
#bash image_build.sh build base_ubuntu20-v4.0
#bash image_build.sh build base-conda_ubuntu20-v4.0
#
#bash image_build.sh build jupyter-basic-v4.0
#bash image_build.sh build jupyter-fiznum-v4.0
#bash image_build.sh build jupyter-bioinf-v4.0
#bash image_build.sh build jupyter-siesta-v4.0
#bash image_build.sh build jupyter-cityflow-v4.0
#bash image_build.sh build jupyter-dataexp-v4.0

# V5 images
#bash image_build.sh build base_ubuntu20-v5
#bash image_build.sh build base-aptp_ubuntu20-v5
#bash image_build.sh build base-conda_ubuntu20-v6
#bash image_build.sh build base-kube_ubuntu20-v6
#bash image_build.sh build base-extras_ubuntu20-v6

# v5 jupyter
#bash image_build.sh build jupyter-basic-v5
#bash image_build.sh build jupyter-basic-wcudatoolkit-v5
#bash image_build.sh build jupyter-fiznum-v6
#bash image_build.sh build jupyter-bioinf-v5
#bash image_build.sh build jupyter-bioinf-wcuda-v5
#bash image_build.sh build jupyter-siesta-v5
#bash image_build.sh build jupyter-cityflow-v5
#bash image_build.sh build jupyter-dataexp-v5

## V5 report
#bash image_build.sh build report-bokeh-v5


####
#bash image_build.sh build rstudio-363-base
#bash image_build.sh build rstudio-363-ubuntu18
#bash image_build.sh build vscode-python

#bash image_build.sh build hub-v5
#bash image_build.sh build oauth-v4.0


# INSTALL
#for host in edu veo krft test
#for host in  test
#do
#	echo "nstalling to $host"
#   bash image_build.sh install jupyter-dataexp-v5/ k8plex-$host hub-0
#   bash image_build.sh install jupyter-basic-v5/ k8plex-$host hub-0
#   bash image_build.sh install jupyter-basic-wcudatoolkit-v5/ k8plex-$host hub-0
#   bash image_build.sh install jupyter-siesta-v5/ k8plex-$host hub-0
#   bash image_build.sh install jupyter-cityflow-v5/ k8plex-$host hub-0
#   bash image_build.sh install jupyter-bioinf-v5/ k8plex-$host hub-0
#   bash image_build.sh install jupyter-bioinf-wcuda-v5/ k8plex-$host hub-0
#   bash image_build.sh install jupyter-fiznum-v6/ k8plex-$host hub-0
#   bash image_build.sh install rstudio-363-ubuntu18-wr421-v5/ k8plex-$host hub-0
#done
