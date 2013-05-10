# encoding: utf-8

source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'bootstrap-sass', '~> 2.3.1.0'
gem 'bourbon', '~> 3.1.6'
gem 'devise', '~> 2.2.4'
gem 'exception_notification', '~> 3.0.1'
gem 'jquery-rails', '~> 2.2.1'
gem 'mysql2', '~> 0.3.11'
gem 'pygments.rb', '~> 0.5.0'
gem 'redcarpet', '~> 2.2.2'
gem 'simple_form', '~> 2.1.0'
gem 'slim-rails', '~> 1.1.1'
gem 'sunspot_rails', '~> 2.0.0'
gem 'yettings', '~> 0.1.1'


group :assets do
  gem 'coffee-rails', '~> 3.2.2'
  gem 'font-awesome-sass-rails', '~> 3.0.2.2'
  gem 'sass-rails', '~> 3.2.6'
  gem 'uglifier', '~> 2.1.0'
end

group :development, :production do
  gem 'backup', '~> 3.4.0'
  gem 'fog', '~> 1.11.1' # "backup" で使用
  gem 'whenever', '~> 0.8.2', require: false
end

group :development, :test do
  gem 'capistrano', '~> 2.15.4'
  gem 'capistrano_colors', '~> 0.5.5'
  gem 'capistrano-ext', '~> 1.2.1'
  gem 'capybara', '~> 2.1.0'
  gem 'capybara-webkit', '~> 0.14.2'
  gem 'database_cleaner', '~> 0.9.1'
  gem 'factory_girl_rails', '~> 4.2.1'
  gem 'rspec-rails', '~> 2.13.1'
  gem 'rvm-capistrano', '~> 1.3.0'
  gem 'sunspot_solr', '~> 2.0.0'
end

group :development do
  gem 'awesome_print', '~> 1.1.0'
  gem 'progress_bar', '~> 1.0.0'
  gem 'pry-rails', '~> 0.3.0'
  gem 'quiet_assets', '~> 1.0.2'
  gem 'thin', '~> 1.5.1'
  gem 'zeus', '~> 0.13.3'
end

group :production do
  gem 'unicorn', '~> 4.6.2'
end
