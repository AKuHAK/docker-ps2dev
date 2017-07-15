FROM ubuntu

MAINTAINER AKuHAK <akuhak@gmail.com>

RUN export DEBIAN_FRONTEND="noninteractive" \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y autoconf bzip2 gcc git make patch vim wget zip zlib1g zlib1g-dev libucl1 libucl-dev

ENV PS2DEV /ps2dev
ENV PS2SDK $PS2DEV/ps2sdk
ENV PATH   $PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin

RUN git clone https://github.com/ps2dev/ps2toolchain /ps2toolchain \
    && cd /ps2toolchain \
    && ./toolchain.sh 1 \
    && rm -rf /ps2toolchain/build/* \
    && ./toolchain.sh 2 \
    && rm -rf /ps2toolchain/build/* \
    && ./toolchain.sh 3 \
    && rm -rf /ps2toolchain/build/* \
    && ./toolchain.sh 4 \
    && rm -rf /ps2toolchain/build/*

WORKDIR /src
CMD ["/bin/bash"]
