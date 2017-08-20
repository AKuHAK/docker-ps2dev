# A Docker Image for PS2 Development

[![](https://img.shields.io/docker/pulls/akuhak/docker-ps2dev.svg)](https://hub.docker.com/r/akuhak/docker-ps2dev/)

Cross-compile your PS2 homebrew projects inside a Docker container based on
[ps2toolchain](https://github.com/ps2dev/ps2toolchain).

## Quick Start

Run this command in your project's root folder to build it inside a Docker
container:

```bash
docker run -it --rm -v "$PWD:/src" akuhak/docker-ps2dev make
```

This will mount the current folder to `/src` in the container and then run
`make` inside `/src`. You may execute other commands, of course.

Omit the command to get a login shell (`/bin/bash`) in the running container:

```bash
docker run -it --rm -v "$PWD:/src" akuhak/docker-ps2dev
```

## Continuous Integration

With the Docker image in hand, you can also build and test your PS2 applications
on CI platforms. Here's an example configuration for Travis CI:

```yaml
# .travis.yml
language: c

sudo: required

services:
  - docker

script: docker run -it --rm -v "$PWD:/src" akuhak/docker-ps2dev make test
```

## Author

This project is being developed by [Mathias Lafeldt](https://twitter.com/mlafeldt).
And heavily modified by [AKuHAK]
