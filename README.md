# RuneLite Launcher

A Docker container that provides the Old School Runescape RuneLite Client.
The scripts included in this project assume you are running an X server on
the host PC. On Linux, follow your distro's instructions for installing X.
On Windows, install Xming and you should be good to go.

### Launching the Client

The easiest way to get the client up and running is to execute the included
[launch_runelite.sh](launch_runelite.sh) script.

```
**WARNING**: Before running launch_runelite.sh, edit the `RUNELITE_ROOT`
environment variable to point to the location on the host filesystem where
RuneLite will be placing its cache files.
```
