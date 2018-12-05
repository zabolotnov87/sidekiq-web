# Standalone Sidekiq Web

Pack [Sidekiq Web](https://github.com/mperham/sidekiq/wiki/Monitoring#web-ui) to Docker Image.

# Build

```sh
$ make build
```

# Push

```sh
$ make push
```

# Run

```sh
docker run -e REDIS_URL=<your redis url> -p 9292:9292
```
