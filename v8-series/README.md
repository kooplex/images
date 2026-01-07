# images
#image buildtree for the hub and users

# bash ../image_build.sh build <foldername>
# > bash ../image_build.sh build jupyter-basic-v8

# bash image_build.sh install <foldername> <namespace-of-hub> <podname-of-hub>
# > bash image_build.sh install jupyter-basic-v8 k8plex-test hub-0

# V8 images will not have any conda or jupyter related packages installed
# The notebook server will run from the user storage
# The kernels will be installed into a separate pyenv or conda env

# 1. Layer order
base_ubuntu24-v8
base-aptp_ubuntu24-v8

# TELEPORT v16 doesnt work base-teleportv16.1.0_ubuntu24 Later we just copy it in.
# Using an older v14 version of it

# 2. config layer
base-config_ubuntu24-v8

# 3. CONDA
base-conda_ubuntu24-v8

# 4. Some Extras
base-extras_ubuntu24-v8

# 6. Choose between jupyter or jupyterlab
base-jupyter_ubuntu24-v8
base-bioinf_ubuntu24-v8

# 7. Notebook layer
## Jupyter
jupyter-basic-v8
## Bioinf
jupyter-bioinf-v8


# 7. With cuda capability
## Jupyter
jupyter-basic-cuda-v8
## Jupyterlab
jupyterlab-basic-cuda-v8
## Bioinf
jupyter-bioinf-cuda-v8

## Tensorflow
#tensorflow
#-- base_ubuntu20-v6 # Include
#-- base-aptp_ubuntu20-v6  # Include
#-- base-config_ubuntu20-v6  # Include
#jupyter-tensorflow-v6
#
