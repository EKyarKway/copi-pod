#!/bin/bash

echo -n "Enter serial device (e.g., /dev/ttyUSB0):"
read SERIAL_DEVICE
picocom -b 115200 ${SERIAL_DEVICE}
