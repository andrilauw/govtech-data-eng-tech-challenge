# default args
IMAGE_NAME=data-pipeline-task
IMAGE_TAG=latest

.PHONY: all print build test run run-local run-debug exec destroy

print:
	echo $(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

test:
	pytest --cache-clear -vv --black --flake8

# For running on local machine
run-local:
	python -m src.main --datasource_folder ./datasource --result_folder ./result

run:
	docker run \
		-d \
		-it \
		-v ${PWD}/result:/workdir/result/ \
		$(IMAGE_NAME):$(IMAGE_TAG)

run-debug:
	docker run \
		--rm \
		-it \
		-v ${PWD}/result:/workdir/result/ \
		--entrypoint=/bin/bash \
		$(IMAGE_NAME):$(IMAGE_TAG)

exec:
	docker ps | grep $(IMAGE_NAME) | awk '{print $$1}' | xargs -o -I% docker exec -it % bash

destroy:
	docker ps | grep $(IMAGE_NAME) | awk '{print $$1}' | xargs docker rm --force
