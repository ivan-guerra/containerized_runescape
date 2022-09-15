# Containerized Runescape

Ubuntu based Docker containers that run the OSRS RuneLite Client and the RS3
NXT Client. The scripts included in this project assume you are running an X
server on a Linux host PC with your distro's latest
[Docker](https://docs.docker.com/engine/install/) version installed.

### Launching the Client

The easiest way to get the client up and running is to navigate to the `osrs`/
`rs3` folder and run the included `launch.sh` script. For example, to run
the OSRS client

```
cd containerized_runescape/osrs && ./launch.sh
```

**WARNING: Before running `launch.sh`, edit the RUNELITE_CACHE/RS3_CACHE
environment variable to point to the location on the host filesystem where
the client will be placing its cache files.**

### Note to Windows Users

Even though this repo doesn't include the scripts to do it, it's possible to
run both clients on Windows.

First, install
* [Docker Desktop](https://www.docker.com/products/docker-desktop/)
* [Xming](https://sourceforge.net/projects/xming/)

Next, convert the `launch.sh` to a Windows PowerShell/CMD script. The tricky
part of the conversion will be passing the appropriate `DISPLAY` info from
Xming running on the host to the container. Checkout this
[article](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde)
for tips on how to do just that.
