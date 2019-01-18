#!/usr/bin/make -f

IMAGE=skpr/example
TAG=$(shell git describe --tags --always)

build:
	docker build -f Dockerfile-cli -t ${IMAGE}:${TAG}-cli .
	docker build -f Dockerfile-fpm -t ${IMAGE}:${TAG}-fpm --build-arg FROM=${IMAGE}:${TAG}-cli .
	docker build -f Dockerfile-nginx -t ${IMAGE}:${TAG}-nginx --build-arg FROM=${IMAGE}:${TAG}-cli .

release: build
	docker push ${IMAGE}:${TAG}-cli
	docker push ${IMAGE}:${TAG}-fpm
	docker push ${IMAGE}:${TAG}-nginx

.PHONY: build release
