docker build \
  --build-arg BUILD_FROM="homeassistant/amd64-base:latest" \
  -t local/my-test-addon \
  .

  docker run \
  --rm \
  --privileged \
  -v ${PWD}:/data \
  -p 8123:8123 \
  local/my-test-addon