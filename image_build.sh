#!/bin/bash

. config.sh

IMAGE_DIR=`basename $2`
. ${IMAGE_DIR}/envs

NS=$3
POD_NAME=$4
API_CALL="python3 /kooplexhub/kooplexhub/manage.py manage_images"

IMAGE_NAME="${IMAGE_DIR}-${TAG}"
RIMAGE_NAME="${MY_REGISTRY}/${IMAGE_NAME}"
BUILDMOD_DIR=${BUILD_DIR}/${IMAGE_DIR}
echo $IMAGE_NAME, $RIMAGE_NAME, $BUILDMOD_DIR
mkdir -p $BUILDMOD_DIR

case $1 in
  "build")
      echo "Building image ${IMAGE_NAME}" >&2
      cp -r $IMAGE_DIR/* ${BUILDMOD_DIR}/
      cd ${BUILDMOD_DIR}; . execute; cd $OLDPWD 
      
      docker $DOCKERARGS build -t ${IMAGE_NAME} -f $BUILDMOD_DIR/Dockerfile $BUILDMOD_DIR
      docker $DOCKERARGS tag ${IMAGE_NAME} ${RIMAGE_NAME}
      docker $DOCKERARGS push ${RIMAGE_NAME}
  ;;

  "install")
      echo "Register in hub ${RIMAGE_NAME}" >&2
      kubectl exec -it -n ${NS} ${POD_NAME} -- ${API_CALL} --add ${RIMAGE_NAME}
      for items in `cat ${BUILDMOD_DIR}/ENVVAR`
      do
	      arr=(`echo $items| awk -F'=' '{print $1,$2}'`)
         kubectl exec -it -n ${NS} ${POD_NAME} -- ${API_CALL}  --add_envvar ${RIMAGE_NAME} ${arr[@]}
      done

      for items in `cat ${BUILDMOD_DIR}/PROXY`
      do
	      arr=(`echo $items| awk -v IMN=${RIMAGE_NAME} -F',' '{print $1,IMN,$2,$3,$4,$5,$6}'`)
	      echo ${arr[@]}
          kubectl exec -it -n ${NS} ${POD_NAME} -- ${API_CALL} --add_proxy    ${arr[@]}
	     
      done
#      kubectl exec -it -n ${NS} ${POD_NAME} -- python3 /kooplexhub/kooplexhub/manage.py manage_images --add_envvar ${RIMAGE_NAME} NB_USER {container.user.username}
#      kubectl exec -it -n ${NS} ${POD_NAME} -- python3 /kooplexhub/kooplexhub/manage.py manage_images --add_envvar ${RIMAGE_NAME} NB_TOKEN {container.user.profile.token}
#      kubectl exec -it -n ${NS} ${POD_NAME} -- python3 /kooplexhub/kooplexhub/manage.py manage_images --add_envvar ${RIMAGE_NAME} NB_PORT 8000
#      kubectl exec -it -n ${NS} ${POD_NAME} -- python3 /kooplexhub/kooplexhub/manage.py manage_images --add_envvar ${RIMAGE_NAME} NB_URL {container.proxy_route}
#      kubectl exec -it -n ${NS} ${POD_NAME} -- python3 /kooplexhub/kooplexhub/manage.py manage_images --add_envvar ${RIMAGE_NAME} NB_TESTURL notebook/test/{container.label}
#      kubectl exec -it -n ${NS} ${POD_NAME} -- python3 /kooplexhub/kooplexhub/manage.py manage_images --add_proxy jupyter-notebook-basic ${RIMAGE_NAME} True True notebook/{container.label} notebook/{container.label}/ 8000

  ;;

  "uninstall")
      kubectl exec -it ${PREFIX}-hub -- python3 /kooplexhub/kooplexhub/manage.py manage_images --remove ${RIMAGE_NAME}
  ;;

  "remove")
      echo "Removing $BUILDMOD_DIR" >&2
      rm -R -f $BUILDMOD_DIR
  ;;
esac
