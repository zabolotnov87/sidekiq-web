FROM ruby:2.7.1-alpine
RUN apk add --no-cache \
  g++ \
  musl-dev \
  make \
  tzdata
ENV APP /app
ENV PATH $APP/bin:$PATH
RUN mkdir -p $APP
WORKDIR $APP
RUN gem install bundler
COPY Gemfile* ./
RUN bundle config set without 'development' && bundle install
COPY . ./
