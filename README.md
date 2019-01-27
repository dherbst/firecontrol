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

Once you have the raspi set up with the gpio board, telnet into the raspi and clone this repo, then install the firecontrol system.

    python setup.py install
