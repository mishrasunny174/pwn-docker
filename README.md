# pwn-docker

![Docker Pulls](https://img.shields.io/docker/pulls/mishrasunny174/pwn-docker)
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/mishrasunny174/pwn-docker/Main%20Workflow)](https://github.com/mishrasunny174/pwn-docker/actions?query=workflow%3AMain%20Workflow)

These images can be used to spin up an exploit development environment based on the libc version quickly to test and develop binary exploitation ctf challenges.

## Usage

```bash
docker run --rm -v $PWD:/hack --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it mishrasunny174/pwn-docker:latest
```

In the above command latest can be replaced by the glibc version required i.e., for glibc version 2.31 use mishrasunny174/pwn-docker:glibc-2.31.