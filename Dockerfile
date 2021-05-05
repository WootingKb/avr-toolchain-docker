FROM rust:latest

MAINTAINER Simon Whyte <simon@wooting.io>

# Settings
ARG TARBALLS_PATH=contrib
ARG TOOLS_PATH=/tools

# Prepare directory for tools
RUN mkdir ${TOOLS_PATH}
WORKDIR ${TOOLS_PATH}

RUN apt update && apt install -y libusb-1.0-0 libusb-1.0-0-dev libudev-dev python3-pip 

RUN pip3 install intelhex

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1


# Install AVR toolchain
ARG AVR_TOOLCHAIN_TARBALL=avr8-gnu-toolchain-3.6.2.1759-linux.any.x86_64.tar.gz
ARG AVR_TOOLCHAIN_PATH=${TOOLS_PATH}/avr-toolchain
COPY ${TARBALLS_PATH}/${AVR_TOOLCHAIN_TARBALL} .
RUN tar -xvf ${AVR_TOOLCHAIN_TARBALL} \
        && mv `tar -tf ${AVR_TOOLCHAIN_TARBALL} | head -1` ${AVR_TOOLCHAIN_PATH} \
        && rm ${AVR_TOOLCHAIN_TARBALL}

ENV PATH="${AVR_TOOLCHAIN_PATH}/bin:${PATH}"

WORKDIR /build
