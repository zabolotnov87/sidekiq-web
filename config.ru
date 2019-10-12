# frozen_string_literal: true

require 'sidekiq/web'

redis_url = ENV.fetch('REDIS_URL')
route = ENV.fetch('ROUTE')
if (basic_auth_enabled = ENV.fetch('BASIC_AUTH_ENABLED', false))
  password_sha = ::Digest::SHA256.hexdigest(ENV.fetch('PASSWORD'))
  login_sha = ::Digest::SHA256.hexdigest(ENV.fetch('LOGIN'))
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_url }
end

if basic_auth_enabled
  Sidekiq::Web.use Rack::Auth::Basic do |input_login, input_password|
    input_login_sha = ::Digest::SHA256.hexdigest(input_login)
    input_password_sha = ::Digest::SHA256.hexdigest(input_password)
    Rack::Utils.secure_compare(login_sha, input_login_sha) &
      Rack::Utils.secure_compare(password_sha, input_password_sha)
  end
end

run Rack::URLMap.new(route => Sidekiq::Web)
