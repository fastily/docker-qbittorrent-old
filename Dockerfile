FROM ubuntu:focal

ENV DEBIAN_FRONTEND="noninteractive"
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y software-properties-common && \
        add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable && \
        apt-get update && apt-get -y install qbittorrent-nox && \
        apt-get autoclean && apt-get autoremove -y && \
        rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

EXPOSE 33702 33702/udp 8080

ARG USERNAME=foo
ARG UID=1234
ARG GID=1234

RUN groupadd -g $GID -o $USERNAME && useradd -m -u $UID -g $GID -o -s /bin/bash $USERNAME

COPY qBittorrent.conf "/home/$USERNAME/.config/qBittorrent/qBittorrent.conf"
RUN  chown -R $USERNAME "/home/$USERNAME/.config/"
VOLUME ["/home/$USERNAME/Downloads"]

USER $USERNAME

CMD [ "/usr/bin/qbittorrent-nox" ]