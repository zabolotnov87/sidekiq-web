default: lint

IMAGE ?= zabolotnov87/sidekiq-web
TAG ?= latest

lint:
	bin/rubocop -a

build:
	docker build --tag "${IMAGE}:${TAG}" .

push:
	docker push "${IMAGE}:${TAG}"
