IMAGE_DEV="diegograssato/samba4-home-assistant"
IMAGE_PROD="diegograssato/samba4-home-assistant"
CONATAINER_DEV="samba4-home-assistant"

.PHONY: debug \
	release \
	clean

debug: clean \
	test

test:
	docker build \
		--build-arg BUILD_FROM="homeassistant/amd64-base:latest" \
		-t $(IMAGE_DEV) \
		--rm .
	docker run --name $(CONATAINER_DEV) --rm \
				-t $(IMAGE_DEV)

release:
	docker build -t $(IMAGE_PROD):$(shell cat VERSION) .
	docker push $(IMAGE_PROD):$(shell cat VERSION)

clean:
	docker stop $(CONATAINER_DEV) || true
	docker rm $(CONATAINER_DEV) || true