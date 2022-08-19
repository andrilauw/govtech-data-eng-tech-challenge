# default args
IMAGE_NAME=data-pipeline-task
IMAGE_TAG=latest

.PHONY: all print build test run run-local

print:
	echo $(IMAGE_NAME):$(IMAGE_TAG)

build:
	docker build -t $(IMAGE_NAME):$(IMAGE_TAG) .

test:
	pytest --cache-clear -vv --black --flake8

# For running on local machine
run-local:
	python -m src.main

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
