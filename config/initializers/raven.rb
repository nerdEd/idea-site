require 'raven'

Raven.configure do |config|
  config.dsn = ENV['SENTRY_URL']
end if ENV['SENTRY_URL'].present?

