# Standalone Sidekiq Web

Pack [Sidekiq Web](https://github.com/mperham/sidekiq/wiki/Monitoring#web-ui) to Docker Image.

# Build

```sh
$ make build image_tag=sidekiq-web:latest
```

# Push

```sh
$ make push image_tag=sidekiq-web:latest
```

# Run

```sh
$ docker run --rm -it sidekiq-web:latest cli help start
```
