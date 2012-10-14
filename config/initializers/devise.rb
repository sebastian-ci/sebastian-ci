require 'failure_app'
require 'omniauth-github'

Devise.setup do |config|
  require 'devise/orm/active_record'

  # config.http_authenticatable = true

  # set these or get a warning
  config.reset_password_within = 0
  config.case_insensitive_keys = []

  # config.omniauth :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user,repo"

  # for demo purposes, let's make it public only
  config.omniauth :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']

  config.warden do |manager|
    manager.failure_app = Sebastian::FailureApp
  end
end
