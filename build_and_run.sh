#!/bin/bash

# GUI Forwarding - Allow X11 connections
xhost +local:docker

# Build the Docker image
docker build -t gz-editor .

# Run the container
## w/ GUID forwarding
## mount directory for storing models
## start Gazebo
docker run -it \
    --rm \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ~/.gazebo/models:/root/.gazebo/models \
    --name gz-editor \
    gz-editor \
    bash -c "gazebo"