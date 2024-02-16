# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.0'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.0'

# ROM
gem 'rom'
gem 'rom-factory'
gem 'rom-rails'
gem 'rom-repository'
gem 'rom-sql'

# Dry
gem 'dry-auto_inject'
gem 'dry-container'
gem 'dry-initializer'
gem 'dry-monads'
gem 'dry-rails'
gem 'dry-schema'
gem 'dry-validation'

# Jobs
gem 'redis'
gem 'sidekiq'

# DB
gem 'pg'

# Utils
gem 'bcrypt'
gem 'jwt'
gem 'rubocop'
gem 'rubocop-performance'
gem 'rubocop-rails', require: false
gem 'rubocop-rspec'

# Providers
gem 'stripe'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '>= 5.0'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[windows jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  gem 'dotenv-rails'
  # Tests
  gem 'database_cleaner-sequel'
  gem 'rspec-rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
