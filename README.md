# pwn-docker

![Docker Pulls](https://img.shields.io/docker/pulls/mishrasunny174/pwn-docker)

These images can be used to spin up an exploit development environment based on the libc version quickly to test and develop binary exploitation ctf challenges.

## Usage

```
docker run --rm -v $PWD:/hack --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it mishrasunny174/pwn-docker:latest tmux
```

In the above command latest can be replaced by the glibc version required i.e., for glibc version 2.31 use mishrasunny174/pwn-docker:glibc-2.31.