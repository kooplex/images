#for i in   base_ubuntu24-v8 base-aptp_ubuntu24-v8 base-config_ubuntu24-v8 base-extras_ubuntu24-v8 base-jupyter_ubuntu24-v8 jupyter-fiznum-v8 jupyter-basic-v8 jupyter-basic-classic-v8 jupyter-fiznum-classic-v8 jupyter-basic-cuda-v8
for i in base-aptp_ubuntu24-v8 base-conda_ubuntu24-v8  base-config_ubuntu24-v8 base-extras_ubuntu24-v8 base-jupyter_ubuntu24-v8 jupyter-basic-v8 jupyter-fiznum-v8 jupyter-basic-classic-v8 jupyter-fiznum-classic-v8 jupyter-basic-cuda-v8
do
	export DOCKER_BUILDKIT=1
	bash ../image_build.sh build $i
done


