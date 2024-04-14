#!/bin/bash

IMAGE_NAME="my-jupyter-lab"

CONTAINER_NAME="jupyter-lab-container"

HOST_PORT=8080

CONTAINER_PORT=8888

CONTAINER_DIR="/usr/src/app"

echo "Building Docker image..."
docker build -t $IMAGE_NAME .

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Removing existing container..."
    docker rm -f $CONTAINER_NAME
fi

echo "Running Docker container..."
docker run -p $HOST_PORT:$CONTAINER_PORT \
           -v $(pwd)/:$CONTAINER_DIR \
           --name $CONTAINER_NAME \
           -d $IMAGE_NAME

echo "Container $CONTAINER_NAME is running."
echo "Access Jupyter Lab at http://localhost:$HOST_PORT"

