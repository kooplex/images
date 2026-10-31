bash ../build_image.sh base_ubuntu26uv  01-Dockerfile  linux/arm64 
bash ../build_image.sh base_ubuntu26uv 01-Dockerfile  linux/amd64 

bash ../build_image.sh jupyter-basic-v11 02-Dockerfile.base-uv-packages_ubuntu26-v11 linux/amd64 
bash ../build_image.sh jupyter-basic-v11 02-Dockerfile.base-uv-packages_ubuntu26-v11 linux/arm64 
