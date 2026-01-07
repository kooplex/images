for i in base-aptp_ubuntu24-v9 base-conda_ubuntu24-v9 base-config_ubuntu24-v9 base-extras_ubuntu24-v9 base-jupyter_ubuntu24-v9 jupyter-basic-v9 jupyter-copilot-v9
do
	export DOCKER_BUILDKIT=1
	bash ../image_build.sh build $i
	if [ $? != 0 ]; then
		echo
	       echo 	"!!!!   ERROR: DOCKER BUILD FAILED WITH $i ---------"
		echo
	       exit
	fi	       
done


