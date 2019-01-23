#!/usr/bin/make -f

IMAGE=skpr/example
TAG=$(shell git describe --tags --always)

build:
	docker build -f Dockerfile-nginx -t ${IMAGE}:${TAG}-nginx .
	docker build -f Dockerfile-fpm -t ${IMAGE}:${TAG}-fpm .
	docker build -f Dockerfile-cli -t ${IMAGE}:${TAG}-cli .

push:
	docker push ${IMAGE}:${TAG}-nginx
	docker push ${IMAGE}:${TAG}-fpm
	docker push ${IMAGE}:${TAG}-cli

.PHONY: build push
