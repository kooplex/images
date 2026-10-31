
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

docker buildx build \
  --builder=kube \
  --platform=${PLATFORM} \
  -t image-registry.vo.elte.hu/${IMAGE_NAME}_${PLATFORM_TYPE} \
  -f ${DOCKERFILE} \
  . \
  --push
