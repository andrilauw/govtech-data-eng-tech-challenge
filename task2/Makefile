# default args
IMAGE_NAME=database-design-task
IMAGE_TAG=latest

.PHONY: all print build run exec destroy

print:
	echo $(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

run:
	docker run \
		-d \
		-it \
		-e POSTGRES_PASSWORD=mysecretpassword \
		$(IMAGE_NAME):$(IMAGE_TAG)

exec:
	docker ps | grep $(IMAGE_NAME) | awk '{print $$1}' | xargs -o -I% docker exec -it % bash

destroy:
	docker ps | grep $(IMAGE_NAME) | awk '{print $$1}' | xargs docker rm --force
