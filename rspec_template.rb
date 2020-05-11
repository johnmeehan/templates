# frozen_string_literal: true

say('RSpec, FactoryBot, Guard setup')

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

gem_group :development do
  gem 'guard-rspec', require: false
end

run 'bundle install'

generate 'rspec:install'

run 'bundle exec guard init rspec'
