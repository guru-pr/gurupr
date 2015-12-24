source 'https://rubygems.org'

# ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bourbon'
# gem 'compass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# frontend
gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'
gem 'font-awesome-rails', '~> 4.5.0'
gem 'slim', '~> 3.0.1'
gem 'redcarpet', '~> 3.3.1'
gem 'draper', '~> 2.1.0'

# Auth
gem 'omniauth-github'

# Friendly forms
gem 'simple_form'

# SEO
gem 'friendly_id'
gem 'route_translator'

# Collenction of locale settings
gem 'rails-i18n', '~> 4.0.0'

# Errors and exceptions
gem 'rollbar'

group :development, :test do
  # Environment variables
  gem 'dotenv-rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Setup easier than pg for development
  gem 'sqlite3'
end

group :test do
  # Specs
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara'

  # Coverage
  gem 'codeclimate-test-reporter', require: nil
end

group :production do
  # The twelve-factor app
  gem 'rails_12factor'

  # Webserver
  gem 'puma'
end
