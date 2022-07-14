# V4 images
bash image_build.sh build base_ubuntu20-v4.0
bash image_build.sh build base-conda_ubuntu20-v4.0

bash image_build.sh build jupyter-basic-v4.0
bash image_build.sh build jupyter-fiznum-v4.0
bash image_build.sh build jupyter-bioinf-v4.0
bash image_build.sh build jupyter-siesta-v4.0
bash image_build.sh build jupyter-cityflow-v4.0
bash image_build.sh build jupyter-dataexp-v4.0

# V5 images
bash image_build.sh build base_ubuntu20-v5
bash image_build.sh build base-aptp_ubuntu20-v5
bash image_build.sh build base-conda_ubuntu20-v5
bash image_build.sh build base-kube_ubuntu20-v5
bash image_build.sh build base-extras_ubuntu20-v5

# v5 jupyter
bash image_build.sh build jupyter-basic-v5
bash image_build.sh build jupyter-fiznum-v5
bash image_build.sh build jupyter-bioinf-v5
bash image_build.sh build jupyter-siesta-v5
bash image_build.sh build jupyter-cityflow-v5
bash image_build.sh build jupyter-dataexp-v5

## V5 report
bash image_build.sh build report-bokeh-v5


####
bash image_build.sh build rstudio-363-base
bash image_build.sh build rstudio-363-ubuntu18
bash image_build.sh build vscode-python

bash image_build.sh build hub
#bash image_build.sh build oauth
