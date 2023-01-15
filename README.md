# Containerized Runescape

Ubuntu based Docker containers that run the OSRS RuneLite Client and the RS3
NXT Client. The scripts included in this project assume you are running an X
server on a Linux host PC with your distro's latest
[Docker](https://docs.docker.com/engine/install/) version installed.

### Setting Up the Client Cache

Whether you are playing OSRS or RS3, either game's client maintains a cache of
data files. Files generated in a docker container are typically gone once the
container is shutdown. It would suck to have to rebuild GB of cache for RS3 or
reconfigure your RuneLite plugins everytime you wanted to play. To avoid all
that, you should setup a directory on your PC where cache files for each client
will live. The directory can be anywhere on your PC where your user will have
access to it.

> **Warning**
> Do not point the RS3 client and RuneLite client at the same cache directory!

### Launching the Client

The easiest way to launch either client is to use the `launch.sh` script
included in each game's directory.

> **Note**
> Before running `launch.sh`, edit the file to point to the cache folder you
> previously created. Set the `*_CACHE` variable to the cache folder's absolute
> path.
