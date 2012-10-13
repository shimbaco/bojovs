# encoding: utf-8

source 'https://rubygems.org'

gem 'rails'

# Assets
gem 'bootstrap-sass'
gem 'jquery-rails'

# Controllers
gem 'devise'

# Models
gem 'mysql2'
gem 'sunspot_rails'

# Views
gem 'bourbon'
gem 'pygments.rb'
gem 'redcarpet'
gem 'simple_form'
gem 'slim-rails'

# Utils
gem 'exception_notification'
gem 'yettings'


group :assets do
  gem 'coffee-rails'
  gem 'font-awesome-sass-rails'
  gem 'sass-rails'
  gem 'uglifier'
end

group :development, :production do
  gem 'backup'
  gem 'fog', '~> 1.4.0' # "backup" で使用
  gem 'whenever', require: false
end

group :development, :test do
  gem 'capistrano'
  gem 'capistrano_colors'
  gem 'capistrano-ext'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'rvm-capistrano'
  gem 'spork-rails'
  gem 'sunspot_solr'
end

group :development do
  gem 'awesome_print'
  gem 'growl'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'progress_bar'
  gem 'pry-rails'
  gem 'quiet_assets'
  gem 'rb-fsevent', '~> 0.9.1' # Guard で使用
  gem 'thin'
end

group :production do
  gem 'unicorn'
end
