all: glibc2.23 glibc2.27 glibc2.30 glibc2.31 latest

latest:
	cp Dockerfile.template Dockerfile.latest

glibc2.23:
	sed 's/latest/16.04/g' Dockerfile.template > Dockerfile.$@
	sed -i 's/seccomp-tools//g' Dockerfile.$@
	sed -i 's/xxd//g' Dockerfile.$@

glibc2.27:
	sed 's/latest/18.04/g' Dockerfile.template > Dockerfile.$@

glibc2.30:
	sed 's/latest/19.10/g' Dockerfile.template > Dockerfile.$@

glibc2.31:
	sed 's/latest/20.04/g' Dockerfile.template > Dockerfile.$@

clean:
	rm Dockerfile.glibc* Dockerfile.latest

test: glibc2.23 glibc2.27 glibc2.30 glibc2.31 latest
	for tag in $^; do docker build . -f Dockerfile.$$tag -t pwn-docker:$$tag; done