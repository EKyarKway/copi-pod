FROM debian:11-slim

# Install Prequisites
RUN apt-get update && apt-get install -y \
  bison flex gettext texinfo libncurses5-dev libncursesw5-dev xxd \
  git gperf automake libtool pkg-config build-essential gperf genromfs \
  libgmp-dev libmpc-dev libmpfr-dev libisl-dev binutils-dev libelf-dev \
  libexpat1-dev gcc-multilib g++-multilib picocom u-boot-tools util-linux \
  kconfig-frontends python3-dev python3-venv python3-pip python3-setuptools wget \
  locales curl unzip

RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Install Toolchain
RUN apt-get install -y gcc-arm-none-eabi binutils-arm-none-eabi ninja-build cmake picocom libusb-1.0-0

RUN pip install kconfiglib

# Set Environment Variables
ENV APP_PATH=/app
ENV NUTTX_PATH=${APP_PATH}/nuttx
ENV NUTTX_APPS_PATH=${APP_PATH}/apps

# Install Vendor Tools
ARG VENDOR=nordic
ENV VENDOR=${VENDOR}

COPY tools/install-vendor-tools.sh /install.sh
RUN chmod +x /install.sh
RUN /install.sh

# Start NuttX
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ] 
