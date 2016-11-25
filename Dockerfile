FROM mlafeldt/ps2dev

MAINTAINER Wesley Castro <root670@gmail.com>

ENV GSKIT  $PS2DEV/gsKit

# Install gsKit and common dependencies
RUN git clone git://github.com/ps2dev/ps2sdk-ports.git /ports \
    && cd /ports/zlib \
    && make install \
    && cd /ports/libjpeg \
    && make install \
    && cd /ports/libpng \
    && make install \
    && cd /ports/libtiff \
    && make all \
    && make install \

    && git clone git://github.com/ps2dev/gsKit /gsKit \
    && cd /gsKit \
    && ./setup.sh \

    && rm -rf /ports \
    && rm -rf /gsKit

# Install ps2-packer
RUN apt-get update \
    && apt-get install -y zlib1g-dev libucl-dev \
    && git clone git://github.com/ps2dev/ps2-packer.git /ps2-packer \
    && cd /ps2-packer \
    && make install \
    && apt-get remove -y zlib1g-dev libucl-dev \
    && rm -rf /ps2-packer /var/lib/apt/lists/* \

WORKDIR /src
CMD ["/bin/bash"]
