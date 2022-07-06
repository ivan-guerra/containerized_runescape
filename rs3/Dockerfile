# Create an Ubuntu Docker image that when launched runs the RS3 NXT client.
# This image is based off the work done by fusion809:
# https://hub.docker.com/r/fusion809/runescape-launcher/

FROM ubuntu:latest

RUN echo "deb http://security.ubuntu.com/ubuntu impish-security main" |   \
    tee /etc/apt/sources.list.d/impish-security.list                    &&\
    apt-get update                                                      &&\
    DEBIAN_FRONTEND=noninteractive                                      &&\
    TZ=America/Los_Angeles                                              &&\
    apt-get install -y --no-install-recommends                            \
    alsa-utils                                                            \
    apt-transport-https                                                   \
    ca-certificates                                                       \
    gnupg                                                                 \
    gvfs                                                                  \
    libasound2-plugins                                                    \
    libcanberra-gtk-module                                                \
    libcanberra-pulse                                                     \
    libcurl4                                                              \
    libcurl4-openssl-dev                                                  \
    libpcre3                                                              \
    libssl1.1                                                             \
    packagekit-gtk3-module                                                \
    wget                                                                  \
    xserver-xorg-video-intel                                            &&\
    rm -rf /var/lib/apt/lists/*

RUN wget -O - https://content.runescape.com/downloads/ubuntu/runescape.gpg.key \
    | apt-key add -                                                          &&\
    mkdir -p /etc/apt/sources.list.d                                         &&\
    echo "deb https://content.runescape.com/downloads/ubuntu trusty non-free"  \
         > /etc/apt/sources.list.d/runescape.list                            &&\
    apt-get update                                                           &&\
    apt-get install -y --no-install-recommends runescape-launcher            &&\
    rm -rf /var/lib/apt/lists/*

ENV HOME /home/runescape
RUN useradd --create-home --home-dir $HOME runescape \
    && gpasswd -a runescape audio                    \
    && chown -R runescape:runescape $HOME

WORKDIR $HOME
USER runescape
CMD /usr/bin/runescape-launcher
