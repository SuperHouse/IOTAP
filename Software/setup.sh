#!/bin/bash
# This setup script must be run with root privileges

# Change W5500_installed to no if Wiznet chip w5500 is not installed
W5500_installed='yes'

# Access point daemon, network bridge, and entropy generator
apt update
apt install hostapd bridge-utils haveged

if [[ $W5500_installed == "yes" ]]; then
  # Wiznet chip w5500 is installed:
  apt install python3-pip

  # GPIO library for controlling the Wiznet chip
  pip3 install gpiozero

  # Install W5500 overlay
  cp w5500-spi1.dtbo /boot/overlays/
  cp spi1off.dtbo /boot/overlays/

  # Install service control script
  cp iotap /etc/init.d/
  # Activate it at runlevel 3
  ln -s /etc/init.d/iotap /etc/rc3.d/S02iotap

  # Install LED rainbow binary as if it's a startup script (yuck)
  cp rgb-rainbow /etc/init.d/
  # Activate it at runlevel 3 after the AP script
  ln -s /etc/init.d/rgb-rainbow /etc/rc3.d/S03rgb-rainbow
fi

# Install network bridge configuration
cp br0 /etc/network/interfaces.d/

# Install service definition
cp iotapbr.service /etc/systemd/system/
# Enable and start the service
systemctl enable --now iotapbr.service

# Copy hostapd config and template auth file into place
cp hostapd.conf /etc/hostapd/
cp hostapd.wpa_psk /etc/hostapd/

# Set config file location for hostapd
echo "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\"" >> /etc/default/hostapd

# Set hostapd to start automatically on boot, and start it now:
systemctl unmask hostapd
systemctl enable hostapd
systemctl start hostapd

reboot &
