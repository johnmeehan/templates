# frozen_string_literal: true

# https://avdi.codes/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/

say('Database cleaner')

gem_group :test do
  gem 'database_cleaner-active_record'
end

run 'bundle install'

file 'spec/support/database_cleaner.rb', <<~CONFIG
  RSpec.configure do |config|
    config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
    end
    config.before(:each) do
      DatabaseCleaner.strategy = :transaction
    end
    config.before(:each, js: true) do
      DatabaseCleaner.strategy = :truncation
    end
    config.before(:each) do
      DatabaseCleaner.start
    end
    config.after(:each) do
      DatabaseCleaner.clean
    end
  end
CONFIG

gsub_file 'spec/rails_helper.rb', 'config.use_transactional_fixtures = true', 'config.use_transactional_fixtures = false'
