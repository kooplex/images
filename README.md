# images
#image build for the hub and users


# bash image_build.sh build <foldername>
bash image_build.sh build jupyter-basic

# bash image_build.sh install <foldername> <namespace-of-hub> <podname-of-hub>
bash image_build.sh install jupyter-basic k8plex-test hub-0

# V7 images will not have any conda or jupyter related packages installed
# The notebook server will run from the user storage
# The kernels will be installed into a separate pyenv or conda env

# 1. Layer order
base_ubuntu20-v7
base-aptp_ubuntu20-v7

 

# V6 images
# 1. Layer order
base_ubuntu20-v6
base-aptp_ubuntu20-v6
#base-teleport_ubuntu20-v6 Later we just copy it in. For some reason newer versions than 10.2.6 didn't work with current server:

# 2. config layer
base-config_ubuntu20-v6

# 3. CONDA
base-conda_ubuntu20-v6

# 4. Some Extras
base-extras_ubuntu20-v6

# 5. Temporarily kubernetes
base-kube_ubuntu20-v6

# 6. Choose between jupyter or jupyterlab
base-jupyter_ubuntu20-v6
base-jupyterlab_ubuntu20-v6
base-bioinf_ubuntu20-v6

# 7. Notebook layer
## Jupyter
jupyter-basic-v6
## Jupyterlab
jupyterlab-basic-v6
## Bioinf
jupyter-bioinf-v6


# 7. With cuda capability
## Jupyter
jupyter-basic-cuda-v6
## Jupyterlab
jupyterlab-basic-cuda-v6
## Bioinf
jupyter-bioinf-cuda-v6

# Tensorflow
tensorflow
-- base_ubuntu20-v6 # Include
-- base-aptp_ubuntu20-v6  # Include
-- base-config_ubuntu20-v6  # Include
jupyter-tensorflow-v6

