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


Enclosure
---------
The enclosure is model AK-NW-40 from SZOMK:

  https://www.aliexpress.com/item/33043522751.html


Credits
-------
 * Jonathan Oxer <jon@oxer.com.au>
 * Tony Smith
 * Austin's Creations <https://www.austinscreations.ca/>
 * All the folks watching and commenting on the streams!


License
-------
Copyright 2020-2022 SuperHouse Automation Pty Ltd  www.superhouse.tv  

The hardware portion of this project is licensed under the TAPR Open
Hardware License (www.tapr.org/OHL). The "license" folder within this
repository contains a copy of this license in plain text format.

The software portion of this project is licensed under the Simplified
BSD License. The "licence" folder within this project contains a
copy of this license in plain text format.

