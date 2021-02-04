NAME=$1

FQN="ghcr.io/morten-olsen/work-$NAME:latest"

sudo docker run -it --rm --net=host "$FQN" /bin/bash
