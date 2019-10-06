FROM ubuntu:19.10 as builder
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y --no-install-recommends build-essential cmake clang openssl libssl-dev zlib1g-dev gperf wget git && \
	rm -rf /var/lib/apt/lists/*
WORKDIR /
RUN git clone --recursive https://github.com/ton-blockchain/ton
WORKDIR /ton

RUN mkdir build && \
	cd build && \
	cmake .. && \
	make

FROM ubuntu:19.10
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
	apt-get install -y --no-install-recommends openssl wget && \
	rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/ton-work/db && \
	mkdir -p /var/ton-work/db/static

COPY --from=builder /ton/build/lite-client/lite-client /usr/local/bin/
COPY --from=builder /ton/build/validator-engine/validator-engine /usr/local/bin/
COPY --from=builder /ton/build/validator-engine-console/validator-engine-console /usr/local/bin/
COPY --from=builder /ton/build/utils/generate-random-id /usr/local/bin/

WORKDIR /var/ton-work/db
COPY init.sh control.template ./
RUN chmod +x init.sh

VOLUME /var/ton-work/db
EXPOSE 43678 43679

ENTRYPOINT ["./init.sh"]
