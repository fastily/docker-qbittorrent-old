# docker-qbittorrent

Dockerized qbittorrent-nox

## Build and run
You can use either docker cli or docker-compose

#### docker cli
```bash
# build
docker build -t qbt-web:1.0 .

# run in background
docker run -d -p 8080:8080 -p 33702:33702 -p 33702:33702/udp -v PATH_TO_YOUR_DOWNLOAD_FOLDER:/root/Downloads qbt-web:1.0

# run w/ live output
docker run -t -p 8080:8080 -p 33702:33702 -p 33702:33702/udp -v PATH_TO_YOUR_DOWNLOAD_FOLDER:/root/Downloads qbt-web:1.0
```

#### docker-compose
```bash
# start and run
DLFOLDER=PATH_TO_YOUR_DOWNLOAD_FOLDER docker-compose up -d

# logs - in the same directory
docker-compose logs -f -t

# shutdown
docker-compose down
```