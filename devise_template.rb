# rails app:template LOCATION=~/devise_template.rb

gem 'devise'

run 'bundle install'

generate('devise:install')

environment('config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }', env: 'development')

if yes?("Do you want to generate a User Model (first_name, last_name)")
  generate(:model, 'user', 'first_name:string', 'last_name:string')
end

generate(:devise, 'User')


