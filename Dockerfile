FROM debian:jessie
MAINTAINER Paul Andrew Liljenberg "liljenberg.paul@gmail.com"

ADD crackloop /bin/crackloop
RUN chmod +x /bin/crackloop
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install \
    git-core \
    curl \
    make \
    libssl-dev \
    libnl-genl-3-dev \
    pkg-config \
    build-essential

RUN git clone https://github.com/aircrack-ng/aircrack-ng.git && \
	cd aircrack-ng && \
	make strip && \
	make install

VOLUME /data
WORKDIR /data

ENTRYPOINT ["/bin/crackloop"]
