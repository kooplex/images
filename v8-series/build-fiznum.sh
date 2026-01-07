for i in   base_ubuntu24-v8 base-aptp_ubuntu24-v8 base-conda_fiznum-v8  base-config_fiznum-v8 base-extras_fiznum-v8 base-jupyter_fiznum-v8 jupyter-fiznum-v8 jupyter-fiznum-classic-v8 
do
	export DOCKER_BUILDKIT=1
	bash ../image_build.sh $i
done


