FROM --platform=linux/amd64 rust:latest 

MAINTAINER Simon Whyte <simon@wooting.io>


RUN apt update && apt install -y libusb-1.0-0 libusb-1.0-0-dev libudev-dev python3-pip build-essential

RUN pip3 install intelhex meson ninja

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

ARG ARM_TOOLCHAIN_VERSION=10.3-2021.10
ARG ARM_TOOLCHAIN_NAME=gcc-arm-none-eabi-${ARM_TOOLCHAIN_VERSION}
ARG ARM_TOOLCHAIN_TARBALL=${ARM_TOOLCHAIN_NAME}-x86_64-linux.tar.bz2

RUN curl -o ${ARM_TOOLCHAIN_TARBALL} -SL https://developer.arm.com/-/media/Files/downloads/gnu-rm/${ARM_TOOLCHAIN_VERSION}/${ARM_TOOLCHAIN_TARBALL} 
RUN tar xjf ${ARM_TOOLCHAIN_TARBALL} -C /opt
run rm ${ARM_TOOLCHAIN_TARBALL}


ENV PATH="/opt/${ARM_TOOLCHAIN_NAME}/bin:${PATH}"


WORKDIR /build
