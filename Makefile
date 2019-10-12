default: lint

IMAGE ?= zabolotnov87/sidekiq-web
TAG ?= latest

lint:
	bin/rubocop

build:
	docker build --tag "${IMAGE}:${TAG}" .

push:
	docker push "${IMAGE}:${TAG}"
