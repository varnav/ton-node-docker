# Telegram Open Network Node

[![Test status](https://api.travis-ci.org/varnav/ton-node-docker.svg?branch=master)](https://travis-ci.org/varnav/ton-node-docker) [![Docker Pulls](https://img.shields.io/docker/pulls/varnav/ton-node.svg)](https://hub.docker.com/r/varnav/ton-node)

Dockerfile for Telegram Open Network Node

https://test.ton.org

#### Open firewall

`ufw allow 43678/udp`

#### Get your public IP

`host myip.opendns.com resolver1.opendns.com`

#### Build

It's recommended to build this on same machine where you plan to run it.

```git clone https://github.com/varnav/ton-node-docker.git
cd ton-node-docker
docker build -t varnav/ton-node .
```

#### Run (use public IP from step above)

```docker run -d --name ton-testnet -v ton-db:/var/ton-work/db -e "PUBLIC_IP=111.111.111.111" -e "CONSOLE_PORT=43678" -e "LITESERVER=true" -e "LITE_PORT=43679" -p 43678:43678 -p 43679:43679 varnav/ton-node```

#### Thanks to

akme
copperbits