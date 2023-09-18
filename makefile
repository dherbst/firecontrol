.PHONY=all build clean pull-golang get build runlocal install
# MIT License
#
# Copyright (c) 2018-2023 Darrel Herbst
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

GOLANG=golang:1.20

all: pull-golang clean get build

clean:
	rm bin/firecontrold

pull-golang:
	docker pull ${GOLANG}

build:
	mkdir -p bin
	docker run -it --rm -v ${PWD}:/go/src/github.com/dherbst/firecontrol -w /go/src/github.com/dherbst/firecontrol ${GOLANG} go build -o bin/firecontrold *.go

runlocal:
	docker run -it --rm -v ${PWD}:/go/src/github.com/dherbst/firecontrol -w /go/src/github.com/dherbst/firecontrol ${GOLANG} bin/firecontrold

install:
	cp bin/firecontrold /usr/local/bin/firecontrold
