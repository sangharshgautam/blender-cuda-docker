FROM nvidia/cuda:10.0-devel-ubuntu18.04
MAINTAINER Zoltán Fraknói

ENV BLENDER_MAJOR 2.79
ENV BLENDER_VERSION 2.79b
ENV BLENDER_BZ2_URL http://ftp.nluug.nl/pub/graphics/blender/release/Blender${BLENDER_MAJOR}/blender-${BLENDER_VERSION}-linux-glibc219-x86_64.tar.bz2

RUN apt-get update && \
	apt-get install -y \
		curl wget nano \
		bzip2 libfreetype6 libgl1-mesa-dev \
		libglu1-mesa \
		libxi6 libxrender1 && \
	apt-get -y autoremove

# Install blender

RUN mkdir /usr/local/blender && \
	wget --quiet ${BLENDER_BZ2_URL} -O blender.tar.bz2 && \
	tar -jxvf blender.tar.bz2 -C /usr/local/blender --strip-components=1 && \
	rm blender.tar.bz2


VOLUME /media


ENTRYPOINT ["/usr/local/blender/blender", "-b"]
