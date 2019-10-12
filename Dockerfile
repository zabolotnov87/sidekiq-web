FROM ruby:2.6.5-alpine
RUN apk add --no-cache \
  g++ \
  musl-dev \
  make \
  tzdata
ENV APP /app
RUN mkdir -p $APP
ENV PATH $APP/bin:$PATH
WORKDIR $APP
RUN gem install bundler
COPY Gemfile* ./
RUN bundle install --without development
COPY . ./
CMD ["start"]
