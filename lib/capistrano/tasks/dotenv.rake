namespace :dotenv do
  desc 'Update env symlink after deploy'
  task :symlink_env do
    on roles(:app) do
      execute :ln, '-fs', fetch(:dotenv_path), "#{release_path}/.env"
    end
  end
  # need to do this before we try touching the database!
  before "deploy:migrate", "dotenv:symlink_env"
end
