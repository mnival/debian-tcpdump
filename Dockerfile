FROM debian:stable-20220418-slim

LABEL maintainer="Michael Nival <docker@mn-home.fr>" \
	name="debian-tcpdump" \
	description="Debian Stable with the package tcpdump" \
	docker.cmd="docker run -it --rm --net=container:container_name mnival/debian-tcpdump tcpdump -AA -nn -s 65535"

RUN printf "deb http://ftp.debian.org/debian/ stable main\ndeb http://ftp.debian.org/debian/ stable-updates main\ndeb http://security.debian.org/ stable-security main\n" >> /etc/apt/sources.list.d/stable.list && \
	cat /dev/null > /etc/apt/sources.list && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt update && \
	apt -y --no-install-recommends full-upgrade && \
	apt install -y --no-install-recommends tcpdump && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/log/alternatives.log /var/log/dpkg.log /var/log/apt/ /var/cache/debconf/*-old

CMD ["tcpdump"]
