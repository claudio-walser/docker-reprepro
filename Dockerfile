# Dockerfile for reprepro
# Version 0.0.1
FROM debian:latest

MAINTAINER Claudio Walser <claudio.walser@srf.ch>

RUN apt-get update && apt-get upgrade -y; \
	apt-get install -y gnupg reprepro openssh-server nginx expect; \
	adduser --system --group --shell /bin/bash --uid 1000 --disabled-password reprepro;

VOLUME ["/home/reprepro/.ssh"]

CMD /usr/sbin/service ssh start && /usr/sbin/service nginx start && /bin/bash
