# Create a RuneLite docker image.

FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    default-jre \
    wget

# TODO: At the present time (04/17/2022),
# https://github.com/runelite/launcher/releases/latest/download/RuneLite.jar
# is broken. When the RuneLite team fixes the issue, you may want to correct
# the RUNELITE_URL so that it grabs the latest release.
ENV RUNELITE_URL="https://github.com/runelite/launcher/releases/download/2.4.2/RuneLite.jar"
ADD osrs         /usr/local/bin
RUN wget $RUNELITE_URL -P /usr/local/bin    \
    && chmod +x /usr/local/bin/RuneLite.jar \
    && chmod +x /usr/local/bin/osrs

ENV HOME /home/runescape
RUN useradd --create-home --home-dir $HOME runescape \
    && gpasswd -a runescape audio \
    && chown -R runescape:runescape $HOME
WORKDIR $HOME
USER runescape

CMD ["osrs"]
