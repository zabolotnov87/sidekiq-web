# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq/web'

Sidekiq.configure_client do |config|
  redis_url = ENV.fetch('REDIS_URL')
  config.redis = { url: redis_url }
end

run Rack::URLMap.new('/sidekiq' => Sidekiq::Web)
