require "dotenv"
Dotenv.load

# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

# include rails-passenger-specific things
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/passenger'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
