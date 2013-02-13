source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


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

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'


group :development, :test do
  gem 'sqlite3'

  # for testing
  gem 'rspec-rails'
  gem 'guard-rspec', '1.2.1'
end

# Test gems on Mac OS X
group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'rb-fsevent', require: false
  gem 'growl'
end

# Test gems on Windows
#group :test do
#  gem 'capybara', '1.1.2'
#  gem 'rb-fchange', '0.0.5'
#  gem 'rb-notifu', '0.0.4'
#  gem 'win32console', '1.3.0'
#end

# production database
group :production do
  gem 'pg'
end

# authorization
gem 'cancan'

# For creating fake stuff
# for server testing reason, I still left the faker gem here for deployment
gem 'faker'

# pagination
gem 'will_paginate', '~>3.0'