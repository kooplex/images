for i in   base_ubuntu24-v8 base-aptp_ubuntu24-v8 base-conda_ubuntu24-v8 base-config_ubuntu24-v8 base-extras_ubuntu24-v8 base-bioinf_ubuntu24-v8 jupyter-bioinf-v8 #jupyter-bioinf-cuda-v8
do
	bash ../image_build.sh  $i
done


