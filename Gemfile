source 'https://rubygems.org'

ruby '2.3.5'

gem 'faker'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'bourbon', '~> 4.3'
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster.
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Action Cable dependencies for the Redis adapter
gem 'redis', '~> 4.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# frontend
gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.1'
gem 'font-awesome-rails', '~> 4.7'
gem 'redcarpet', '~> 3.4.0'
gem 'slim', '~> 4.0'

gem 'activemodel-serializers-xml'

# Auth
gem 'omniauth-github'

# Friendly forms
gem 'simple_form'

# Image upload
gem 'carrierwave'
gem 'cloudinary'

# SEO
gem 'friendly_id'
gem 'route_translator'

# Collection of locale
gem 'rails-i18n', '~> 5.0'

# Errors and exceptions
gem 'rollbar'

# PDF
gem 'prawn'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'nokogiri', '>= 1.8.2'
gem 'listen'

group :development, :test do
  # Environment variables
  gem 'dotenv-rails'

  # Call 'byebug' anywhere in the code to stop execution to debug into a console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Setup easier than pg for development
  gem 'sqlite3'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 3.8'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  # https://stackoverflow.com/q/51762108
  gem 'database_cleaner', github: 'DatabaseCleaner/database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda'

  # Coverage
  gem 'codeclimate-test-reporter', require: nil
end

group :production do
  # The twelve-factor app
  gem 'rails_12factor'
end
