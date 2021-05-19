# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'activerecord-import'
gem 'ar_lazy_preload'
gem 'aws-sdk-s3', '~> 1.14'
gem 'clearance'
gem 'doorkeeper'
gem 'enumerize'
gem 'faraday'
gem 'globalize'
gem 'graphiql-rails'
gem 'graphql'
gem 'marcel', '~> 0.3'
gem 'paper_trail'
gem 'pg'
gem 'puma', '~> 4.3'
gem 'rack-cors'
gem 'rails', '~> 6.0.0.rc1'
gem 'rest-client'
gem 'shrine', '~> 2.0'
gem 'sidekiq'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
end

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
