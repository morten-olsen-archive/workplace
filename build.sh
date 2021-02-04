#!/bin/bash

BASE_DIR="$PWD"
IMAGES=(
  base
  hacker
)

for IMAGE_NAME in "${IMAGES[@]}"
do
   : 
  CONTEXT_PATH="$BASE_DIR/$IMAGE_NAME"
  FQN="ghcr.io/morten-olsen/work-$IMAGE_NAME:latest"
  sudo docker build -t "$FQN" "$CONTEXT_PATH"
  sudo docker push "$FQN"
done
