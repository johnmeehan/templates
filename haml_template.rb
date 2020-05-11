# frozen_string_literal: true

say('Haml setup')

gem 'haml-rails'

run 'bundle install'

# converts application.erb to haml
generate 'haml:application_layout convert'

# removes the erb version
run 'rm app/views/layouts/application.html.erb'
