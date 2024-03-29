#!/bin/bash

# This script launches the RS3 NXT client from a docker container. Before
# running this script, you should set the NXT_CACHE environment variable to
# point to an existing directory on your system where you would like NXT cache
# files to be stored.

RS3_IMAGE="iguerra130154/containerized_runescape:rs3"

# Location where NXT client cache files will be placed on the host filesystem.
NXT_CACHE="/home/ieg/.rs3"

if [ -z "$NXT_CACHE" ]
then
    echo "error: NXT_CACHE has not been set"
    exit 1
else
    echo "NXT cache files will be saved to '$NXT_CACHE'"
fi

# Make NXT cache subdirectories. In the case the subdirs already exist, the
# -p ensures the mkdir commands are harmless.
mkdir -p $NXT_CACHE/.runescape
mkdir -p $NXT_CACHE/Jagex

# Credit to this SO post that shows a method for generating an Xauthority file
# on the fly.
# https://stackoverflow.com/questions/16296753/can-you-run-gui-applications-in-a-linux-docker-container/25280523#25280523
XSOCK="/tmp/.X11-unix"
XAUTH="/tmp/.docker.xauth"
touch ${XAUTH}
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

# Details on how I got the audio working can be found here:
# https://comp0016-team-24.github.io/dev/problem-solving/2020/10/30/passing-audio-into-docker.html
docker run --rm                                                      \
    --privileged                                                     \
    -v ${XSOCK}:${XSOCK}                                             \
    -v ${XAUTH}:${XAUTH}                                             \
    -e XAUTHORITY=${XAUTH}                                           \
    -e DISPLAY=${DISPLAY}                                            \
    -e PULSE_SERVER=unix:/run/user/${EUID}/pulse/native              \
    -v /run/user/${EUID}/pulse/native:/run/user/${EUID}/pulse/native \
    -v ${NXT_CACHE}/.runescape:/home/runescape/.runescape            \
    -v ${NXT_CACHE}/Jagex:/home/runescape/Jagex                      \
    ${RS3_IMAGE} /usr/bin/runescape-launcher
