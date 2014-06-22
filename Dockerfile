FROM debian:jessie
MAINTAINER Paul Andrew Liljenberg "liljenberg.paul@gmail.com"

ADD crackloop /bin/crackloop
RUN chmod +x /bin/crackloop
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install \
    git-core \
    make \
    sudo \
    libssl-dev \
    pkg-config \
    build-essential

RUN git clone git://git.code.sf.net/p/crunch-wordlist/code crunch && \
	cd crunch && \
	make && \
	make install

RUN git clone https://github.com/aircrack-ng/aircrack-ng.git && \
	cd aircrack-ng && \
	make && \
	make install

VOLUME /data
WORKDIR /data

CMD ["/bin/crackloop"]
