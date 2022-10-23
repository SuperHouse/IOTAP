IoT WiFi Access Point
=====================

Simple WiFi devices typically don't support enterprise level WiFi
authentication, which means they all share a single password. If
an IoT device is compromised, the password can be exposed and changing
the password on many devices is painful.

This project aims to create a WiFi access point that supports
personal pre-shared keys (PPSK) so that each device can be given its
own password. Access privileges for any device can then be revoked
without requiring changes to any other device.

More information is available at:

  https://www.superhouse.tv/iotap


Hardware
--------
The "Hardware" directory contains the PCB design as an EAGLE project.


Firmware
--------
The "Firmware" directory contains example firmware as an Arduino
project.


Enclosure
---------
The "Enclosure" directory contains STLs for a case that can be
3D-printed.

The two halves of the case should be printed with the flat face down to
the printer bed.

The case can be held shut by M3 bolts.


Credits
-------
 * Jonathan Oxer <jon@oxer.com.au>


License
-------
Copyright 2020-2021 SuperHouse Automation Pty Ltd  www.superhouse.tv  

The hardware portion of this project is licensed under the TAPR Open
Hardware License (www.tapr.org/OHL). The "license" folder within this
repository contains a copy of this license in plain text format.

The software portion of this project is licensed under the Simplified
BSD License. The "licence" folder within this project contains a
copy of this license in plain text format.

