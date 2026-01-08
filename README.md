# Docker Image Repository For Kooplex Platform

## Building an image

`> bash image_build.sh <foldername>`
bash image_build.sh build jupyter-basic

## Installing and image to a Kooplex instance
The Kooplex hub is running an API that can digest image information using yaml format

`> python install_image.py <foldername> <name-of-hub>`

The hub related information (token and url) needs to be placed into a config.env file


