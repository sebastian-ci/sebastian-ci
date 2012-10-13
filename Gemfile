source :rubygems

gem 'rails', '~> 3.2.8'

## Model
gem 'sqlite3'
gem 'devise'
gem 'omniauth-github'
gem 'omniauth-oauth2'
gem 'gh', git: 'git://github.com/rkh/gh'


## Controller

## Other
gem 'lograge'

## Deployment
group :production do
  gem 'unicorn'
end

## Chef
group :worker do
  gem 'vagrant'
  gem 'librarian'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
