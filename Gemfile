source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0.beta3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'bourbon'
# gem 'compass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.1'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Action Cable dependencies for the Redis adapter
gem 'redis', '~> 3.0'

# frontend
gem 'bootstrap-sass', '~> 3.3.1'
gem 'autoprefixer-rails'
gem 'font-awesome-rails', '~> 4.5.0'
gem 'slim', '~> 3.0.1'
gem 'redcarpet', '~> 3.3.1'
gem 'draper', github: 'audionerd/draper', branch: 'rails5' # TODO Back to official

gem 'activemodel-serializers-xml'

# Auth
gem 'omniauth-github'

# Friendly forms
gem 'simple_form'

# SEO
gem 'friendly_id'
gem 'route_translator', github: 'enriclluelles/route_translator', branch: 'feature/rails5' # TODO Back to official

# Collection of locale
gem 'rails-i18n', '~> 4.0.0'

# Errors and exceptions
gem 'rollbar'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  # Environment variables
  gem 'dotenv-rails'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Setup easier than pg for development
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
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
end
