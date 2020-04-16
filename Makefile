IMAGE := ciscosso/atlantis
BUILD_TAG := latest
RELEASE_TAG := $(shell git describe --tags 2>/dev/null || echo test)

.PHONY: docker-build
docker-build:
	docker build . -t $(IMAGE):$(BUILD_TAG)

.PHONY: docker-push
docker-push:
	echo "$${DOCKER_PASSWORD}" | docker login -u "$${DOCKER_USERNAME}" --password-stdin
	docker push $(IMAGE):$(BUILD_TAG)
	docker tag $(IMAGE):$(BUILD_TAG) $(IMAGE):$(RELEASE_TAG)
	docker push $(IMAGE):($RELEASE_TAG)
