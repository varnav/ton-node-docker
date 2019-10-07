# Telegram Open Network Node

[![Test status](https://travis-ci.com/varnav/ton-node.svg?branch=master)](https://travis-ci.com/varnav/ton-node) [![Docker Pulls](https://img.shields.io/docker/pulls/varnav/ton-node.svg)](https://hub.docker.com/r/varnav/ton-node)

Dockerfile for Telegram Open Network Node

https://test.ton.org

#### Open firewall

`ufw allow 43678/udp`

#### Build

It's recommended to build this on same machine where you plan to run it.

```bash
git clone https://github.com/varnav/ton-node-docker.git
cd ton-node-docker
docker build -t varnav/ton-node .
```

#### Run interactively

```bash
docker run --rm -it --name ton-testnet -v ton-db:/var/ton-work/db -e "CONSOLE_PORT=43678" -e "LITESERVER=true" -e "LITE_PORT=43679" -p 43678:43678 -p 43679:43679 varnav/ton-node
```

#### Run as daemon

```bash
docker run -d --restart=unless-stopped --name ton-testnet -v ton-db:/var/ton-work/db -e "CONSOLE_PORT=43678" -e "LITESERVER=true" -e "LITE_PORT=43679" -p 43678:43678 -p 43679:43679 varnav/ton-node
```

#### Clean all

```bash
docker rm --force ton-testnet
docker volume rm ton-db
docker image rm varnav/ton-node
```

#### License

MIT

#### Thanks to

akme  
copperbits