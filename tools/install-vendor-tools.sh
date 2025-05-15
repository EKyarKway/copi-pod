#!/bin/bash

echo "Downloading and installing ESP tools"
mkdir -p /opt/espressif/xtensa-esp32-elf-gcc
curl -s -L "https://github.com/espressif/crosstool-NG/releases/download/esp-12.2.0_20230208/xtensa-esp32-elf-12.2.0_20230208-x86_64-linux-gnu.tar.xz" |
  tar -C /opt/espressif/xtensa-esp32-elf-gcc --strip-components 1 -xJ || exit 1
echo "export PATH=/opt/espressif/xtensa-esp32-elf-gcc/bin:$PATH" >>~/.bashrc
pip install esptool >="4.8.1" || exit 1
