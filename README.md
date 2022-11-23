# Home Assistant Add-on: Samba4 4 share

Share your configuration over the network using Windows file sharing.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Supports armhf Architecture][armhf-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports i386 Architecture][i386-shield]

## About

This Add-on allows you to enable file sharing across different operating systems over a network.
It lets you access your config files with Windows and macOS devices.

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg

docker run \
  --rm \
  -it \
  --name builder \
  --privileged \
  -v ${PWD}:/data \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  homeassistant/amd64-builder \
  -t /data \
  --all \
  --test \
  -i my-test-addon-amd64 \
  -d local
