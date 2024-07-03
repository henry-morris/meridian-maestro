#!/bin/bash

# Device path
DEVICE="/dev/ttyUSB0"

# Wait for the device to be available
while [ ! -e "$DEVICE" ]; do
  sleep 0.1
done

# Configure the serial port
stty -F "$DEVICE" 9600

# Send commands to the serial device
echo -e "CD\r" > "$DEVICE"
sleep 0.2
echo -e "VN90\r" > "$DEVICE"

# Shut down in 5 minutes
sleep 300
