## Software setup for IoT-AP

 * Download Raspberry Pi Imager.
 * Insert an SD card into your computer.
 * For operating system, select "Raspberry Pi OS (other) -> Raspberry Pi OS Lite (32-bit)"
 * Select your SD card as the destination.
 * Click the cog icon to open the config options menu.
 * Set a suitable hostname, such as "iotap-1.local".
 * Enable SSH, with either a password or a public key.
 * Set a username and password.
 * Configure wireless LAN as a client of your existing network. This is needed for setup!
 * Set the Wireless LAN country option.
 * Save.
 * Write.
 * When finished, eject the card and put it in your IoT-AP.
 * Power it up.
 * After a couple of minutes, SSH to it: "ssh iotap-1.local" or similar.
 * Copy this whole folder to it from your local computer: "scp -r Software pi@iotap-1.local:" or similar.
 * On the AP, go into the copied directory: "cd Software".
 * Run the setup script: "sudo ./setup.sh".
 * Reboot the AP: "sudo reboot".
 * After a few minutes the LEDs will start blinking and the AP will be online.

HOWEVER, there is a bug: the bridge doesn't have the interfaces added properly.
This has to be run manually:
  sudo brctl addif br0 eth0

## Usage

 * To check connected clients: " sta_all"
 * To add a client, edit "/etc/hostapd/hostapd.wpa_psk"
 * Then "sudo systemctl restart hostapd"
 * To check bridge status: "brctl show"

Not working:
pi@iotap-2:~ $ brctl show
bridge name	bridge id		STP enabled	interfaces
br0		8000.e45f01758d5e	no		wlan0

Working:
pi@iotap-1:~ $ brctl show
bridge name	bridge id		STP enabled	interfaces
br0		8000.b827eb19ea24	no		eth0
							wlan0

sudo hostapd_cli sta_all
sudo hostapd_cli list_sta
cat /etc/default/hostapd
sudo echo "DAEMON_CONF=\"/etc/hostapd/hostapd.conf\"" >> /etc/default/hostapd
