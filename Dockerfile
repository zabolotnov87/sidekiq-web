FROM ruby:2.5.3-alpine
RUN apk add --no-cache \
  g++ \
  musl-dev \
  make
ENV APP /app
RUN mkdir -p $APP
WORKDIR $APP
COPY Gemfile* ./
RUN bundle install --without development
COPY config.ru $APP
CMD ["thin", "-a", "127.0.0.1", "-p", "9292", "-R", "config.ru", "start"]
