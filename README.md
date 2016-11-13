# Docker Image for PS2 Development with gsKit

[![](https://img.shields.io/docker/pulls/root670/ps2dev-gskit.svg?maxAge=604800)](https://hub.docker.com/r/root670/ps2dev-gskit/)

Cross-compile PS2 homebrew projects that depend on gsKit. Based on [mlafeldt/docker-ps2dev](https://github.com/mlafeldt/docker-ps2dev).

## Quick Start

Run this command in your project's root folder to build it inside a Docker
container:

```bash
docker run -it --rm -v "$PWD:/src" root670/ps2dev-gskit make
```

This will mount the current folder to `/src` in the container and then run
`make` inside `/src`. You may execute other commands, of course.

