# pwn-docker

![Docker Pulls](https://img.shields.io/docker/pulls/mishrasunny174/pwn-docker) [![Build and Push to dockerhub](https://github.com/mishrasunny174/pwn-docker/actions/workflows/dockerhub.yml/badge.svg)](https://github.com/mishrasunny174/pwn-docker/actions/workflows/dockerhub.yml) [![Build and push to github package repository](https://github.com/mishrasunny174/pwn-docker/actions/workflows/build.yml/badge.svg)](https://github.com/mishrasunny174/pwn-docker/actions/workflows/build.yml)

These images can be used to spin up an exploit development environment to test and develop binary exploitation ctf challenges.

## Usage

```bash
docker run --rm -v $PWD:/hack --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it mishrasunny174/pwn-docker:latest
```