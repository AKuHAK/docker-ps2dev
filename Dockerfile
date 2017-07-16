FROM ubuntu

MAINTAINER AKuHAK <akuhak@gmail.com>

RUN export DEBIAN_FRONTEND="noninteractive" \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y autoconf bzip2 gcc git make patch vim wget zip zlib1g zlib1g-dev libucl1 libucl-dev
RUN export DEBIAN_FRONTEND="noninteractive" \
    && apt-get install -y g++ texinfo libmpc-dev diffutils

ENV PS2DEV /ps2dev_new
ENV PS2SDK $PS2DEV/ps2sdk
ENV PATH   $PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin

RUN git clone https://github.com/uyjulian/ps2toolchain /ps2toolchain \
    && cd /ps2toolchain && git checkout uyjworking \
    && ./toolchain.sh 1 \
    && rm -rf /ps2toolchain/build/* \
    && ./toolchain.sh 2 \
    && rm -rf /ps2toolchain/build/* \
    && ./toolchain.sh 3 \
    && rm -rf /ps2toolchain/build/* \
    && ./toolchain.sh 4 \
    && rm -rf /ps2toolchain/build/* \
    && ./toolchain.sh 5 \
    && rm -rf /ps2toolchain/build/*

WORKDIR /src
CMD ["/bin/bash"]
