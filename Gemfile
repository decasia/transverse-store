source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

# shared hosting only supports mysql
gem 'mysql2', '~> 0.4.4'

# cancan for permissions
gem 'cancancan', '~> 1.15.0'
gem 'bcrypt', '~> 3.1.5'

# TODO a V2 of the LTI gem is in beta. worth checking out later
gem 'ims-lti', '1.1.13'

gem 'knock', '~> 2.0'

# load config from .env
gem 'dotenv-rails', '~> 2.1.1'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

# json api
gem 'active_model_serializers', '~> 0.10.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  gem 'puma', '~> 3.0'
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-rails', '~> 1.1.8'
  gem 'capistrano-bundler', '~> 1.2'
  gem 'capistrano-passenger', '~> 0.2.0'

  gem 'pry-rails'

  # profiling
  gem 'derailed'
  gem 'stackprof'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
end
