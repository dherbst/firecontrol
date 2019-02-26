package main

import (
	"github.com/dherbst/firecontrol"
	"log"
)

func main() {
	done := make(chan bool)

	log.Println("firecontrold starting...")
	firecontrol.StartServer()

	<-done
}
