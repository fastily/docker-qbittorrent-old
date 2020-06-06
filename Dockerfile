FROM ubuntu:focal

ENV DEBIAN_FRONTEND="noninteractive"
ENV PYTHONUNBUFFERED=1

COPY qBittorrent.conf /root/.config/qBittorrent/qBittorrent.conf

RUN apt-get update && apt-get install -y software-properties-common && \
        add-apt-repository -y ppa:qbittorrent-team/qbittorrent-stable && \
        apt-get update && apt-get -y install qbittorrent-nox && \
        apt-get autoclean && apt-get autoremove -y && \
        rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

EXPOSE 33702 33702/udp 8080

VOLUME ["/root/Downloads"]

CMD [ "/usr/bin/qbittorrent-nox" ]