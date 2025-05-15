#!/bin/bash

cd ${NUTTX_PATH}
make flash ESPTOOL_PORT=/dev/ttyUSB0 ESPTOOL_BINDIR=./
