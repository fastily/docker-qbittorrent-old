# docker-qbittorrent

Dockerized qbittorrent-nox

## Build and run
#### docker cli
```bash
# build
docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g) --build-arg USERNAME=$(whoami) -t qbt-web:0.0.1 .

# run in background
docker run -d -p 8080:8080 -p 33702:33702 -p 33702:33702/udp -v "PATH_TO_YOUR_DOWNLOAD_FOLDER:/home/$(whoami)/Downloads" qbt-web:0.0.1

# run w/ live output
docker run -t -p 8080:8080 -p 33702:33702 -p 33702:33702/udp -v "PATH_TO_YOUR_DOWNLOAD_FOLDER:/home/$(whoami)/Downloads" qbt-web:0.0.1
```

#### docker-compose
```bash
# start and run
USERNAME=$(whoami) UID=$(id -u) GID=$(id -g) DLFOLDER=PATH_TO_YOUR_DOWNLOAD_FOLDER docker-compose up -d

# logs - in the same directory
docker-compose logs -f -t

# shutdown
docker-compose down
```