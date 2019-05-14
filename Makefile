#!/usr/bin/make -f

IMAGE=skpr/example
TAG=$(shell git describe --tags --always)

build:
	docker pull skpr/php-fpm:7.2-1.x
	docker pull skpr/php-cli:7.2-1.x
	docker pull skpr/nginx:1.x
	docker build -f Dockerfile-cli -t ${IMAGE}:${TAG}-cli .
	docker build -f Dockerfile-fpm -t ${IMAGE}:${TAG}-fpm --build-arg FROM=${IMAGE}:${TAG}-cli .
	docker build -f Dockerfile-nginx -t ${IMAGE}:${TAG}-nginx --build-arg FROM=${IMAGE}:${TAG}-cli .

push:
	docker push ${IMAGE}:${TAG}-cli
	docker push ${IMAGE}:${TAG}-fpm
	docker push ${IMAGE}:${TAG}-nginx

release: build push

.PHONY: build push release
