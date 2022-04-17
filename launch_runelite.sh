#!/bin/bash

# This script launches RuneLite from a docker container. Before running this
# script, you should set the RUNELITE_ROOT environment variable to point to an
# existing directory on your system where you would like RuneLite cache files
# to be stored.

RUNELITE_IMAGE="iguerra130154/runelite:latest"

# Location where RuneLite cache files will be placed on the host filesystem.
RUNELITE_ROOT=""

if [ -z "$RUNELITE_ROOT" ]
then
    echo "error: RUNELITE_ROOT has not been set"
    exit 1
else
    echo "RuneLite cache files will be saved to '$RUNELITE_ROOT'"
fi

# Credit to this SO post that shows a method for generating an Xauthority file
# on the fly.
# https://stackoverflow.com/questions/16296753/can-you-run-gui-applications-in-a-linux-docker-container/25280523#25280523
XSOCK="/tmp/.X11-unix"
XAUTH="/tmp/.docker.xauth"
touch ${XAUTH}
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --rm -it                      \
    -v ${XSOCK}:${XSOCK}                 \
    -v ${XAUTH}:${XAUTH}                 \
    -e XAUTHORITY=${XAUTH}               \
    -e DISPLAY=${DISPLAY}                \
    -v ${RUNELITE_ROOT}:/home/runescape/ \
    ${RUNELITE_IMAGE}
