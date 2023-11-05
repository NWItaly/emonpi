#!/bin/bash
echo "-------------------------------------------------------------"
echo "EmonPi Firmware Update"
echo "-------------------------------------------------------------"
usrdir="/opt/openenergymonitor"

sudo service emonhub stop

echo "Start ATmega328 serial upload using avrdude with latest.hex"

echo "Discrete Sampling"

echo "avrdude -C $usrdir/EmonScripts/update/avrdude.conf -c arduino -D -p ATMEGA328P -P /dev/ttyAMA0 -b 115200 -U flash:w:latest.hex:i"
sleep 3
avrdude -C $usrdir/EmonScripts/update/avrdude.conf -c arduino -D -p ATMEGA328P -P /dev/ttyAMA0 -b 115200 -U flash:w:latest.hex:i
sleep 3

sudo service emonhub start