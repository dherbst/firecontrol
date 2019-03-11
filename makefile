.PHONY=all build
# MIT License
#
# Copyright (c) 2018-2019 Darrel Herbst
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

GOLANG=golang:1.12

all: pull-golang clean get build

clean:
	rm -rf vendor

pull-golang:
	docker pull ${GOLANG}

get:
	mkdir -p vendor/gobot.io/x vendor/github.com/hashicorp vendor/github.com/pkg vendor/github.com/sigurn vendor/periph.io/x
	cd vendor/gobot.io/x && git clone https://github.com/hybridgroup/gobot && cd gobot && git checkout v1.12.0
	cd vendor/github.com/hashicorp && git clone https://github.com/hashicorp/go-multierror && git clone https://github.com/hashicorp/errwrap
	cd vendor/github.com/pkg && git clone https://github.com/pkg/errors
	cd vendor/github.com/sigurn && git clone https://github.com/sigurn/utils && git clone https://github.com/sigurn/crc8
	cd vendor/periph.io/x && git clone https://github.com/google/periph

build:
	mkdir -p bin
	docker run -it --rm -v ${PWD}:/go/src/github.com/dherbst/firecontrol -w /go/src/github.com/dherbst/firecontrol ${GOLANG} go build -o bin/firecontrold cmd/firecontrold/firecontrold.go

runlocal:
	docker run -it --rm -v ${PWD}:/go/src/github.com/dherbst/firecontrol -w /go/src/github.com/dherbst/firecontrol ${GOLANG} bin/firecontrold
