# Containerized Runescape

Ubuntu based Docker containers that run the OSRS RuneLite Client and the RS3
NXT Client. The scripts included in this project assume you are running an X
server on the host PC. On Linux, follow your distro's instructions for
installing X. On Windows, install
[Xming](https://sourceforge.net/projects/xming/) and you should be good to go.

### Launching the Client

The easiest way to get the client up and running is to navigate to the `osrs`/
`rs3` folder and run the included `launch.sh` script.

To launch the OSRS client container without the script:

```
XSOCK="/tmp/.X11-unix"
XAUTH="/tmp/.docker.xauth"
touch ${XAUTH}
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run --rm                           \
    -v ${XSOCK}:${XSOCK}                  \
    -v ${XAUTH}:${XAUTH}                  \
    -e XAUTHORITY=${XAUTH}                \
    -e DISPLAY=${DISPLAY}                 \
    -v ${HOME}/.runelite:/home/runescape/ \
    iguerra130154/containerized_runescape:osrs
```

To launch the RS3 NXT client container without the script:

```
XSOCK="/tmp/.X11-unix"
XAUTH="/tmp/.docker.xauth"
touch ${XAUTH}
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
docker run --rm                                           \
    --privileged                                          \
    -v ${XSOCK}:${XSOCK}                                  \
    -v ${XAUTH}:${XAUTH}                                  \
    -e XAUTHORITY=${XAUTH}                                \
    -e DISPLAY=${DISPLAY}                                 \
    -v ${HOME}/.rs3/.runescape:/home/runescape/.runescape \
    -v ${HOME}/.rs3/Jagex:/home/runescape/Jagex           \
    iguerra130154/containerized_runescape:rs3 /usr/bin/runescape-launcher
```

```
**WARNING**: Before running `launch.sh`, edit the RUNELITE_CACHE/RS3_CACHE
environment variable to point to the location on the host filesystem where
the client will be placing its cache files.
```
