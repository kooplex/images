#!/bin/bash

BUILD_DIR=/srv/build/images

# REGISTRY
MY_REGISTRY=image-registry.vo.elte.hu

IMAGE_DIR=`basename $1`
IMAGE_NAME="${IMAGE_DIR}"
DESCRIPTION=${IMAGE_DIR}/Dockerfile
RIMAGE_NAME="${MY_REGISTRY}/${IMAGE_NAME}"
BUILDMOD_DIR=${BUILD_DIR}/${IMAGE_DIR}
DOCKERFILE=`cat ${IMAGE_DIR}/Dockerfile`
echo $IMAGE_NAME, $RIMAGE_NAME, $BUILDMOD_DIR
mkdir -p $BUILDMOD_DIR

echo "Building image ${IMAGE_NAME}" >&2
cp -r $IMAGE_DIR/* ${BUILDMOD_DIR}/

docker $DOCKERARGS build -t ${IMAGE_NAME} -f $BUILDMOD_DIR/Dockerfile $BUILDMOD_DIR
docker $DOCKERARGS tag ${IMAGE_NAME} ${RIMAGE_NAME}     
docker $DOCKERARGS push ${RIMAGE_NAME}
