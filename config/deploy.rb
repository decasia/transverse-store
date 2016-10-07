# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'transverse-store'
set :repo_url, ENV['DEPLOY_REPO']
set :passenger_restart_with_touch, true
set :keep_releases, 5
