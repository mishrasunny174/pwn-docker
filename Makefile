all: glibc2.23 glibc2.27 glibc2.31 latest

latest:
	cp Dockerfile.template Dockerfile.latest

glibc2.27:
	sed 's/latest/18.04/g' Dockerfile.template > Dockerfile.$@

glibc2.31:
	sed 's/latest/20.04/g' Dockerfile.template > Dockerfile.$@

clean:
	rm Dockerfile.glibc* Dockerfile.latest

test: glibc2.27 glibc2.30 latest
	for tag in $^; do docker build . -f Dockerfile.$$tag -t pwn-docker:$$tag; done
