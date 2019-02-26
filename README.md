# firecontrol
Power the fire control bell by using a raspberry pi with GPIO and relays.

## Firecontrol requirements

On one of 8 pins of the gpio interface:
* 1 pulse every second
* 1 pulse every 5 seconds
* 1 pulse every 10 seconds
* every 15 seconds three pulses a second apart
* every 20 seconds three pulses a second apart
* every 30 seconds three pulses a second apart
* every 40 seconds three pulses a second apart
* every 60 seconds three pulses a second apart

# Installation

1. ssh into the raspi
    ssh pi@<ip-address>
    password: raspberry
    pi@<pi-address>:~ $

2. Clone the repo

    git clone https://github.com:dherbst/firecontrol.git

3. Go into the folder and build and install

    cd firecontrol
    make build install

4. This should have installed the firecontrol command.  If you run it, it will start.

   $ firecontrol
