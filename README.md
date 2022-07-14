# images
#image build for the hub and users


# bash image_build.sh build <foldername>
bash image_build.sh build jupyter-basic

# bash image_build.sh install <foldername> <namespace-of-hub> <podname-of-hub>
bash image_build.sh install jupyter-basic k8plex-test hub-0
