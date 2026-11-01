
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <image_name>"
    exit 1
fi

IMAGE_NAME=$1
DOCKERFILE=$2
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <image_name> <dockerfile> <platform>"
    echo "Available platforms: linux/amd64, linux/arm64"
    exit 1
fi

PLATFORM=$3
PLATFORM_TYPE=$(echo $PLATFORM | sed 's/\//_/g')

NEW_IMAGE_NAME=${IMAGE_NAME}:${PLATFORM_TYPE} 
docker buildx build \
  --builder=kube \
  --platform=${PLATFORM} \
  -t image-registry.vo.elte.hu/${NEW_IMAGE_NAME} \
  -f ${DOCKERFILE} \
  . \
  --push
