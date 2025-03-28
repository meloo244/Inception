FROM debian:buster

RUN		apt-get update
RUN		apt-get install -y redis \
		&& rm -rf /var/lib/apt/lists/*

COPY ./tools/setup_redis.sh /tmp/setup_redis.sh

EXPOSE 6379

CMD ["sh", "/tmp/setup_redis.sh"]
