FROM mlafeldt/ps2dev

MAINTAINER Wesley Castro <root670@gmail.com>

ENV GSKIT  $PS2DEV/gsKit

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
    && rm -rf /gsKit \

WORKDIR /src
CMD ["/bin/bash"]
