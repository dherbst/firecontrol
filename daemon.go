package main

import (
	"log"
	"time"

	"gobot.io/x/gobot"
	"gobot.io/x/gobot/drivers/gpio"
	"gobot.io/x/gobot/platforms/raspi"
)

// StartServer begins the loop for signalling the gpio pins.
func StartServer() error {
	r := raspi.NewAdaptor()
	led := gpio.NewLedDriver(r, "7")

	work := func() {
		gobot.Every(1*time.Second, func() {
			led.Toggle()
		})
	}

	robot := gobot.NewRobot("blinkBot",
		[]gobot.Connection{r},
		[]gobot.Device{led},
		work,
	)

	robot.Start()

	go RunPinLoop(1*time.Second, 23)
	//go RunPinLoop(5*time.Second, 8)
	//go RunPinLoop(10*time.Second, 9)

	//go RunPin3Loop(15*time.Second, 10)
	//go RunPin3Loop(20*time.Second, 11)
	//go RunPin3Loop(30*time.Second, 12)
	//go RunPin3Loop(40*time.Second, 13)
	//go RunPin3Loop(600*time.Second, 14)

	return nil
}

// RunPinLoop runs in an interval for duration turning on the pin.
func RunPinLoop(duration time.Duration, pin int) {
	ticker := time.NewTicker(duration)
	for {
		select {
		case <-ticker.C:
			log.Printf("pin %v on\n", pin)
			log.Printf("pin %v off\n", pin)
		}
	}
}

// RunPin3Loop runs in an interval for duration turning on the pin.
func RunPin3Loop(duration time.Duration, pin int) {
	ticker := time.NewTicker(duration)
	for {
		select {
		case <-ticker.C:
			t2 := time.NewTicker(1 * time.Second)
			for i := 0; i < 3; i++ {
				select {
				case <-t2.C:
					log.Printf("pin %v on\n", pin)
					log.Printf("pin %v off\n", pin)
				}
			}
		}
	}
}
