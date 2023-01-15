# Create a RuneLite docker image.

FROM ubuntu:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    default-jre \
    pulseaudio \
    wget &&\
    rm -rf /var/lib/apt/lists/*

ENV RUNELITE_URL="https://github.com/runelite/launcher/releases/latest/download/RuneLite.jar"
ADD runelite /usr/local/bin
RUN wget $RUNELITE_URL -P /usr/local/bin    \
    && chmod +x /usr/local/bin/RuneLite.jar \
    && chmod +x /usr/local/bin/runelite

ENV HOME /home/runescape
RUN useradd --create-home --home-dir $HOME runescape \
    && gpasswd -a runescape audio \
    && chown -R runescape:runescape $HOME
WORKDIR $HOME
USER runescape

CMD ["runelite"]
