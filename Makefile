default: lint

image=zabolotnov87/sidekiq-web
tag=latest
image_tag=$(image):$(tag)

lint:
	bin/rubocop

build:
	docker build --tag $(image_tag) .

push:
	docker push $(image_tag)
